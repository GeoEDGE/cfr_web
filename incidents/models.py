from django.db import models
from users.models import MyUser

from django.conf import settings
import uuid

from settings.models import DisasterType
from django.forms import ModelForm


class Validation(models.Model):
    status = models.CharField(max_length=10, blank=True, null=True)
    validated_latitude = models.FloatField(blank=True, null=True)
    validated_longitude = models.FloatField(blank=True, null=True)
    comment = models.TextField(blank=True, null=True)
    date = models.DateTimeField(blank=True, null=True)
    user = models.ForeignKey(MyUser, blank=True, null=True)
    address = models.CharField(max_length=12, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'validation'


class Incident(models.Model):
    name = models.CharField(max_length=1000, blank=True, null=True)
    latitude = models.FloatField(blank=True, null=True)
    longitude = models.FloatField(blank=True, null=True)
    disaster_type = models.ForeignKey(DisasterType, db_column='disaster_type', blank=True, null=True)
    contact_no = models.CharField(max_length=12, blank=True, null=True)
    address = models.TextField(blank=True, null=True)
    synced_date = models.DateTimeField(blank=True, null=True)
    reported_date = models.DateTimeField(blank=True, null=True)
    description = models.TextField(blank=True, null=True)
    validation = models.ForeignKey('Validation', unique=True, blank=True, null=True)
    #validation = models.ForeignKey(Validation, blank=True, null=True)
    district = models.CharField(max_length=12, blank=True, null=True)
    province = models.CharField(max_length=12, blank=True, null=True)
    ds = models.CharField(max_length=12, blank=True, null=True)
    is_validated = models.BooleanField((('1', '-----------'), (True, 'Yes'), (False, 'No')))

    class Meta:
        managed = False
        db_table = 'incident'

    #def __str__(self):
    #    return self.disaster_type.english + " reported by " + self.name


class CloseEndQs(models.Model):
    disaster_type = models.ForeignKey(DisasterType, db_column='disaster_type', blank=True, null=True)
    question = models.CharField(max_length=1000, blank=True, null=True)
    field_name = models.CharField(max_length=255, blank=True, null=True)
    field_type = models.CharField(max_length=255, blank=True, null=True)
    si = models.CharField(max_length=255, blank=True, null=True)
    ta = models.CharField(max_length=255, blank=True, null=True)
    #choices = models.ForeignKey('CloseEndQs', blank=True, null=True)

    def __str__(self):
        return self.question

    class Meta:
        managed = False
        db_table = 'close_end_qs'


class CloseEndQsChoice(models.Model):
    choice = models.CharField(max_length=1000, blank=True, null=True)
    question = models.ForeignKey(CloseEndQs, blank=True, null=True)
    id = models.AutoField(primary_key=True)
    si = models.CharField(max_length=255, blank=True, null=True)
    ta = models.CharField(max_length=255, blank=True, null=True)
    class Meta:
        managed = False
        db_table = 'close_end_qs_choices'


class Photo(models.Model):
    #name = models.CharField(max_length=1000, blank=True, null=True)
    incident = models.ForeignKey(Incident, blank=True, null=True)
    name = models.ImageField("Uploaded image", upload_to='uploaded')

    class Meta:
        managed = False
        db_table = 'photo'


class AppPhoto(models.Model):
    name = models.CharField(max_length=1000, blank=True, null=True)
    incident = models.ForeignKey(Incident, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'photo'


class SocialMediaIncident(models.Model):
    title = models.CharField(max_length=255, blank=True, null=True)
    description = models.TextField(blank=True, null=True)
    validation = models.ForeignKey(Validation, blank=True, null=True)

    def __str__(self):
        return self.title

    class Meta:
        managed = False
        db_table = 'social_media_incident'


class GarbledIncident(models.Model):
    name = models.CharField(max_length=1000, blank=True, null=True)
    latitude = models.FloatField(blank=True, null=True)
    longitude = models.FloatField(blank=True, null=True)
    disaster_type = models.ForeignKey(DisasterType, db_column='disaster_type', blank=True, null=True)
    contact_no = models.CharField(max_length=12, blank=True, null=True)
    address = models.TextField(blank=True, null=True)
    synced_date = models.DateTimeField(blank=True, null=True)
    reported_date = models.DateTimeField(blank=True, null=True)
    description = models.TextField(blank=True, null=True)
    district = models.CharField(max_length=255, blank=True, null=True)
    province = models.CharField(max_length=255, blank=True, null=True)
    ds = models.CharField(max_length=255, blank=True, null=True)
    user = models.ForeignKey(MyUser, db_column='user', blank=True, null=True)
    deleted_date = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'garbled_incident'


class IncidentLanguageTranslation(models.Model):
    language = models.CharField(max_length=255, blank=True, null=True)
    incident_report_header = models.CharField(max_length=255, blank=True, null=True)
    incident_report_quote = models.CharField(max_length=1000, blank=True, null=True)
    inform_disaster = models.CharField(max_length=255, blank=True, null=True)
    click_to_get_location = models.CharField(max_length=255, blank=True, null=True)
    cancel = models.CharField(max_length=255, blank=True, null=True)
    incident = models.CharField(max_length=50, blank=True, null=True)
    successful_msg = models.CharField(max_length=100, blank=True, null=True)
    ok = models.CharField(max_length=10, blank=True, null=True)
    submit = models.CharField(max_length=255, blank=True, null=True)
    gps_location = models.CharField(max_length=255, blank=True, null=True)
    name = models.CharField(max_length=255, blank=True, null=True)
    contact_no = models.CharField(max_length=255, blank=True, null=True)
    disaster_type = models.CharField(max_length=255, blank=True, null=True)
    description = models.CharField(max_length=255, blank=True, null=True)
    images = models.CharField(max_length=255, blank=True, null=True)
    data_collection_form = models.CharField(max_length=255, blank=True, null=True)
    location_error_msg = models.CharField(max_length=255, blank=True, null=True)
    contact_no_validity_msg = models.CharField(max_length=255, blank=True, null=True)
    disaster_error_msg = models.CharField(max_length=255, blank=True, null=True)
    drop_down_select_display = models.CharField(max_length=50, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'incident_language_translation'


class IncidentUserChoices(models.Model):
    question = models.ForeignKey(CloseEndQs, blank=True, null=True)
    choice = models.ForeignKey(CloseEndQsChoice, blank=True, null=True)
    incident = models.ForeignKey(Incident, blank=True, null=True)
    text_input = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'incident_user_choices'


