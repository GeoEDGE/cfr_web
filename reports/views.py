from django.shortcuts import render
from django.http import HttpResponse
from django.views.decorators.csrf import csrf_protect, csrf_exempt

from incidents.models import Incident
from administrative_divisions.models import District
from django.core import serializers
from django.core.serializers.json import DjangoJSONEncoder
from django.db.models import Count
import json
import datetime
from django.conf import settings
from datetime import date
import os

import csv
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


@permission_required('incidents.access_report_page', login_url='/admin/login/')
def index(request):
    return render(request, 'reports/reports_main.html')


def report(request, filter_type):

    disaster_list = District.objects.all()

    context = {
        'filter_type': filter_type,
        'districts': disaster_list
    }

    return render(request, 'reports/reports.html', context)


@csrf_exempt
def inc_date_data(request, filter_query):
    report_data = None
    post_data = json.loads(request.body)
    from_date = post_data['from_date']
    end_date = post_data['end_date']
    is_export = post_data['is_export']
    csv_headers = None

    from_date = datetime.datetime.strptime(from_date, "%Y-%m-%d").date()
    end_date = datetime.datetime.strptime(end_date, "%Y-%m-%d").date()

    if filter_query == 'date_icount':
        report_data = Incident.objects.filter(reported_date__range=(from_date, end_date)).\
            extra(select={'date': 'DATE(reported_date)'}).values('date').annotate(count=Count('id')).order_by('-count')
        csv_headers = ['Date', 'Count']

    elif filter_query == 'district_disaster':
        district = post_data['district']
        report_data = Incident.objects.filter(district=district).\
            values('district', 'disaster_type__english')\
            .annotate(count=Count('id')).order_by('-count')
        csv_headers = ['Disaster Type', 'Count']

    if is_export:

        response = HttpResponse('', content_type='application/x-download;charset=utf-8')
        response['Content-Disposition'] = 'attachment; filename="books.xls"'

        writer = csv.writer(response)

        writer.writerow(csv_headers)
        for row in report_data:
            if filter_query == 'date_icount':
                writer.writerow([row['date'], row['count']])
            else:
                writer.writerow([row['disaster_type__english'], row['count']])

        return response
    else:
        return HttpResponse(json.dumps(list(report_data), cls=DjangoJSONEncoder), content_type='application/json')

