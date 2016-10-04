from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^$', views.index, name='index'),
    url(r'^report/(?P<filter_type>[\w\-]+)/$', views.report, name='report'),
    url(r'^inc_date_data/(?P<filter_query>[\w\-]+)$', views.inc_date_data, name='inc_date_data')
]