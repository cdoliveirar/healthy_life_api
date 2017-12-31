from django.template import loader
from django.core.mail.message import EmailMessage
from midoc.celery import app
from django.conf import settings
from .models import MyUser

@app.task(name='welcome')
def welcome_mail(email):
    user=MyUser.objects.filter(email=email)
    data = {'user':user}
    template = loader.get_template('welcome.html')
    html = template.render(data)
    subject_user, from_email = 'Bienvenido a Midoc Virtual', 'midoc.virtual@gmail.com'
    message_user = EmailMessage(subject_user, html, from_email, [email,])
    message_user.content_subtype = "html"
    message_user.send(fail_silently=True)