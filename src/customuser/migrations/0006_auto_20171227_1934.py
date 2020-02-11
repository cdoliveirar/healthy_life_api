# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2017-12-28 00:34
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('customuser', '0005_auto_20171227_1858'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='myuser',
            name='dir_token',
        ),
        migrations.AddField(
            model_name='myuser',
            name='subscription_id',
            field=models.CharField(blank=True, help_text='id of subscription', max_length=300, null=True),
        ),
    ]