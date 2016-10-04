
from django.shortcuts import render, get_object_or_404, redirect
from django.http import HttpResponse
from django.views.decorators.csrf import csrf_protect, csrf_exempt
from django.conf import settings
from django.contrib.auth.decorators import login_required, permission_required

from django.db.models import Count
from django.core import serializers
from django.core.serializers.json import DjangoJSONEncoder
from incidents.models import Incident
from administrative_divisions.models import District
import random
import datetime
import time
import json

from django.utils import six
from django.core.exceptions import PermissionDenied
from django.contrib.auth.decorators import user_passes_test


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


# index page load
# checking user permission
@permission_required('incidents.access_chart_page', login_url='/admin/login/')
def index(request):
    context = {
        'districts': District.objects.all()
    }
    return render(request, 'charts/charts.html', context)


# load chart data
@csrf_exempt
def chart_data(request):
    report_data = None
    post_data = json.loads(request.body)
    filter_query = post_data['filter_query']

    # checking chart type
    if filter_query == 'date_icount':
        from_date = post_data['from_date']
        end_date = post_data['end_date']

        from_date = datetime.datetime.strptime(from_date, "%Y-%m-%d").date()
        end_date = datetime.datetime.strptime(end_date, "%Y-%m-%d").date()

        report_data = Incident.objects.filter(reported_date__range=(from_date, end_date)).\
            extra(select={'date': 'DATE(reported_date)'}).values('date').annotate(count=Count('id')).order_by('date')

    elif filter_query == 'district_icount':
        district = post_data['district']
        report_data = Incident.objects.filter(district=district).values('disaster_type__english')\
            .annotate(count=Count('id')).order_by('-count')

    return HttpResponse(json.dumps(list(report_data), cls=DjangoJSONEncoder), content_type='application/json')
