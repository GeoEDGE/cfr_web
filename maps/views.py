from django.conf import settings
from django.shortcuts import render
from settings.models import DisasterType
from administrative_divisions.models import District

from django.utils import six
from django.core.exceptions import PermissionDenied
from django.contrib.auth.decorators import user_passes_test
from django.http import HttpResponse

from incidents.models import Incident
import json
from django.views.decorators.csrf import csrf_protect, csrf_exempt
import ast
import collections
from django.core.serializers.json import DjangoJSONEncoder
import datetime
import time


def permission_required(perm, login_url=None, raise_exception=True):
    def check_perms(user):
        if isinstance(perm, six.string_types):
            perms = (perm, )
        else:
            perms = perm
        if user.has_perms(perms):
            return True
        if raise_exception and user.pk:
            raise PermissionDenied
        return False
    return user_passes_test(check_perms, login_url=login_url)


@permission_required('incidents.access_map_page', login_url='/admin/login/')
def index(request):
    disaster_list = DisasterType.objects.order_by('english')
    district_list = District.objects.order_by('name')
    download_formats = settings.LAYER_DOWNLOAD_FROMATS
    context = {'disasters': disaster_list,
               'download_formats': download_formats,
               'districts': district_list
               }
    return render(request, 'maps/map.html', context)


def seq_iter(obj):
    return obj if isinstance(obj, dict) else xrange(len(obj))


@csrf_exempt
def populate_incidents(request):
    post_data = json.loads(request.body)
    view_params = None
    if 'view_params' in post_data:
        view_params = post_data['view_params']
        param_dict = (ast.literal_eval(view_params))

        filter_dict = {'reported_date__gt': "2016-09-28",
                   'reported_date__lt': "2016-09-28",

                   }

    incidents = None
    incidents = Incident.objects.extra(select={'date': 'DATE(reported_date)'}). \
        values('latitude', 'longitude', 'is_validated', 'district', 'date', 'name', 'disaster_type__code',
               'disaster_type__english').order_by('id')
    if 'view_params' in post_data:
        if not (param_dict is None):
            for i in seq_iter(param_dict):
                filter_option = {}
                filter_option[i] = param_dict[i]

                incidents = incidents.filter(**filter_option).extra(select={'date': 'DATE(reported_date)'}).values(
                    'latitude', 'longitude', 'district', 'name', 'date', 'is_validated', 'disaster_type__code',
                    'disaster_type__english').order_by('id')

    return HttpResponse(json.dumps(list(incidents), cls=DjangoJSONEncoder), content_type='application/json')
    #return HttpResponse(('ok'))





