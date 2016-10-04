from django.utils import six
from django.core.exceptions import PermissionDenied
from django.contrib.auth.decorators import user_passes_test


class UserPermission:
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
