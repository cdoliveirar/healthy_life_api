# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2017-12-27 23:58
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('plans', '0004_auto_20171227_1710'),
    ]

    operations = [
        migrations.AlterField(
            model_name='plan',
            name='plan_culqi_id',
            field=models.CharField(blank=True, max_length=300, null=True),
        ),
    ]