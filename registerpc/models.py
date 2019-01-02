from django.db import models
# -*- coding: utf-8 -*-
# Create your models here.



class Representante(models.Model):
    nombre = models.CharField(max_length=30)
    apellido = models.CharField(max_length=40)
    cedula = models.CharField(max_length=9)
    domicilio = models.CharField(max_length=50)
    ciudad = models.CharField(max_length=60)
    estado = models.CharField(max_length=30)
   #pais = models.CharField(max_length=50)
    email = models.EmailField()
    telefono= models.CharField(max_length=12, blank=True)


    class Meta:
        ordering = ["nombre"]

    def __str__(self):  # __unicode__ en Python 3
        return self.nombre


class Estudiante(models.Model):
    nombre = models.CharField(max_length=30)
    apellido = models.CharField(max_length=40)
    cedula = models.CharField(max_length=10)
    año = models.BigIntegerField()
    representante = models.ForeignKey(Representante, on_delete=models.DO_NOTHING)
    email = models.EmailField(blank=True)

    class Meta:
        ordering = ["nombre"]
        verbose_name_plural = "Estudiantes"

    def __str__(self):  # __unicode__ en Python 3
        return '%s %s' % (self.nombre, self.apellido)


class Computadora(models.Model):
    serial = models.CharField(max_length=100)
    estudiante = models.OneToOneField(Estudiante, on_delete=models.DO_NOTHING)
    representante = models.ForeignKey(Representante, on_delete=models.DO_NOTHING)
    fecha_entrega = models.DateField(blank=True, null=True)
    funciona=models.BooleanField(default=True)
    descripcion=models.TextField(blank=True, help_text="si el equipo esta dañado o no funciona por favor describa la falla")

  # portada=models.ImageField(upload_to='portadas')

    def __str__(self):  # __unicode__ en Python 3
        return self.serial