from django import forms
from django.contrib.auth.forms import ReadOnlyPasswordHashField
from django.utils.translation import ugettext_lazy as _
from .models import MyUser

class CleanNamesForm(forms.ModelForm):
    """Class Clean Names Form."""

    def clean_first_name(self):
        """Function clean first name."""

        first_name = self.cleaned_data.get('first_name')
        return first_name.title()

    def clean_last_name(self):
        """Function clean last name."""

        last_name = self.cleaned_data.get('last_name')
        return last_name.title()


class UserCreationForm(CleanNamesForm):
    """ Form User Creation.

    A form for creating new users. Includes all the required
    fields, plus a repeated password.
    """

    password1 = forms.CharField(
        label='Password',
        widget=forms.PasswordInput,
        max_length=255,
        min_length=6,
    )
    password2 = forms.CharField(
        label='Password confirmation',
        widget=forms.PasswordInput,
    )

    def clean_password2(self):
        """Function value password."""

        # Check that the two password entries match
        password1 = self.cleaned_data.get('password1')
        password2 = self.cleaned_data.get('password2')
        if password1 and password2 and password1 != password2:
            raise forms.ValidationError(
                _('Las contraseñas no coinciden.'),
            )
        return password2

    def save(self, commit=True):  # pylint: disable=super-on-old-class
        """Function Save."""
        # Save the provided password in hashed format
        user = super(UserCreationForm, self).save(commit=False)
        user.set_password(self.cleaned_data['password1'])
        if commit:
            user.save()
        return user

    class Meta:

        """Class Info."""

        model = MyUser
        fields = '__all__'


class UserChangeForm(CleanNamesForm):
    """ Form User Change Form.

    A form for updating users. Includes all the fields on
    the user, but replaces the password field with admin's
    password hash display field.
    """

    password = ReadOnlyPasswordHashField(
        help_text=_(
            'Raw passwords are not stored, so there is no way to see '
            'this user\'s password, but you can change the password '
            'using <a href=\'password/\'>this form</a>.'
        )
    )

    class Meta:
        """Class Info."""

        model = MyUser
        fields = '__all__'

    def clean_password(self):
        """Function Clean Password."""
        # Regardless of what the user provides, return the initial value.
        # This is done here, rather than on the field, because the
        # field does not have access to the initial value.
        return self.initial['password']  # pylint: disable=no-member
