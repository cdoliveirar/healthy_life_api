from django.contrib import admin
from .models import Competition
from django.contrib.auth.admin import UserAdmin


@admin.register(Competition)
class MedicalHistoryAdmin(admin.ModelAdmin):
    pass

