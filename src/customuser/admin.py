from django.contrib import admin
from .models import MyUser, AllergincReaction, Background, EmergencyAttention
from .forms import UserChangeForm, UserCreationForm
from django.contrib.auth.admin import UserAdmin


@admin.register(MyUser)
class MyUserAdmin(UserAdmin):
    """Class MyUser Admin."""

    form = UserChangeForm
    add_form = UserCreationForm

    list_display = (
        'email',
        'id',
        'first_name',
        'last_name',
        'dni',
        'is_active',
        'is_admin',
        'is_superuser',

    )

    list_filter = (
        'is_admin',
        'is_active',
    )
    fieldsets = (
        (None, {'fields': (
            'email',
            'password'
        )}),
        ('Personal info', {'fields': (
            'first_name',
            'last_name',
            'dni',
            'cellphone',
            'address',
            'photo',
            'token_sinch',

        )}),
        ('Associated info', {'fields': (

        )}),
        ('Permissions', {'fields': (
            'is_active',
            'is_admin',
            'is_superuser',
            'groups',
            'user_permissions',
        )}),
    )
    add_fieldsets = (
        (None, {
            'classes': ('wide',),
            'fields': (
                'email',
                'first_name',
                'last_name',
                'password1',
                'password2',
            )
        }),
    )
    search_fields = (
        'email',
        'first_name',
        'last_name',
    )
    filter_horizontal = ()
    ordering = ('-created',)


@admin.register(AllergincReaction)
class AllergincReactionAdmin(admin.ModelAdmin):
    pass


@admin.register(Background)
class BackgroundAdmin(admin.ModelAdmin):
    pass


@admin.register(EmergencyAttention)
class EmergencyAttentionAdmin(admin.ModelAdmin):
    pass
