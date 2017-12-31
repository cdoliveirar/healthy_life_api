# -*- coding: utf-8 -*-
from django.conf import settings
from django.core.mail.message import EmailMessage
from django.template import loader
from midoc.celery import app


@app.task
def send_recomendation_mail(data):
    gender = {
        'f': 'Femenino',
        'm': 'Masculino',
    }
    data['gender'] = gender[data['gender'].lower()]
    email_send = settings.EMAIL_SEND['recomendacion']
    template = loader.get_template(email_send['template'])
    html = template.render({'data': data})
    subject_user, from_email = email_send['title'], email_send['sender']
    message = EmailMessage(
        subject_user, html,
        from_email,
        [
            data['email'],
        ],
    )
    message.content_subtype = 'html'
    message.send(fail_silently=True)
