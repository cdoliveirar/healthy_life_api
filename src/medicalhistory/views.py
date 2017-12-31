# -*- coding: utf-8 -*-
import json

from customuser.models import MyUser
from django.core.serializers.json import DjangoJSONEncoder
from django.http import HttpResponse
from rest_framework import generics, status, viewsets
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.views import APIView

from .models import ArtifactMeasurement, MedicalHistory, MedicalHistoryMedia
from .serializers import (
    ArtifactMeasurementSerializer,
    MedicalHistorySerializer, MedicalHistorySerializer2,
    PatientSerializer
)

# Create your views here.


class MedicalHistoryAPIVIew(generics.ListAPIView):
    permission_classes = IsAuthenticated,
    queryset = MedicalHistory.objects.all()
    serializer_class = MedicalHistorySerializer


class ArtifactMeasurementWeightNew(APIView):
    serializer_class = ArtifactMeasurementSerializer

    def post(self, request, format=None):
        serializer = self.serializer_class(data=request.data)
        serializer.is_valid(raise_exception=True)
        vd = serializer.validated_data

        try:
            artifact_list = ArtifactMeasurement.objects.filter(
                patient=vd.get('patient'),
            )
            print(artifact_list.count())
            for i, artifact in enumerate(artifact_list):
                am_date = artifact.measurement_date.strftime('%Y-%m-%d')
                # and artifact.weight == vd.get("weight"):
                if am_date == str(vd.get('measurement_date')):
                    artifact.weight = vd.get('weight')
                    artifact.save()
                # and artifact.weight != vd.get("weight"):
                elif am_date != str(vd.get('measurement_date')):
                    print(i)
                    if i == 1:
                        return Response('Ok computer')
                    artifact_o = ArtifactMeasurement(
                        weight=vd.get('weight'), patient_id=vd.get('patient'),
                        measurement_date=vd.get('measurement_date'),
                    )
                    artifact_o.save()

            if artifact_list.count() == 0:
                artifact_n = ArtifactMeasurement(
                    weight=vd.get('weight'), patient_id=vd.get('patient'),
                    measurement_date=vd.get('measurement_date'),
                )
                artifact_n.save()
                response_msg = {
                    'details': 'Peso del paciente: ' + vd.get('weight') + '',
                    'status': status.HTTP_200_OK,
                }
                return Response(response_msg)

            return Response('ok')

        except Exception as inst:
            print('>>> create failure')
            print(inst)
            response_msg = [{'create': 'failure'}]
            return HttpResponse(
                json.dumps(response_msg, cls=DjangoJSONEncoder),
                content_type='application/json',
            )


class ArtifactMeasurementWeight(APIView):

    def get(request, *args, **kwargs):
        patient_id = kwargs['patient_id']
        artifacts = ArtifactMeasurement.objects.filter(patient_id=patient_id)
        if artifacts:
            artifact_dict = [
                {
                    'weight': artifact.weight,
                    'measurement_date': artifact.measurement_date,
                } for artifact in artifacts
            ]
            measurement_weight = {'measurement_weight': artifact_dict}
            return Response(measurement_weight)
        response_msg = {
            'details': 'Aun no existe mediciones para este paciente',
            'status': status.HTTP_404_NOT_FOUND,
        }
        return Response(response_msg)


# Temperature
class ArtifactMeasurementTemperatureNew(APIView):
    serializer_class = ArtifactMeasurementSerializer

    def post(self, request, format=None):
        serializer = self.serializer_class(data=request.data)
        serializer.is_valid(raise_exception=True)
        vd = serializer.validated_data

        try:
            artifact_list = ArtifactMeasurement.objects.filter(
                patient=vd.get('patient'),
            )
            print(artifact_list.count())
            for i, artifact in enumerate(artifact_list):
                am_date = artifact.measurement_date.strftime('%Y-%m-%d')
                if am_date == str(vd.get('measurement_date')):
                    artifact.temperature = vd.get('temperature')
                    artifact.save()
                elif am_date != str(vd.get('measurement_date')):
                    if i == 1:
                        return Response('Ok computer')
                    artifact_o = ArtifactMeasurement(
                        temperature=vd.get('temperature'), patient_id=vd.get('patient'),
                        measurement_date=vd.get('measurement_date'),
                    )
                    artifact_o.save()

            if artifact_list.count() == 0:
                artifact_n = ArtifactMeasurement(
                    temperature=vd.get('temperature'), patient_id=vd.get('patient'),
                    measurement_date=vd.get('measurement_date'),
                )
                artifact_n.save()
                response_msg = {
                    'details': 'Peso del paciente: ' + vd.get('weight') + '',
                    'status': status.HTTP_200_OK,
                }
                return Response(response_msg)

            return Response('ok')

        except Exception as inst:
            print('>>> create failure')
            print(inst)
            response_msg = [{'create': 'failure'}]
            return HttpResponse(
                json.dumps(response_msg, cls=DjangoJSONEncoder),
                content_type='application/json',
            )


