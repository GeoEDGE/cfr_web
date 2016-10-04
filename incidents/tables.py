import django_tables2 as tables

from .models import Incident


class IncidentTable(tables.Table):

    class Meta:
        model = Incident
        per_page = 10
        fields = ['name', 'disaster_type', 'province', 'district', 'reported_date']
        attrs = {'class': 'table table-bordered table-responsive'}
    More_Details = tables.LinkColumn("incidents:incident_details", kwargs={"id": tables.A("pk")}, empty_values=(), text='More')

