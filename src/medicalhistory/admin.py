from django.contrib import admin
from .models import MedicalHistory, ArtifactMeasurement
from django.contrib.auth.admin import UserAdmin


@admin.register(MedicalHistory)
class MedicalHistoryAdmin(admin.ModelAdmin):
    pass


@admin.register(ArtifactMeasurement)
class ArtifactMeasurementAdmin(admin.ModelAdmin):
    pass

