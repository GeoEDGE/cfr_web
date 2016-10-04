from django.db import models


class Province(models.Model):
    name = models.CharField(max_length=255, blank=True, null=True)

    def __str__(self):
        return self.name

    class Meta:
        managed = False
        db_table = 'province'


class District(models.Model):
    name = models.CharField(max_length=255, blank=True, null=True)
    province = models.ForeignKey(Province, blank=True, null=True)

    def __str__(self):
        return self.name

    class Meta:
        managed = False
        db_table = 'district'


class Ds(models.Model):
    name = models.CharField(max_length=255, blank=True, null=True)
    district = models.ForeignKey(District, blank=True, null=True)

    def __str__(self):
        return self.name

    class Meta:
        managed = False
        db_table = 'ds'


class Gn(models.Model):
    name = models.CharField(max_length=255, blank=True, null=True)
    ds = models.ForeignKey(Ds, blank=True, null=True)

    def __str__(self):
        return self.name

    class Meta:
        managed = False
        db_table = 'gn'




