from django.db import models

class Sleep(models.Model):
    start = models.DateTimeField()
    end = models.DateTimeField()
