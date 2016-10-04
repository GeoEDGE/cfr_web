import django_filters
from .models import Incident
from administrative_divisions.models import District
from distutils.util import strtobool

DISTRICT_CHOICES = list()
DISTRICT_CHOICES.append(('', '-----------'))

DISTRICT_CHOICES.extend(list(District.objects.values_list('name', 'name').order_by('name')))
VALIDATION_CHOICES = (
    ('1', '-----------'),
    ('2', 'Yes'),
    ('3', 'No'),

)


class IncidentFilter(django_filters.FilterSet):
    reported_date = django_filters.DateFromToRangeFilter()
    district = django_filters.ChoiceFilter(choices=DISTRICT_CHOICES, initial='0')
    is_validated = django_filters.BooleanFilter()

    class Meta:
        model = Incident
        fields = ['name', 'disaster_type']

