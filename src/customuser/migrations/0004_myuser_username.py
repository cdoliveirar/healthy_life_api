# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2017-12-26 19:25
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('customuser', '0003_myuser_url_photo'),
    ]

    operations = [
        migrations.AddField(
            model_name='myuser',
            name='username',
            field=models.CharField(blank=True, max_length=50, null=True),
        ),
    ]