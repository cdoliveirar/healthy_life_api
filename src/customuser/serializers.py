from django.contrib.auth.models import Group
from .models import MyUser, AllergincReaction, Background, EmergencyAttention
from django.contrib.auth import authenticate, login
from rest_framework import serializers
from requests.exceptions import HTTPError
from rest_framework.authtoken.models import Token
from datetime import datetime
from dateutil import relativedelta
from PIL import Image
from io import BytesIO
from django.core.files.uploadedfile import InMemoryUploadedFile
import sys


class AllergincReactionSerializer(serializers.ModelSerializer):
    class Meta:
        model = AllergincReaction
        fields = ('__all__')


class BackgroundSerializer(serializers.ModelSerializer):
    class Meta:
        model = Background
        fields = ('__all__')


class EmergencyAttentionSerializer(serializers.ModelSerializer):
    class Meta:
        model = EmergencyAttention
        fields = ('__all__')


class GroupsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Group
        fields = ('id', 'name')


class MyUserRetrieveSerializer(serializers.ModelSerializer):
    age = serializers.SerializerMethodField(read_only=True)

    def get_age(self, obj):
        today = datetime.utcnow().date()
        r = relativedelta.relativedelta(today, obj.birth_date)
        age = r.years
        return int(age)

    class Meta:
        model = MyUser
        exclude = (
            'user_permissions',
            'is_superuser',
            'is_staff',
        )
        read_only_fields = (
            'is_active',
            'is_admin',
            'is_superuser',
            'last_login',
            'created',
        )
        extra_kwargs = {
            'password': {'write_only': True},
        }
        write_only_fields = ('password',)


class MyUserSerializer(serializers.ModelSerializer):
    password = serializers.CharField(required=False, write_only=True)
    email = serializers.EmailField(required=False)
    age = serializers.SerializerMethodField(read_only=True)

    def get_age(self, obj):
        today = datetime.utcnow().date()
        r = relativedelta.relativedelta(today, obj.birth_date)
        age = r.years
        return int(age)
    def validate_gender(self, value):
        if value == 'M' or value == 'm':
            return 'm'
        if value == 'F' or value == 'f':
            return 'f'

    def current_user(self):
        return self.context.get('request').user

    def validate_associated_code(self, value):
        user = self.current_user()
        if user.is_associated_external():
            return user.code
        return value

    def validate_email(self, value):
        return value.lower()

    def update(self, instance, validated_data):
        if "photo" in validated_data:
            img = validated_data['photo']
            im = Image.open(img)
            output = BytesIO()
            im = im.resize((200, 200))
            im.save(output, format='JPEG', quality=95)
            output.seek(0)
            validated_data['photo'] = InMemoryUploadedFile(output, 'ImageField',
                                                           "%s.jpg" %
                                                           validated_data[
                                                               'photo'].name.split(
                                                               '.')[0],
                                                           'image/jpeg',
                                                           sys.getsizeof(
                                                               output), None)
        return super(MyUserSerializer, self).update(
            instance,
            validated_data
        )

    class Meta:
        model = MyUser
        exclude = (
            'user_permissions',
            'is_superuser',
            'is_staff',
        )
        read_only_fields = (
            'is_active',
            'is_admin',
            'is_superuser',
            'last_login',
            'created',
        )
        extra_kwargs = {
            'password': {'write_only': True},
        }
        write_only_fields = ('password',)


class LoginSerializer(serializers.Serializer):
    email = serializers.EmailField(
        error_messages={"blank": "Este campo es obligatorio"})
    password = serializers.CharField(
        error_messages={"blank": "Este campo es obligatorio"})

    def validate(self, attrs):
        self.user_cache = authenticate(email=attrs["email"],
                                       password=attrs["password"])
        if not self.user_cache:
            raise serializers.ValidationError("Invalid login")
        return attrs

    def get_user(self):
        return self.user_cache


class FacebookLoginSerializer(serializers.Serializer):
    access_token = serializers.CharField(
        error_messages={"blank": "Este campo es obligatorio"})

    def validate(self, attrs):
        request = self.context.get("request")
        self.user_cache = None
        try:
            self.user_cache = request.backend.do_auth(attrs.get("access_token"))
            login(request, self.user_cache)
            return attrs
        except HTTPError:
            raise serializers.ValidationError("Invalid facebook token")

    def get_user(self):
        return self.user_cache