class ArtifactMeasurementTemperature(APIView):

    def get(request, *args, **kwargs):
        patient_id = kwargs['patient_id']
        artifacts = ArtifactMeasurement.objects.filter(patient_id=patient_id)
        if artifacts:
            artifact_dict = [
                {
                    'temperature': artifact.temperature,
                    'date_created': artifact.created,
                } for artifact in artifacts
            ]
            temperature = {'temperature': artifact_dict}
            return Response(temperature)
        response_msg = {
            'details': 'Aun no existe mediciones para este paciente',
            'status': status.HTTP_404_NOT_FOUND,
        }
        return Response(response_msg)


#  Pressure
class ArtifactMeasurementPressureNew(APIView):
    serializer_class = ArtifactMeasurementSerializer

    def post(self, request, format=None):
        serializer = self.serializer_class(data=request.data)
        serializer.is_valid(raise_exception=True)
        vd = serializer.validated_data
        print(vd)
        print(vd.get('patient'))
        print(vd.get('blood_pressure'))
        print(vd.get('measurement_date'))

        try:
            artifact_list = ArtifactMeasurement.objects.filter(
                patient=vd.get('patient'),
            )
            print(artifact_list.count())
            # for artifact in artifact_list:
            for i, artifact in enumerate(artifact_list):
                am_date = artifact.measurement_date.strftime('%Y-%m-%d')
                # am_date = artifact.created.strftime('%Y-%m-%d')
                if am_date == str(vd.get('measurement_date')):
                    artifact.blood_pressure = vd.get('blood_pressure')
                    artifact.save()
                elif am_date != str(vd.get('measurement_date')):
                    print(i)
                    if i == 1:
                        return Response('Ok computer')
                    artifact_o = ArtifactMeasurement(
                        blood_pressure=vd.get('blood_pressure'),
                        patient_id=vd.get(
                            'patient',
                        ),
                        measurement_date=vd.get('measurement_date'),
                    )
                    artifact_o.save()

            if artifact_list.count() == 0:
                artifact_n = ArtifactMeasurement(
                    blood_pressure=vd.get('blood_pressure'),
                    patient_id=vd.get('patient'),
                    measurement_date=vd.get('measurement_date'),
                )
                artifact_n.save()
                response_msg = {
                    'details': 'Peso del paciente: ' + vd.get('weight') + '',
                    'status': status.HTTP_200_OK,
                }
                return Response(response_msg)

            return Response('ok')

        except Exception as inst:
            print('>>> create failure')
            print(inst)
            response_msg = [{'create': 'failure'}]
            return HttpResponse(
                json.dumps(response_msg, cls=DjangoJSONEncoder),
                content_type='application/json',
            )


class ArtifactMeasurementPressure(APIView):

    def get(request, *args, **kwargs):
        patient_id = kwargs['patient_id']
        artifacts = ArtifactMeasurement.objects.filter(patient_id=patient_id)
        if artifacts:
            artifact_dict = [
                {
                    'blood_pressure': artifact.blood_pressure,
                    'date_created': artifact.created,
                } for artifact in artifacts
            ]
            return Response(artifact_dict)
        response_msg = {
            'details': 'Aun no existe mediciones para este paciente',
            'status': status.HTTP_404_NOT_FOUND,
        }
        return Response(response_msg)


