from tastypie import fields
from tastypie.resources import ModelResource
from tastypie.authorization import Authorization
from django.db.models import Count

from maps.models import Map
from incidents.models import Incident, Validation, GarbledIncident, Photo, AppPhoto, IncidentLanguageTranslation, CloseEndQs, CloseEndQsChoice, IncidentUserChoices
from layers.models import Layer
from settings.models import DisasterType
from users.models import MyUser
from django.contrib.auth import get_user_model
from administrative_divisions.models import Province, District, Ds, Gn


class MapResource(ModelResource):
    class Meta:
        queryset = Map.objects.all()


class LayerResource(ModelResource):
    class Meta:
        queryset = Layer.objects.all()
        allowed_methods = ['post', 'get', 'patch', 'delete']
        authorization = Authorization()


class DisasterResource(ModelResource):
    class Meta:
        queryset = DisasterType.objects.annotate(count=Count('english')).order_by('count')
        allowed_methods = ['post', 'get', 'patch', 'delete']
        authorization = Authorization()


class ProvinceResource(ModelResource):
    class Meta:
        queryset = Province.objects.all()
        allowed_methods = ['post', 'get', 'patch', 'delete']
        authorization = Authorization()


class DistrictResource(ModelResource):
    class Meta:
        queryset = District.objects.all()
        allowed_methods = ['post', 'get', 'patch', 'delete']
        authorization = Authorization()


class DsResource(ModelResource):
    class Meta:
        queryset = Ds.objects.all()
        allowed_methods = ['post', 'get', 'patch', 'delete']
        authorization = Authorization()


class GnResource(ModelResource):
    class Meta:
        queryset = Gn.objects.all()
        allowed_methods = ['post', 'get', 'patch', 'delete']
        authorization = Authorization()


class UserResource(ModelResource):
    province = fields.ForeignKey(ProvinceResource, 'province', full=True, null=True)
    district = fields.ForeignKey(DistrictResource, 'district', full=True, null=True)
    ds = fields.ForeignKey(DsResource, 'ds', full=True, null=True)
    gn = fields.ForeignKey(GnResource, 'gn', full=True, null=True)

    class Meta:
        queryset = MyUser.objects.all()
        filtering = {
            "username": ('exact'),
            "password": ('exact')
        }
        allowed_methods = ['get']
        authorization = Authorization()


class ValidationResource(ModelResource):
    user = fields.ForeignKey(UserResource, 'user', full=True, null=True)

    class Meta:
        queryset = Validation.objects.all()
        allowed_methods = ['post', 'get', 'patch', 'delete']
        authorization = Authorization()
        always_return_data = True


class IncidentResource(ModelResource):
    disaster_type = fields.ForeignKey(DisasterResource, 'disaster_type', full=True, null=True)
    validation = fields.ForeignKey(ValidationResource, 'validation', full=True, null=True)

    class Meta:
        queryset = Incident.objects.all()
        filtering = {
            "validation": ('isnull'),
            "disaster_type": ('exact'),
            "reported_date": ['gte', 'lte'],
            "district": ('exact'),
            "province": ('exact'),
            "is_validated": ('exact'),
        }
        allowed_methods = ['post', 'get', 'patch', 'delete']
        authorization = Authorization()
        always_return_data = True
        limit = 0


class QuestionsResource(ModelResource):
    disaster_type = fields.ForeignKey(DisasterResource, 'disaster_type', full=True, null=True)

    class Meta:
        queryset = CloseEndQs.objects.all()
        filtering = {
          'disaster_type': ('exact')
        }
        allowed_methods = ['post', 'get', 'patch', 'delete']
        authorization = Authorization()
        always_return_data = True


class ChoicesResource(ModelResource):
    question = fields.ForeignKey(QuestionsResource, 'question', full=True, null=True)

    class Meta:
        queryset = CloseEndQsChoice.objects.all()
        filtering = {

        }
        allowed_methods = ['post', 'get', 'patch', 'delete']
        authorization = Authorization()
        always_return_data = True


class IncidentUserChoicesResource(ModelResource):
    incident = fields.ForeignKey(IncidentResource, 'incident', full=True, null=True)
    question = fields.ForeignKey(QuestionsResource, 'question', full=True, null=True)
    choice = fields.ForeignKey(ChoicesResource, 'choice', full=True, null=True)

    class Meta:
        queryset = IncidentUserChoices.objects.all()
        filtering = {

        }
        allowed_methods = ['post', 'get', 'patch', 'delete']
        authorization = Authorization()
        always_return_data = True


class PhotoResource(ModelResource):
    incident = fields.ForeignKey(IncidentResource, 'incident', full=True, null=True)

    class Meta:
        queryset = Photo.objects.all()
        allowed_methods = ['post', 'get', 'patch', 'delete']
        filtering = {
            "incident": ('exact')
        }
        authorization = Authorization()


class AppPhotoResource(ModelResource):
    incident = fields.ForeignKey(IncidentResource, 'incident', full=True, null=True)

    class Meta:
        queryset = AppPhoto.objects.all()
        allowed_methods = ['post', 'get', 'patch', 'delete']
        filtering = {
            "incident": ('exact')
        }
        authorization = Authorization()


class GarbledIncidentResource(ModelResource):
    user = fields.ForeignKey(UserResource, 'user', full=True)
    disaster_type = fields.ForeignKey(DisasterResource, 'disaster_type', full=True, null=True)

    class Meta:
        queryset = GarbledIncident.objects.all()
        allowed_methods = ['post', 'get', 'patch', 'delete']
        authorization = Authorization()
        always_return_data = True


class IncidentLanguageTranslationResource(ModelResource):
    class Meta:
        queryset = IncidentLanguageTranslation.objects.all()
        allowed_methods = ['post', 'get', 'patch', 'delete']
        authorization = Authorization()
        always_return_data = True
        filtering = {
            "language": ('exact')
        }
