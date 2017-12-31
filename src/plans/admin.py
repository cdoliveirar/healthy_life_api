from django.contrib import admin
from .models import Plan, PlanPatient


@admin.register(Plan)
class PlanAdmin(admin.ModelAdmin):
    pass


@admin.register(PlanPatient)
class PlanPatientAdmin(admin.ModelAdmin):
    pass

# Register your models here.
