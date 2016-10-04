
from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^$', views.index, name='index'),
    #url(r'^incident_save/$', views.incident_save, name='incident_save'),
    url(r'^populate_incidents/$', views.populate_incidents, name='populate_incidents'),

]