# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Incident',
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
            ],
            options={
                'db_table': 'incident',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Photo',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=1000, null=True, blank=True)),
            ],
            options={
                'db_table': 'photo',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='SocialMediaIncident',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('title', models.CharField(max_length=255, null=True, blank=True)),
                ('description', models.TextField(null=True, blank=True)),
            ],
            options={
                'db_table': 'social_media_incident',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Validation',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('status', models.CharField(max_length=10, null=True, blank=True)),
                ('validated_latitude', models.FloatField(null=True, blank=True)),
                ('validated_longitude', models.FloatField(null=True, blank=True)),
                ('comment', models.TextField(null=True, blank=True)),
                ('date', models.DateTimeField(null=True, blank=True)),
            ],
            options={
                'db_table': 'validation',
                'managed': False,
            },
        ),
    ]
