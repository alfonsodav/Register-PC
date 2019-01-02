from django.contrib import admin

# Register your models here.

from registerpc.models import Representante, Estudiante, Computadora

@admin.register(Representante)
class RepresentanteAdmin(admin.ModelAdmin):
    list_display = ('nombre', 'apellido','cedula','email','domicilio')

@admin.register(Estudiante)

class EstudianteAdmin(admin.ModelAdmin):
    list_display = ('nombre', 'apellido','cedula','representante')


@admin.register(Computadora)
class ComputadoraAdmin(admin.ModelAdmin):
    list_display = ('serial', 'estudiante','funciona','descripcion')