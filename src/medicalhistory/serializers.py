# -*- coding: utf-8 -*-
from customuser.views import MyUser
from rest_framework import serializers

from .models import ArtifactMeasurement, MedicalHistory
from .tasks import send_recomendation_mail


class MedicalHistorySerializer(serializers.ModelSerializer):

    class Meta:
        model = MedicalHistory
        fields = '__all__'
        # depth = 1


class ArtifactMeasurementSerializer(serializers.ModelSerializer):
    # patient = serializers.PrimaryKeyRelatedField(many=True, read_only=True)
    patient = serializers.IntegerField(allow_null=True)
    token_sinch = serializers.CharField(allow_blank=True, required=False)
    weight = serializers.CharField(
        max_length=10, allow_blank=True, required=False,
    )
    body_temperature = serializers.CharField(
        max_length=10, allow_blank=True, required=False,
    )
    blood_pressure = serializers.CharField(
        max_length=10, allow_blank=True, required=False,
    )
    measurement_date = serializers.DateField(format='%Y-%m-%d')
    # created = serializers.DateField(format="%Y-%m-%d")

    class Meta:
        model = ArtifactMeasurement
        fields = (
            'patient', 'token_sinch', 'weight', 'body_temperature', 'blood_pressure',
            'measurement_date',
        )


class MedicalHistorySerializer2(serializers.ModelSerializer):
    class Meta:
        model = MedicalHistory
        fields = (
            'id', 'doctor_id', 'symptom', 'doctor_comment', 'diagnostic', 'weight',
            'temperature', 'blood_pressure', 'heart_rate',
        )


class PatientSerializer(serializers.ModelSerializer):
    patients_medical_histories = MedicalHistorySerializer2(many=True)

    class Meta:
        model = MyUser
        fields = (
            'id', 'gender', 'birth_date',
            'background', 'patients_medical_histories',
        )

    def create(self, validated_data):
        patients_medical_histories = validated_data.pop(
            'patients_medical_histories',
        )
        patient = MyUser.objects.create(**validated_data)
        for medical_history in patients_medical_histories:
            MedicalHistory.objects.create(patient=patient, **medical_history)
        return patient

    def update(self, instance, validated_data):
        # try:
        medical_histories_data = validated_data.pop(
            'patients_medical_histories',
        )
        medical_histories = (instance.patients_medical_histories).all()
        medical_histories = list(medical_histories)
        # validated_data.get()

        # instance.first_name = validated_data.get('first_name', instance.first_name)
        # instance.last_name = validated_data.get('last_name', instance.last_name)
        # instance.email = validated_data.get('email', instance.email)
        # instance.dni = validated_data.get('dni', instance.dni)
        # instance.url_photo = validated_data.get('url_photo', instance.url_photo)
        # instance.blood_type = validated_data.get('blood_type', instance.blood_type)
        # instance.allergic_reaction = validated_data.get('allergic_reaction', instance.allergic_reaction)
        # instance.token_sinch = validated_data.get('token_sinch', instance.token_sinch)
        # instance.size = validated_data.get('size', instance.size)
        # instance.cellphone = validated_data.get('cellphone', instance.cellphone)
        instance.gender = validated_data.get('gender', instance.gender)
        instance.birth_date = validated_data.get(
            'birth_date', instance.birth_date,
        )

        instance.background = validated_data.get(
            'background', instance.background,
        )
        # instance.created = validated_data.get('created', instance.created)
        data = {
            'first_name': instance.first_name,
            'email': instance.email,
            'gender': instance.gender,
            'cellphone': instance.cellphone,
            'dni': instance.dni,
        }
        instance.save()

        for medical_history_data in medical_histories_data:
            mh_id = medical_history_data.get('id', None)
            data['symptom'] = medical_history_data['symptom']
            data['diagnostic'] = medical_history_data['diagnostic']
            data['recommendations'] = medical_history_data['doctor_comment']
            send_recomendation_mail.delay(data=data)

            if not mh_id:
                MedicalHistory.objects.create(
                    patient=instance, **medical_history_data
                )
                continue

            mh = MedicalHistory.objects.get(id=mh_id, patient=instance)
            mh.doctor_id = medical_history_data.get(
                'doctor_id', mh.doctor_id,
            )
            mh.symptom = medical_history_data.get('symptom', mh.symptom)
            mh.doctor_comment = medical_history_data.get(
                'doctor_comment', mh.doctor_comment,
            )
            mh.diagnostic = medical_history_data.get(
                'diagnostic', mh.diagnostic,
            )
            mh.weight = medical_history_data.get('weight', mh.weight)
            mh.temperature = medical_history_data.get(
                'temperature', mh.temperature,
            )
            mh.blood_pressure = medical_history_data.get(
                'blood_pressure', mh.blood_pressure,
            )
            mh.heart_rate = medical_history_data.get(
                'heart_rate', mh.heart_rate,
            )
            mh.save()

        return instance
