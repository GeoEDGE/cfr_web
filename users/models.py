from django.db import models
from django.utils import timezone
from django.contrib.auth.models import BaseUserManager, AbstractBaseUser, PermissionsMixin
from django.contrib.auth import get_user_model

from administrative_divisions.models import Province, District, Ds, Gn


class MyUserManager(BaseUserManager):
    def create_user(self, username, password=None, **extra_fields):
        """
        Creates and saves a User with the given email, date of
        birth and password.
        """
        now = timezone.now()
        if not username:
            raise ValueError('Users must have an username')

        user = self.model(
            username=username,
            is_staff=False,
            is_active=True,
            last_login=now,
            date_joined=now
        )

        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, username, password, **extra_fields):
        """
        Creates and saves a superuser with the given email, date of
        birth and password.
        """
        user = self.create_user(self, username, password, **extra_fields)
        user.is_superuser = True
        user.is_staff = True
        user.is_active = True
        user.save(using=self._db)
        return user


class MyUser(AbstractBaseUser, PermissionsMixin):
    #is_superuser = models.BooleanField()
    username = models.CharField(unique=True, max_length=30)
    first_name = models.CharField(max_length=30, null=True)
    last_name = models.CharField(max_length=30, null=True)
    email = models.CharField(max_length=254)
    is_staff = models.BooleanField(default=False)
    is_active = models.BooleanField()
    date_joined = models.DateTimeField()
    province = models.ForeignKey(Province, blank=True, null=True)
    district = models.ForeignKey(District, blank=True, null=True)
    ds = models.ForeignKey(Ds, blank=True, null=True)
    gn = models.ForeignKey(Gn, blank=True, null=True)

    objects = MyUserManager()

    USERNAME_FIELD = 'username'

    def get_full_name(self):
        # The user is identified by their email address
        return self.username

    def get_short_name(self):
        # The user is identified by their email address
        return self.username

    def __str__(self):              # __unicode__ on Python 2
        return self.username

    class Meta:
        verbose_name_plural = "Users"


