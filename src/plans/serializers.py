from rest_framework import serializers, status
from .tasks import plan_mail
from .models import Plan, PlanPatient, Payment
import culqipy


class PlanSerializer(serializers.ModelSerializer):
    class Meta:
        model = Plan
        fields = ('__all__')


class PlanPatientSerializer(serializers.ModelSerializer):
    class Meta:
        model = PlanPatient
        fields = ('__all__')

        extra_kwargs = {
            'patient': {'validators': []},
        }

    def create(self, validated_data):
        user = self.context.get("request").user
        plan_mail.delay(first_name=validated_data['extra_data']['first_name'],
                        last_name=validated_data['extra_data']['last_name'],
                        email=validated_data['extra_data']['email'],
                        plan=str(validated_data["plan"]), dni=user.dni,
                        address=validated_data['extra_data']['address'])
        if PlanPatient.objects.filter(patient=validated_data["patient"]):
            raise serializers.ValidationError(
                {"message": "El usuarios ya ha sido registrado"})
        if 'token_id' in validated_data['extra_data'] and \
                validated_data['extra_data'][
                    'payment_type'] == 'culqi-payment':
            dir_refund = {'address': validated_data['extra_data']['address'],
                          'address_city': validated_data['extra_data'][
                              'address_city'],
                          'country_code': 'PE',
                          'email': validated_data['extra_data']['email'],
                          'first_name': validated_data['extra_data'][
                              'first_name'],
                          'last_name': validated_data['extra_data'][
                              'last_name'],
                          'metadata': {'test': 'test'},
                          'phone_number': validated_data['extra_data'][
                              'phone_number']}
            customer = culqipy.Customer.create(dir_refund)
            if customer["object"] == "error":
                raise serializers.ValidationError(
                    {"message": customer["merchant_message"]})
            dir_card = {'customer_id': customer["id"],
                        'token_id': validated_data['extra_data']['token_id']}
            card = culqipy.Card.create(dir_card)
            if card["object"] == "error":
                raise serializers.ValidationError(
                    {"message": card["merchant_message"]})
            dir_subscription = {"card_id": card["id"],
                                "plan_id": validated_data["plan"].plan_culqi_id}
            subsbription = culqipy.Subscription.create(dir_subscription)
            if subsbription["object"] == "error":
                raise serializers.ValidationError(
                    {"message": subsbription["merchant_message"]})
            user.is_subscribe = True
            user.subscription_id = (subsbription["id"])
            user.available_calls += validated_data["plan"].calls_quantity
            user.save()
            Payment.objects.create(patient=validated_data["patient"],
                                   plan=validated_data["plan"],
                                   amount=validated_data["plan"].price)
            plan_mail.delay(first_name=validated_data['extra_data']['first_name'],
                            last_name=validated_data['extra_data']['last_name'],
                            email=validated_data['extra_data']['email'],
                            plan=str(validated_data["plan"]), dni=user.dni,
                            address=validated_data['extra_data']['address'])
        return super(PlanPatientSerializer, self).create(validated_data)
