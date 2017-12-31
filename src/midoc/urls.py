from rest_framework import routers
from django.conf.urls import url, include
from django.contrib import admin
from customuser.views import MyUserViewSet, AllergincReactionViewSet, \
    BackgroundViewSet, EmergencyAttentionViewSet, DoctorCallQueue
from plans.views import PlanViewSet,PlanPatientViewSet
from medicalhistory.views import MedicalHistoryAPIVIew, MedicalHistoryViewSet


router = routers.DefaultRouter()
router.register('users', MyUserViewSet)
router.register('allergic-reaction', AllergincReactionViewSet)
router.register('background', BackgroundViewSet)
router.register('emergency-attention', EmergencyAttentionViewSet)
router.register('plan', PlanViewSet)
router.register('plan-patient', PlanPatientViewSet)
router.register('medicalhistory', MedicalHistoryViewSet)
#router.register('doctor-queue', DoctorCallQueue)


urlpatterns = [
    url(r'^docs/', include('rest_framework_docs.urls')),
    url(r'^midoc-admin/', admin.site.urls),
    url(r'^api/', include(router.urls, namespace='api')),
    #url(r'^api2/', include(router2.urls, namespace='api2')),
    url(r'^api-auth/', include('rest_framework.urls', namespace='rest_framework')),
    url(r'^api/', include('customuser.urls', namespace='users')),

    url(r'^api/', include('medicalhistory.urls', namespace='medical_history')),
    url(r'^api/', include('competition.urls', namespace='competition')),
]
