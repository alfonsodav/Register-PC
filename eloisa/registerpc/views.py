from django.shortcuts import render
from django.views.generic import DetailView, ListView
from django import forms
from django.contrib import admin

# Create your views here.
from registerpc.models import Estudiante, Representante, Computadora


def index(request):
    """
    Función vista para la página inicio del sitio.
    """
    # Genera contadores de algunos de los objetos principales
    num_estudiantes = Estudiante.objects.count()
    num_computadoras = Computadora.objects.count()
    # Libros disponibles (status = 'a')
    #   num_instances_available = Computadora.objects.filter(status__exact='a').count()
    num_representantes = Representante.objects.count()  # El 'all()' esta implícito por defecto.

    # Renderiza la plantilla HTML base_generic.html con los datos en la variable contexto
    return render(
        request,
        'index.html',
        context={'num_estudiantes': num_estudiantes, 'num_computadoras': num_computadoras,
                 'num_representantes': num_representantes
                 },
    )


def compu(request):
    """
    Función vista para la página inicio del sitio.
    """

    num_computadora = Computadora.objects.all().count()
    compu_list = Computadora.objects.all()
    return render(
        request,
        'computadora.html',
        context={'num_computadoras': num_computadora, 'compu_list': compu_list},
    )


def estu(request):
    """
    Función vista para la página inicio del sitio.
    """

    num_estudiantes = Estudiante.objects.all().count()
    estu_list = Estudiante.objects.all()
    return render(
        request,
        'estudiante.html',
        context={'num_estudiantes': num_estudiantes, 'estu_list': estu_list},
    )


"""
def list(request):
    estu_list = Estudiante.objects.all()
    return render(
        request,
        'estudiante.html',
        {'estu_list': estu_list}
    )
"""


def repre(request):
    num_representante = Representante.objects.all().count()
    repre_list = Representante.objects.all()
    return render(
        request,
        'representante.html',
        context={'num_representantes': num_representante, 'repre_list': repre_list},
    )


class DetallesEstu(DetailView):
    model = Estudiante


class Detallesrepre(DetailView):
    model = Representante


class Detallescompu(DetailView):
    model = Computadora


class ListaEstu(ListView):
    model = Estudiante

class formulario(forms.Form):
    nombre= forms.CharField()