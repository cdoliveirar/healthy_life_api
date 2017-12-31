from django.db import models
from customuser.models import MyUser
from django.contrib.postgres.fields import JSONField


# Create your models here.
class Plan(models.Model):
    created = models.DateTimeField(auto_now=True)
    updated = models.DateTimeField(auto_now_add=True)
    name = models.CharField(max_length=100, null=True, blank=True, unique=True)
    price = models.FloatField(default=0.0, null=True, blank=True, unique=True)
    calls_quantity = models.PositiveIntegerField(default=1, null=True,
                                                 blank=True)
    plan_culqi_id = models.CharField(max_length=300, null=True, blank=True)
    is_active = models.BooleanField(default=False)

    class Meta:
        ordering = ('name',)

    def __str__(self):
        return u'{}'.format(self.name)


class PlanPatient(models.Model):
    created = models.DateTimeField(auto_now=True, null=True, blank=True)
    updated = models.DateTimeField(auto_now_add=True, null=True, blank=True)
    patient = models.ForeignKey(MyUser, unique=True, related_name='plan')
    plan = models.ForeignKey(Plan, related_name='patients')
    extra_data = JSONField(null=True, blank=True, default=dict)

    def __str__(self):
        return u'{}-{}'.format(self.plan, self.patient)


class Payment(models.Model):
    created = models.DateTimeField(auto_now=True)
    updated = models.DateTimeField(auto_now_add=True)
    patient = models.ForeignKey(MyUser, related_name='payments')
    plan = models.ForeignKey(Plan, related_name='payments_plan', null=True,
                             blank=True)
    amount = models.FloatField(default=0.0)

    def __str__(self):
        return u'{}-{}'.format(self.amount, self.patient)
