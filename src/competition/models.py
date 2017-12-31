from django.db import models
from customuser.models import MyUser


class Competition(models.Model):
    patient = models.ForeignKey(MyUser, models.DO_NOTHING, blank=True, null=True, related_name='patients')
    doctor = models.ForeignKey(MyUser, models.DO_NOTHING, blank=True, null=True, related_name='doctors')
    qualification = models.IntegerField(blank=True, null=True)
    qualification_feedback = models.CharField(max_length=100, blank=True, null=True)
    recommendation = models.IntegerField(blank=True, null=True)
    recommendation_feedback = models.CharField(max_length=100, blank=True, null=True)
    created = models.DateTimeField(auto_now=True)
    updated = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return "{0} - {1} - {2}".format(self.patient.name, self.doctor.name, self.qualification)

    class Meta:
        verbose_name = 'Calificacion'
        verbose_name_plural = 'Calificacion a los Doctores'
        ordering = ('-created',)