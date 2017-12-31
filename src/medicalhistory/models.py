from django.db import models
from customuser.models import MyUser

# Create your models here.


class MedicalHistory(models.Model):
    # created_by = models.ForeignKey(MyUser, models.DO_NOTHING, blank=True, null=True, related_name='users')
    patient = models.ForeignKey(MyUser, blank=True, null=True, related_name="patients_medical_histories")
    doctor = models.ForeignKey(MyUser, blank=True, null=True, related_name="doctores")
    # location_id = models.IntegerField(unique=True, blank=True, null=True)
    symptom = models.TextField(blank=True, null=True)
    doctor_comment = models.TextField(blank=True, null=True)
    diagnostic = models.TextField(blank=True, null=True)
    weight = models.CharField(max_length=10, blank=True, null=True)
    temperature = models.CharField(max_length=10, blank=True, null=True)
    blood_pressure = models.CharField(max_length=10, blank=True, null=True)
    heart_rate = models.CharField(max_length=10, blank=True, null=True)
    # new release
    # next_medical_date = models.DateTimeField(blank=True, null=True, default=timezone.now)
    created = models.DateTimeField(auto_now=True)
    updated = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return "{0} - {1} - {2}".format(self.patient, self.doctor_comment, self.symptom)

    class Meta:
        verbose_name = 'Historia Medica'
        verbose_name_plural = 'Historias Medicas'
        ordering = ('-created',)


class MedicalHistoryMedia(models.Model):
    medical_history = models.ForeignKey(MedicalHistory, models.DO_NOTHING, blank=True, null=True)
    picture_url = models.TextField(blank=True, null=True)
    created = models.DateTimeField(auto_now=True)
    updated = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return "{0} - {1}".format(self.medical_history.pk, self.picture_url)

    class Meta:
        verbose_name = 'Media de Historia Medica'
        verbose_name_plural = 'Medias para Historias Medicas'
        ordering = ('-created',)


class ArtifactMeasurement(models.Model):
    patient = models.ForeignKey(MyUser, models.DO_NOTHING, blank=True, null=True, related_name='patients_measurements')
    token_sinch = models.TextField(blank=True, null=True)
    weight = models.DecimalField(max_digits=5, decimal_places=2, blank=True, null=True)
    temperature = models.DecimalField(max_digits=5, decimal_places=2, blank=True, null=True)
    blood_pressure = models.DecimalField(max_digits=5, decimal_places=2, blank=True, null=True)
    measurement_date = models.DateTimeField(blank=True, null=True)
    created = models.DateTimeField(auto_now=True)
    updated = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return "{0} - {1} - {2}".format(self.weight, self.temperature, self.blood_pressure)

    class Meta:
        verbose_name = 'Mediciones de Artefactos'
        verbose_name_plural = 'Mediciones de Artefactos medicos'
        ordering = ('-created',)


