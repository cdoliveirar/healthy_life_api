# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2017-12-26 15:36
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('customuser', '0002_auto_20171221_1138'),
    ]

    operations = [
        migrations.AddField(
            model_name='myuser',
            name='url_photo',
            field=models.TextField(blank=True, null=True),
        ),
    ]