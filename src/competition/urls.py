from django.conf.urls import url
from .views import CompetitionView

urlpatterns = [
    url(r'^competition/$', CompetitionView.as_view()),

]