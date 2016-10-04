# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Layer',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('title', models.CharField(max_length=1000, null=True, blank=True)),
                ('name', models.CharField(max_length=1000, null=True, blank=True)),
                ('description', models.TextField(null=True, blank=True)),
                ('date', models.DateTimeField(null=True, blank=True)),
            ],
            options={
                'db_table': 'layer',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Style',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('sld_title', models.CharField(max_length=1000, null=True, blank=True)),
                ('name', models.CharField(max_length=1000, null=True, blank=True)),
                ('date', models.DateTimeField(null=True, blank=True)),
                ('url', models.CharField(max_length=2000, null=True, blank=True)),
            ],
            options={
                'db_table': 'style',
                'managed': False,
            },
        ),
    ]
