# -*- coding: utf-8 -*-
from django.contrib.auth.models import (
    AbstractBaseUser, BaseUserManager,
    PermissionsMixin
)
from django.db import models
from taggit.utils import parse_tags

GENDER_CHOICES = (('m', 'm'), ('f', 'f'))


class UserManager(BaseUserManager):
    def _create_user(
        self, email, password, is_staff, is_superuser,
        **extra_fields
    ):
        user = self.model(
            email=email, is_active=True,
            is_staff=is_staff, is_superuser=is_superuser,
            **extra_fields
        )
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_user(self, username, email, password=None, **extra_fields):
        return self._create_user(
            email, password, False, False,
            **extra_fields
        )

    def create_superuser(self, email, password, **extra_fields):
        return self._create_user(
            email, password, True, True,
            **extra_fields
        )

    def get_users_by_group_name(self, group_name):
        return self.filter(groups__name=group_name)

    def get_users_by_groups(self, groups):
        """
        Given a group list, returns a User queryset.

        Args:
            groups: List of group names, list of group ids,
                    or string separated by commas.

        Returns:
            A queryset of users that belongs that groups.
        """
        data = ''
        if isinstance(groups, (str)):
            data = parse_tags(groups)
        elif isinstance(groups, list):
            data = parse_tags(','.join(groups))
        # Checks if all valuer are digits.
        if all([val.isdigit() for val in data]):
            data = [int(val) for val in data]
            return self.filter(groups__in=data)
        # Otherwise all values are names.
        return self.filter(groups__name__in=data)


class MyUser(AbstractBaseUser, PermissionsMixin):
    created = models.DateTimeField(auto_now=True, )
    updated = models.DateTimeField(auto_now_add=True)
    email = models.EmailField(unique=True)
    username = models.CharField(max_length=50, null=True, blank=True)
    photo = models.ImageField(upload_to='users', null=True, blank=True)
    url_photo = models.TextField(null=True, blank=True)
    first_name = models.CharField(max_length=50, null=True, blank=True)
    last_name = models.CharField(max_length=50, blank=True, null=True)
    dni = models.CharField(max_length=8, blank=True, null=True)
    birth_date = models.DateField(blank=True, null=True)
    address = models.CharField(max_length=200, null=True, blank=True)
    cellphone = models.CharField(max_length=15, blank=True, null=True)
    total_calls = models.IntegerField(default=0)
    month_used_calls = models.IntegerField(default=0)
    available_calls = models.IntegerField(default=1)
    emergency_attention = models.ForeignKey(
        'EmergencyAttention', blank=True,
        null=True,
        on_delete=models.SET_NULL,
    )
    location_id = models.IntegerField(blank=True, null=True)
    cmd_peru = models.CharField(max_length=20, blank=True, null=True)
    degree = models.CharField(max_length=100, blank=True, null=True)
    type_of_specialist = models.CharField(
        max_length=100, blank=True, null=True,
    )
    call_activate = models.BooleanField(default=False)
    in_call = models.BooleanField(default=False)
    queue_count = models.IntegerField(blank=True, default=0)
    blood_type = models.CharField(max_length=10, blank=True, null=True)
    allergic_reaction = models.ManyToManyField('AllergincReaction', blank=True)
    token_sinch = models.CharField(max_length=100, blank=True, null=True)
    size = models.FloatField(default=0.0, blank=True, null=True)
    gender = models.CharField(
        max_length=1, blank=True, null=True,
        choices=GENDER_CHOICES,
    )
    background = models.ManyToManyField('Background', blank=True)
    is_subscribe = models.BooleanField(default=False)
    subscription_id = models.CharField(
        max_length=300, null=True, blank=True,
        help_text='id of subscription',
    )
    USERNAME_FIELD = 'email'

    objects = UserManager()
    is_active = models.BooleanField(default=True)
    is_staff = models.BooleanField(default=False)
    is_admin = models.BooleanField(default=False)

    @property
    def get_group_names(self):
        return self.groups.values_list('name', flat=True)

    def get_full_name(self):
        return '{} {}'.format(self.first_name, self.last_name)

    def get_full_name_last(self):
        return '{} {}'.format(self.last_name, self.first_name)

    def get_short_name(self):
        return '{}'.format(self.first_name)

    def is_group_name(self, group_name):
        """Returns a boolean if the user belongs to the given group name"""

        return group_name in self.get_group_names

    def in_groups_names(self, group_list_names):
        """
        Returns a True if the user has at least one groups that belongs
        to the given group list.
        """

        return bool(set(group_list_names) & set(self.get_group_names))

    def __str__(self):
        return u'{}-{}'.format(self.last_name, self.first_name)

    class Meta:
        verbose_name = 'Usuario'
        verbose_name_plural = 'Usuarios'
        ordering = ('-created',)


class AllergincReaction(models.Model):
    created = models.DateTimeField(auto_now=True, )
    updated = models.DateTimeField(auto_now_add=True)
    created_by = models.ForeignKey(
        MyUser, related_name='allerginc_reactions',
        null=True, on_delete=models.SET_NULL,
    )
    name = models.CharField(max_length=50, blank=True, null=True, unique=True)
    description = models.CharField(max_length=255, blank=True, null=True)

    def __str__(self):
        return u'{}'.format(self.name)

    class Meta:
        verbose_name = 'Reacción Alérgica'
        verbose_name_plural = 'Reacciones Alergicas'
        ordering = ('-created',)


class Background(models.Model):
    created = models.DateTimeField(auto_now=True, )
    updated = models.DateTimeField(auto_now_add=True)
    created_by = models.ForeignKey(
        MyUser, related_name='cbackgrounds',
        null=True, blank=True,
        on_delete=models.SET_NULL,
    )
    name = models.CharField(max_length=50, blank=True, null=True, unique=True)
    description = models.CharField(max_length=255, blank=True, null=True)

    def __str__(self):
        return u'{}'.format(self.name)

    class Meta:
        verbose_name = 'Background'
        verbose_name_plural = 'Backgrounds'
        ordering = ('-created',)


class EmergencyAttention(models.Model):
    created = models.DateTimeField(auto_now=True, )
    updated = models.DateTimeField(auto_now_add=True)
    created_by = models.ForeignKey(
        MyUser, related_name='emergency_attentions',
        null=True, on_delete=models.SET_NULL,
    )
    name = models.CharField(max_length=50, blank=True, null=True, unique=True)
    description = models.CharField(max_length=255, blank=True, null=True)
    picture_url = models.URLField(blank=True, null=True)
    is_active = models.BooleanField(default=True)
    is_emergency = models.BooleanField(default=False)

    def __str__(self):
        return u'{}'.format(self.name)

    class Meta:
        verbose_name = 'Atención de Emergencia'
        verbose_name_plural = 'Atenciones de Emergencias'
        ordering = ('-created',)
