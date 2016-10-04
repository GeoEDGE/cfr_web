
from django import forms
from .models import Incident


class IncidentForm(forms.ModelForm):

    class Meta:
        model = Incident
        fields = ('name', 'longitude', 'latitude', 'disaster_type', 'contact_no',
                  'address', 'description')
