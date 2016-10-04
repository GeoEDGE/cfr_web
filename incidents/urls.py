
from django.conf.urls import url
from .tables import IncidentTable

from . import views
from .views import incident_list
from .models import Incident

urlpatterns = [
    url(r'^(?P<language>[\w\-]+)$', views.index, name='index'),
    url(r'^incident_form/(?P<language>[\w\-]+)$', views.incident_form, name='incident_form'),
    #url(r'^incident_list', incident_list.as_view(), name='incident_list'),
    url(r'^incident_list/', incident_list.as_view(), name='incident_list'),
    #url(r'^incident_list', incident_list, name='incident_list'),
    url(r'^incident_save/$', views.incident_save, name='incident_save'),
    url(r'^save_validation/$', views.save_validation, name='save_validation'),
    url(r'^incident_details/(?P<id>[\w\-]+)$', views.incident_details, name='incident_details'),
    url(r'^discard_incident/$', views.discard_incident, name='discard_incident'),
    url(r'^select_questions/$', views.select_questions, name='select_questions'),
    url(r'^send_email/$', views.send_email, name='send_email'),
    url(r'^incident_details_test/$', views.incident_details_test, name='incident_details_test'),
    url(r'^save_app_qs', views.save_app_qs, name='save_app_qs'),
    url(r'^send_mail_app/', views.send_mail_app, name='send_mail_app'),

]
