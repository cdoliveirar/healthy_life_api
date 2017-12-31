#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""Settings celery. """


import os

import celery
import raven
from django.conf import settings
from raven.contrib.celery import register_logger_signal, register_signal

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'midoc.settings')

if settings.ENVIRONMENT == 'local':
    from celery import Celery
else:
    class Celery(celery.Celery):

        def on_configure(self):
            client = raven.Client(os.getenv('SENTRY_DSN'))

            # register a custom filter to filter out duplicate logs
            register_logger_signal(client)

            # hook into the Celery error handler
            register_signal(client)


app = Celery(__name__)
app.config_from_object('django.conf:settings', namespace='CELERY')
app.autodiscover_tasks(lambda: settings.INSTALLED_APPS)
