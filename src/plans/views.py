from django.shortcuts import render
from rest_framework import viewsets, generics, status
# Create your views here.
from rest_framework.permissions import IsAuthenticated

from .models import Plan, PlanPatient
from .serializers import PlanSerializer, PlanPatientSerializer


class PlanViewSet(viewsets.ModelViewSet):
    queryset = Plan.objects.filter(is_active=True)
    serializer_class = PlanSerializer


class PlanPatientViewSet(viewsets.ModelViewSet):
    permission_classes = IsAuthenticated,
    queryset = PlanPatient.objects.all()
    serializer_class = PlanPatientSerializer



