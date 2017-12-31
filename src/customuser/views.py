import json
from django.core.serializers.json import DjangoJSONEncoder
from django.contrib.auth.models import Group
from django.http import HttpResponse, Http404
from django.shortcuts import render
from rest_framework import viewsets, status, generics
from .serializers import MyUserSerializer, LoginSerializer, \
    FacebookLoginSerializer, GroupsSerializer, AllergincReactionSerializer, \
    BackgroundSerializer, EmergencyAttentionSerializer, MyUserRetrieveSerializer
from .models import MyUser, AllergincReaction, Background, EmergencyAttention
from rest_framework.authtoken.models import Token
from rest_framework.response import Response
from social_django.utils import psa
from django.utils.decorators import method_decorator
from rest_framework.permissions import IsAuthenticated
from .tasks import welcome_mail
from .utils import getAuthTicket


class RetrieveUserAPIView(generics.RetrieveAPIView):
    permission_classes = IsAuthenticated,
    serializer_class = MyUserRetrieveSerializer

    def get_object(self):
        return self.request.user


class GroupsAPIVIew(generics.ListAPIView):
    queryset = Group.objects.all()
    serializer_class = GroupsSerializer


class AllergincReactionViewSet(viewsets.ModelViewSet):
    queryset = AllergincReaction.objects.all()
    serializer_class = AllergincReactionSerializer


class BackgroundViewSet(viewsets.ModelViewSet):
    queryset = Background.objects.all()
    serializer_class = BackgroundSerializer
    search_fields = ('name',)


class EmergencyAttentionViewSet(viewsets.ModelViewSet):
    queryset = EmergencyAttention.objects.all()
    serializer_class = EmergencyAttentionSerializer


class MyUserViewSet(viewsets.ModelViewSet):
    """ Class MyUserViewSet. """

    queryset = MyUser.objects.exclude(is_superuser=True)
    serializer_class = MyUserSerializer
    filter_fields = (
        'email',
        'dni',
        'is_active',
        'created',
        'groups',
        'token_sinch',
    )
    ordering = (
        '-created',
    )
    search_fields = (
        'first_name',
        'last_name',
        'email',
        'dni',
        'cellphone',
        'groups',
        'groups_name',
    )

    def get_queryset(self):
        self.queryset = self.filter_by_groups_or_groups_name()
        return self.queryset

    def filter_by_groups_or_groups_name(self):
        groups = self.request.query_params.get('groups')
        group_name = self.request.query_params.get('group_name')
        if groups is not None:
            return MyUser.objects.get_users_by_groups(groups)
        elif group_name is not None:
            return MyUser.objects.get_users_by_group_name(group_name)
        return self.queryset

    def perform_create(self, serializer):
        user = serializer.save()
        user.set_password(self.request.data.get('password'))
        token, created = Token.objects.get_or_create(user=user)
        user.save()
        welcome_mail.delay(email=user.email)


class LoginAPIView(generics.GenericAPIView):
    serializer_class = LoginSerializer

    def post(self, request, *args, **kwargs):
        ticket = ""
        serializer = self.get_serializer(data=request.data,
                                         context={"request": request})
        is_valid = serializer.is_valid()
        if not is_valid:
            return Response({'status': status.HTTP_401_UNAUTHORIZED,
                             'details': "Email o password incorrecto"})

        if serializer.get_user().groups.first() is not None:
            if serializer.get_user().groups.first().name == "doctors":
                user = {'username': serializer.get_user().username}
                ticket = getAuthTicket(user)
            else:
                ticket = ""
        else:
            return Response({'status': status.HTTP_400_BAD_REQUEST,
                             'detail': 'El usuario no pertenece a un grupo'})
        token, created = Token.objects.get_or_create(user=serializer.get_user())
        return Response({'token': token.key, 'ticket': ticket,
                         'status': status.HTTP_200_OK})


class MobileLoginAPI(generics.GenericAPIView):
    serializer_class = LoginSerializer

    def post(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data,
                                         context={"request": request})
        is_valid = serializer.is_valid()
        if not is_valid:
            return Response({'status': status.HTTP_401_UNAUTHORIZED,
                             'details': "Email o password incorrecto"})
        token, created = Token.objects.get_or_create(user=serializer.get_user())

        return Response({'token': token.key}, status=status.HTTP_200_OK)


class FacebookMobileLoginAPI(MobileLoginAPI):
    serializer_class = FacebookLoginSerializer

    @method_decorator(psa('users:facebook-mobile-login'))
    def dispatch(self, request, *args, **kwargs):
        return super(FacebookMobileLoginAPI, self).dispatch(request, *args,
                                                            **kwargs)


class DoctorCallQueue(generics.GenericAPIView):
    serializer_class = MyUserSerializer

    """
    Retrieve, update a User instance.
    """

    def get_object(self, pk):
        try:
            return MyUser.objects.get(pk=pk)
        except MyUser.DoesNotExist:
            raise Http404

    def get(self, request, pk, format=None):
        doctor = self.get_object(pk)
        serializer = self.serializer_class(doctor)
        return Response(serializer.data)

    def put(self, request, pk, *args, **kwargs):
        doctor = self.get_object(pk)
        serializer = self.serializer_class(data=request.data)
        serializer.is_valid(raise_exception=True)
        vd = serializer.validated_data
        print(vd)
        print(vd.get("queue_count"))
        if doctor.queue_count is not None:
            doctor.queue_count = doctor.queue_count + int(vd.get("queue_count"))
        else:
            return Response({"detail": "queue_count is null"})
        while doctor.queue_count >= 0:
            if doctor.queue_count == 0:
                doctor.in_call = False
                doctor.save()

                response_msg = {'details': 'count updated',
                                'status': status.HTTP_200_OK}
                return HttpResponse(
                    json.dumps(response_msg, cls=DjangoJSONEncoder),
                    content_type='application/json')

            else:
                doctor.in_call = True
                doctor.save()

                d = {"id": doctor.pk, "cmd_peru": doctor.cmd_peru,
                     "degree": doctor.degree, "first_name": doctor.first_name,
                     "last_name": doctor.last_name,
                     "picture_url": doctor.url_photo,
                     "location_id": doctor.location_id,
                     "email": doctor.email,
                     "call_activate": doctor.call_activate,
                     "in_call": doctor.in_call,
                     "queue_count": doctor.queue_count}
                return Response(d)

        response_msg = {'details': 'Negative queue is not allowed',
                        'status': status.HTTP_403_FORBIDDEN}
        return HttpResponse(json.dumps(response_msg, cls=DjangoJSONEncoder),
                            content_type='application/json')
