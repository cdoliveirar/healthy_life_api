from django.conf.urls import url
from .views import (MedicalHistoryAPIVIew, ArtifactMeasurementWeight,
                    ArtifactMeasurementWeightNew, ArtifactMeasurementTemperatureNew,
                    ArtifactMeasurementTemperature, ArtifactMeasurementPressureNew,
                    ArtifactMeasurementPressure, DoctorAttentionPatient,
                    PatientByTokenList, MedicalHistoryByPatient,
                    PatientMedicalHistory,
                    )


urlpatterns = [
   # url(r'^medical-history/$', MedicalHistoryAPIVIew.as_view(), name='medical-history'),

    url(r'^body-weight/$', ArtifactMeasurementWeightNew.as_view(), name='medical-history'),
    url(r'^body-weight/(?P<patient_id>\d+)/$', ArtifactMeasurementWeight.as_view(), name='medical-history'),

    url(r'^body-temperature/$', ArtifactMeasurementTemperatureNew.as_view(), name='medical-history'),
    url(r'^body-temperature/(?P<patient_id>\d+)/$', ArtifactMeasurementTemperature.as_view(), name='medical-history'),

    url(r'^blood-pressure/(?P<patient_id>\d+)/$', ArtifactMeasurementPressureNew.as_view(), name='medical-history'),
    url(r'^blood-pressure/$', ArtifactMeasurementPressure.as_view(), name='medical-history'),


    url(r'^doctor-attention-patient/(?P<doctor_id>\d+)/$', DoctorAttentionPatient.as_view(), name='doctor-attention-patient'),

    url(r'^patient-token/(?P<token_sinch>[\w\-]+)/$', PatientByTokenList.as_view(), name='patient-token'),

    url(r'^patient-medical-history/$', PatientMedicalHistory.as_view(), name='patient_medical_history'),

    url(r'^medicalhistory-by-patient/(?P<patient_id>\d+)/$', MedicalHistoryByPatient.as_view(),
        name='medicalhistory-by-patient'),


    # url(r'^login/mobile/(?P<backend>[^/]+)/$', FacebookMobileLoginAPI.as_view(),
    #     name="facebook-mobile-login"),
    # url(r'^groups/$', GroupsAPIVIew.as_view(),
    #     name="groups"),
    # url(r'^retrieve/$', RetrieveUserAPIView.as_view(),
    #     name="groups"),

]