# review patient list within medical history made by  one doctor
class DoctorAttentionPatient(APIView):
    permission_classes = IsAuthenticated,

    def get(self, request, *args, **kwargs):
        doctor_id = kwargs['doctor_id']
        if doctor_id:
            mhs = MedicalHistory.objects.filter(
                doctor_id=doctor_id,
            ).order_by('-created')
            # mhs = MedicalHistory.objects.filter(doctor_id=doctor_id).order_by('-created_date')
            print(mhs.count())
            patient_list = []
            for mh in mhs:
                patient = MyUser.objects.get(pk=mh.patient_id)
                # patient = MyUser.objects.get(pk=mh.patient.pk)
                patient_list.append(patient)
                # print(patient_list)
            patient_dict2 = [
                {
                    'id': patient.pk, 'First_name': patient.first_name,
                    'last_name': patient.last_name, 'email': patient.email, 'dni': patient.dni,
                    'picture_url': patient.url_photo, 'blood_type': patient.blood_type,
                    'allergic_reaction': patient.allergic_reaction.name,
                    'token_sinch': patient.token_sinch, 'size': patient.size,
                    'gender': patient.gender, 'contact_phone': patient.cellphone,
                    'created_date': patient.created,
                } for patient in patient_list
            ]
            doctor_attention = {'doctor-attention': patient_dict2}
            print(doctor_attention)
            return Response(doctor_attention)


class PatientByTokenList(APIView):
    permission_classes = IsAuthenticated,

    # renderer_classes = (JSONRenderer,)
    def get(request, *args, **kwargs):
        token_sinch = kwargs['token_sinch']
        is_token_sinch = MyUser.objects.filter(
            token_sinch__exact=token_sinch,
        ).exists()
        print(is_token_sinch)
        if is_token_sinch:
            patient_list = MyUser.objects.filter(
                token_sinch__exact=token_sinch,
            )
            print(patient_list)
            patient_dict = [
                {
                    'id': patient.pk, 'first_name': patient.first_name,
                    'last_name': patient.last_name,
                    'email': patient.email, 'dni': patient.dni,
                    'picture_url': patient.url_photo,
                    'blood_type': patient.blood_type,
                    'allergic_reaction': patient.allergic_reaction.name,
                    'token_sinch': patient.token_sinch,
                    'size': patient.size, 'gender': patient.gender,
                    'cellphone': patient.cellphone,
                } for patient in patient_list
            ]
            return Response(patient_dict)
        else:
            response_msg = [
                {'warning': 'This token not exist:%s' % token_sinch},
            ]
            return Response(response_msg)


class MedicalHistoryByPatient(generics.GenericAPIView):
    permission_classes = IsAuthenticated,

    def get(self, request, *args, **kwargs):
        patient_id = kwargs['patient_id']
        if patient_id:
            mhs = MedicalHistory.objects.filter(
                patient_id=patient_id,
            ).order_by('-created')
            medical_history = [
                {
                    'id': mh.pk, 'symptom': mh.symptom,
                    'doctor_comment': mh.doctor_comment,
                    'diagnostic': mh.diagnostic,
                    'weight': mh.weight,
                    'temperature': mh.temperature,
                    'blood_pressure': mh.blood_pressure,
                    'heart_rate': mh.heart_rate,
                    'created': mh.created,
                } for mh in mhs
            ]
            medical_history_list = {'medical_history': medical_history}
            return Response(medical_history_list)
        else:
            response_msg = {
                'details': 'Este Patiente no existe o no fue aun registrado',
                'status': status.HTTP_409_CONFLICT,
            }
            print(response_msg)
            return HttpResponse(
                json.dumps(response_msg, cls=DjangoJSONEncoder),
                content_type='application/json',
            )


class PatientMedicalHistory(APIView):
    serializer_class = PatientSerializer
    #permission_classes = IsAuthenticated,

    def post(self, request, format=None):
        serializer = self.serializer_class(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        # vd = serializer.validated_data

        response_msg = {
            'details': 'La Historia medica fue insertada',
            'status': status.HTTP_201_CREATED,
        }
        return HttpResponse(
            json.dumps(response_msg, cls=DjangoJSONEncoder),
            content_type='application/json',
        )

        # return Response("Fisnish POST response")

    def put(self, request, format=None):
        try:
            serializer = self.serializer_class(data=request.data)
            serializer.is_valid(raise_exception=True)
            patient_id = request.data['id']
            patient = MyUser.objects.get(pk=patient_id)
            serializer.update(patient, request.data)

            response_msg = {
                'details': 'La historia medica fue actualizada',
                'status': status.HTTP_200_OK,
            }
            return HttpResponse(
                json.dumps(response_msg, cls=DjangoJSONEncoder),
                content_type='application/json',
            )
        except Exception as inst:
            response_msg = {
                'details': inst,
                'status': status.HTTP_409_CONFLICT,
            }
            return HttpResponse(
                json.dumps(response_msg, cls=DjangoJSONEncoder),
                content_type='application/json',
            )


class MedicalHistoryViewSet(viewsets.ModelViewSet):
    queryset = MedicalHistory.objects.all()
    serializer_class = MedicalHistorySerializer
