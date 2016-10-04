# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
#
# Also note: You'll have to insert the output of 'django-admin sqlcustom [app_label]'
# into your database.
from __future__ import unicode_literals

from django.db import models


class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=80)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    group = models.ForeignKey(AuthGroup)
    permission = models.ForeignKey('AuthPermission')

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group_id', 'permission_id'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType')
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type_id', 'codename'),)


class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.BooleanField()
    username = models.CharField(unique=True, max_length=30)
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=30)
    email = models.CharField(max_length=254)
    is_staff = models.BooleanField()
    is_active = models.BooleanField()
    date_joined = models.DateTimeField()
    province = models.ForeignKey('Province', blank=True, null=True)
    district = models.ForeignKey('District', blank=True, null=True)
    ds = models.ForeignKey('Ds', blank=True, null=True)
    gn = models.ForeignKey('Gn', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    user = models.ForeignKey(AuthUser)
    group = models.ForeignKey(AuthGroup)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user_id', 'group_id'),)


class AuthUserUserPermissions(models.Model):
    user = models.ForeignKey(AuthUser)
    permission = models.ForeignKey(AuthPermission)

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user_id', 'permission_id'),)


class CloseEndQs(models.Model):
    disaster_type = models.ForeignKey('DisasterType', db_column='disaster_type', blank=True, null=True)
    question = models.CharField(max_length=1000, blank=True, null=True)
    field_name = models.CharField(max_length=255, blank=True, null=True)
    field_type = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'close_end_qs'


class CloseEndQsChoices(models.Model):
    choice = models.CharField(max_length=1000, blank=True, null=True)
    question = models.ForeignKey(CloseEndQs, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'close_end_qs_choices'


class CorsheadersCorsmodel(models.Model):
    cors = models.CharField(max_length=255)

    class Meta:
        managed = False
        db_table = 'corsheaders_corsmodel'


class DisasterType(models.Model):
    english = models.CharField(max_length=1000, blank=True, null=True)
    sinhala = models.CharField(max_length=1000, blank=True, null=True)
    tamil = models.CharField(max_length=1000, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'disaster_type'


class District(models.Model):
    name = models.CharField(max_length=255, blank=True, null=True)
    province = models.ForeignKey('Province', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'district'


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.SmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', blank=True, null=True)
    user = models.ForeignKey(AuthUser)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'


class Ds(models.Model):
    name = models.CharField(max_length=255, blank=True, null=True)
    district = models.ForeignKey(District, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'ds'


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
    user = models.ForeignKey('UsersMyuser', db_column='user', blank=True, null=True)
    deleted_date = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'garbled_incident'


class Gn(models.Model):
    name = models.CharField(max_length=255, blank=True, null=True)
    ds = models.ForeignKey(Ds, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'gn'


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
    district = models.CharField(max_length=255, blank=True, null=True)
    province = models.CharField(max_length=255, blank=True, null=True)
    ds = models.CharField(max_length=255, blank=True, null=True)
    is_validated = models.NullBooleanField()

    class Meta:
        managed = False
        db_table = 'incident'


class IncidentLanguageTranslation(models.Model):
    language = models.CharField(max_length=255, blank=True, null=True)
    disasters = models.CharField(max_length=255, blank=True, null=True)
    gps_location = models.CharField(max_length=255, blank=True, null=True)
    name = models.CharField(max_length=255, blank=True, null=True)
    contact_no = models.CharField(max_length=255, blank=True, null=True)
    disaster_type = models.CharField(max_length=255, blank=True, null=True)
    description = models.CharField(max_length=255, blank=True, null=True)
    images = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'incident_language_translation'


class IncidentUserChoices(models.Model):
    question = models.ForeignKey(CloseEndQs, blank=True, null=True)
    choice = models.ForeignKey(CloseEndQsChoices, blank=True, null=True)
    incident = models.ForeignKey(Incident, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'incident_user_choices'


class Layer(models.Model):
    name = models.CharField(max_length=1000, blank=True, null=True)
    title = models.CharField(max_length=1000, blank=True, null=True)
    description = models.TextField(blank=True, null=True)
    date = models.DateTimeField(blank=True, null=True)
    user = models.ForeignKey(AuthUser, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'layer'


class Map(models.Model):
    name = models.CharField(max_length=1000, blank=True, null=True)
    date = models.DateTimeField(blank=True, null=True)
    description = models.TextField(blank=True, null=True)
    user = models.ForeignKey(AuthUser, blank=True, null=True)
    title = models.CharField(max_length=1000, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'map'


class MapLayer(models.Model):
    map = models.ForeignKey(Map, blank=True, null=True)
    layer = models.ForeignKey(Layer, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'map_layer'


class Photo(models.Model):
    name = models.CharField(max_length=1000, blank=True, null=True)
    incident = models.ForeignKey(Incident, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'photo'


class Province(models.Model):
    name = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'province'


class SocialMediaIncident(models.Model):
    title = models.CharField(max_length=255, blank=True, null=True)
    description = models.TextField(blank=True, null=True)
    validation = models.ForeignKey('Validation', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'social_media_incident'


class SpatialRefSys(models.Model):
    srid = models.IntegerField(primary_key=True)
    auth_name = models.CharField(max_length=256, blank=True, null=True)
    auth_srid = models.IntegerField(blank=True, null=True)
    srtext = models.CharField(max_length=2048, blank=True, null=True)
    proj4text = models.CharField(max_length=2048, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'spatial_ref_sys'


class Style(models.Model):
    sld_title = models.CharField(max_length=1000, blank=True, null=True)
    name = models.CharField(max_length=1000, blank=True, null=True)
    date = models.DateTimeField(blank=True, null=True)
    url = models.CharField(max_length=2000, blank=True, null=True)
    layer = models.ForeignKey(Layer, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'style'


class TastypieApiaccess(models.Model):
    identifier = models.CharField(max_length=255)
    url = models.CharField(max_length=255)
    request_method = models.CharField(max_length=10)
    accessed = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'tastypie_apiaccess'


class TastypieApikey(models.Model):
    key = models.CharField(max_length=128)
    created = models.DateTimeField()
    user = models.ForeignKey(AuthUser, unique=True)

    class Meta:
        managed = False
        db_table = 'tastypie_apikey'


class UsersCfruser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    username = models.CharField(unique=True, max_length=30)
    district = models.ForeignKey(District, blank=True, null=True)
    ds = models.ForeignKey(Ds, blank=True, null=True)
    gn = models.ForeignKey(Gn, blank=True, null=True)
    province = models.ForeignKey(Province, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'users_cfruser'


class UsersMyuser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.BooleanField()
    username = models.CharField(unique=True, max_length=30)
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=30)
    email = models.CharField(max_length=254)
    is_staff = models.BooleanField()
    is_active = models.BooleanField()
    date_joined = models.DateTimeField()
    province = models.ForeignKey(Province, blank=True, null=True)
    district = models.ForeignKey(District, blank=True, null=True)
    ds = models.ForeignKey(Ds, blank=True, null=True)
    gn = models.ForeignKey(Gn, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'users_myuser'


class UsersMyuserGroups(models.Model):
    myuser = models.ForeignKey(AuthUser)
    group = models.ForeignKey(AuthGroup)

    class Meta:
        managed = False
        db_table = 'users_myuser_groups'
        unique_together = (('myuser_id', 'group_id'),)


class UsersMyuserUserPermissions(models.Model):
    myuser = models.ForeignKey(UsersMyuser)
    permission = models.ForeignKey(AuthPermission)

    class Meta:
        managed = False
        db_table = 'users_myuser_user_permissions'
        unique_together = (('myuser_id', 'permission_id'),)


class Validation(models.Model):
    status = models.CharField(max_length=10, blank=True, null=True)
    validated_latitude = models.FloatField(blank=True, null=True)
    validated_longitude = models.FloatField(blank=True, null=True)
    comment = models.TextField(blank=True, null=True)
    date = models.DateTimeField(blank=True, null=True)
    user = models.ForeignKey(UsersMyuser, blank=True, null=True)
    address = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'validation'
