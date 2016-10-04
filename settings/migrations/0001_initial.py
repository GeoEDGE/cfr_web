# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='DisasterType',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('english', models.CharField(max_length=1000, null=True, blank=True)),
                ('sinhala', models.CharField(max_length=1000, null=True, blank=True)),
                ('tamil', models.CharField(max_length=1000, null=True, blank=True)),
            ],
            options={
                'db_table': 'disaster_type',
                'managed': False,
            },
        ),
    ]
