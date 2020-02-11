# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2017-12-27 23:58
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('customuser', '0004_myuser_username'),
    ]

    operations = [
        migrations.AddField(
            model_name='myuser',
            name='dir_token',
            field=models.CharField(blank=True, max_length=300, null=True),
        ),
        migrations.AddField(
            model_name='myuser',
            name='is_subscribe',
            field=models.BooleanField(default=False),
        ),
    ]