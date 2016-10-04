"""cfr URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.8/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Add an import:  from blog import urls as blog_urls
    2. Add a URL to urlpatterns:  url(r'^blog/', include(blog_urls))
"""
from django.conf.urls import include, url
from django.contrib import admin
from django.conf import settings
from dashboard import views as dashboard_views
from django.conf.urls.static import static
from django.views.generic.base import TemplateView
from tastypie.api import Api
from api.resources import MapResource, LayerResource, IncidentResource, DisasterResource, \
    ValidationResource, GarbledIncidentResource, PhotoResource, AppPhotoResource, UserResource, IncidentLanguageTranslationResource, ProvinceResource, DistrictResource,\
    DsResource, GnResource, QuestionsResource, ChoicesResource, IncidentUserChoicesResource
#ValidationResource, GarbledIncidentResource, UserResource, PhotoResource

api = Api(api_name='v1')
api.register(MapResource())
api.register(LayerResource())
api.register(IncidentResource())
api.register(DisasterResource())
api.register(ValidationResource())
api.register(GarbledIncidentResource())
api.register(UserResource())
api.register(PhotoResource())
api.register(AppPhotoResource())
api.register(IncidentLanguageTranslationResource())
api.register(ProvinceResource())
api.register(DistrictResource())
api.register(DsResource())
api.register(GnResource())
api.register(QuestionsResource())
api.register(ChoicesResource())
api.register(IncidentUserChoicesResource())

urlpatterns = [
    url(r'^admin/', include(admin.site.urls)),
    url(r'^admin', include(admin.site.urls)),
    url(r'^api/', include(api.urls)),
    url(r'^incidents/', include('incidents.urls', namespace='incidents')),
    url(r'^maps/', include('maps.urls', namespace='maps')),
    url(r'^charts/', include('charts.urls', namespace='charts')),
    url(r'^reports/', include('reports.urls', namespace='reports')),
    url(r'^dashboard/', include('dashboard.urls', namespace='dashboard')),
    url(r'^users/', include('users.urls', namespace='users')),
    url(r'^i18n/', include('django.conf.urls.i18n')),
    url(r'^$', dashboard_views.index),
]

urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
