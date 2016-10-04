# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('incidents', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='GarbledIncident',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=1000, null=True, blank=True)),
                ('latitude', models.FloatField(null=True, blank=True)),
                ('longitude', models.FloatField(null=True, blank=True)),
                ('contact_no', models.CharField(max_length=12, null=True, blank=True)),
                ('address', models.TextField(null=True, blank=True)),
                ('synced_date', models.DateTimeField(null=True, blank=True)),
                ('reported_date', models.DateTimeField(null=True, blank=True)),
                ('description', models.TextField(null=True, blank=True)),
                ('district', models.CharField(max_length=255, null=True, blank=True)),
                ('province', models.CharField(max_length=255, null=True, blank=True)),
                ('ds', models.CharField(max_length=255, null=True, blank=True)),
                ('deleted_date', models.DateTimeField(null=True, blank=True)),
            ],
            options={
                'db_table': 'garbled_incident',
                'managed': False,
            },
        ),
    ]
