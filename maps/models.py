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

from django.conf import settings

from layers.models import Layer


class Map(models.Model):
    title = models.CharField(max_length=1000, blank=True, null=True)
    name = models.CharField(max_length=1000, blank=True, null=True)
    date = models.DateTimeField(blank=True, null=True)
    description = models.TextField(blank=True, null=True)
    #user = models.ForeignKey(settings.AUTH_USER_MODEL)

    def __str__(self):
        return self.name

    class Meta:
        managed = False
        db_table = 'map'

class MapLayer(models.Model):
    map = models.ForeignKey(Map, blank=True, null=True)
    layer = models.ForeignKey(Layer, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'map_layer'






