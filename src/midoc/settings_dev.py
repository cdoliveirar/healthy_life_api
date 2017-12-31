from .settings import *

DEBUG = True
SESSION_ENGINE = 'django.contrib.sessions.backends.db'
SESSION_CACHE_ALIAS = 'default'
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'midocdb',
        'USER': 'postgres',
        'PASSWORD': 'postgres',
        'HOST': 'localhost',
        'PORT': '',
    }
}
