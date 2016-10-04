from django.shortcuts import render
from django.http import HttpResponse
from django.views.decorators.csrf import csrf_protect, csrf_exempt

from incidents.models import Incident
from django.db.models import Count
import json
from django.core.serializers.json import DjangoJSONEncoder

from django.utils import six
from django.core.exceptions import PermissionDenied
from django.contrib.auth.decorators import user_passes_test


# user permission
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


@permission_required('incidents.view_dashboard', login_url='/admin/login/')
def index(request):
    return render(request, 'dashboard/index.html')


@csrf_exempt
def get_summary(request):
    total_incidents = Incident.objects.count()
    confirmed_inc_count = Incident.objects.filter(validation__isnull=False).count()
    non_confirmed_count = total_incidents - confirmed_inc_count

    # incident chart disaster-wise
    chart_data = Incident.objects.filter(province__isnull=False).values('disaster_type__english').annotate(count=Count('id')).order_by('-count')

    province_data = Incident.objects.values('province').annotate(count=Count('id')).order_by('-count')

    data = {'total_incidents': total_incidents,
            'confirmed_inc_count': confirmed_inc_count,
            'non_confirmed_count': non_confirmed_count,
            'chart_data': json.dumps(list(chart_data), cls=DjangoJSONEncoder),
            'province_data': json.dumps(list(province_data), cls=DjangoJSONEncoder)

            }

    return HttpResponse(json.dumps(data, cls=DjangoJSONEncoder), content_type='application/json')
