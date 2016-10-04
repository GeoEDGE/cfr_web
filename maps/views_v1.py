from django.conf import settings
from django.shortcuts import render
from settings.models import DisasterType
from administrative_divisions.models import District

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




