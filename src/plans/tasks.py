from django.template import loader
from django.core.mail.message import EmailMessage
from midoc.celery import app
from django.conf import settings
from .models import Plan


@app.task(name='plan_mail')
def plan_mail(first_name, last_name, email, plan, dni, address):
    plan = Plan.objects.get(name=plan)
    data = {'first_name': first_name, 'last_name': last_name, 'email': email,
            'plan': plan, 'dni': dni,
            'address': address}
    template = loader.get_template('plan.html')
    html = template.render(data)
    subject_user, from_email = 'MiDoc', 'midoc.virtual@gmail.com'
    message_user = EmailMessage(subject_user, html, from_email, [email, ],
                                ['Info@midocvirtual.com', ])
    message_user.content_subtype = "html"
    message_user.send(fail_silently=True)
