from django.shortcuts import render
from rest_framework import viewsets
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from .models import Competition
from .serializer import CompetitionSerializer


class CompetitionView(APIView):
    serializer_class = CompetitionSerializer

    def get(self, request, format=None):
        serializer = self.serializer_class(Competition.objects.all(), many=True)
        return Response(serializer.data)

    # queryset = Competition.objects.filter()
    # serializer_class = CompetitionSerializer

    def post(self, request, format=None):
        serializer = self.serializer_class(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)