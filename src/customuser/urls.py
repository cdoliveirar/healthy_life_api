from django.conf.urls import url
from .views import GroupsAPIVIew, LoginAPIView, FacebookMobileLoginAPI, \
    RetrieveUserAPIView, DoctorCallQueue

urlpatterns = [
    url(r'^login/$', LoginAPIView.as_view()),
    url(r'^login/mobile/(?P<backend>[^/]+)/$', FacebookMobileLoginAPI.as_view(),
        name="facebook-mobile-login"),
    url(r'^groups/$', GroupsAPIVIew.as_view(),
        name="groups"),
    url(r'^retrieve/$', RetrieveUserAPIView.as_view(),
        name="groups"),

    url(r'^doctor-queue/(?P<pk>\d+)/$', DoctorCallQueue.as_view())

]
