from django.db import models


class DisasterType(models.Model):
    english = models.CharField(max_length=1000, blank=True, null=True)
    sinhala = models.CharField(max_length=1000, blank=True, null=True)
    tamil = models.CharField(max_length=1000, blank=True, null=True)
    code = models.CharField(max_length=255, blank=True, null=True)

    def __str__(self):
        return self.english

    class Meta:
        managed = False
        db_table = 'disaster_type'


