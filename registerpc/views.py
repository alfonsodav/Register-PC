from django.shortcuts import render
from django.views.generic import DetailView, ListView


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

    num_computadora = Computadora.objects.count()
    compu_list = Computadora.objects.all()
    estu_list = Estudiante.objects.all()
    repre_list = Representante.objects.all()
    return render(
        request,
        'computadora.html',
        context={'num_computadoras': num_computadora, 'compu_list': compu_list, 'estu_list' : estu_list, 'repre_list':
                 repre_list},
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

def buscar(request):
    error = False
    if 'q' in request.GET:
        q = request.GET['q']
        if not q:
         error = True
        else:
         compu = Computadora.objects.filter(serial__icontains=q)
         cedula = Estudiante.objects.filter(cedula__icontains=q)
         repre = Representante.objects.filter(cedula__icontains=q)
         return render(request, 'resultados.html', {'compu': compu, 'query': q, 'cedula': cedula, 'repre': repre, })
    return render(request, 'index.html', {'error': error})


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


"""
    Fuciones para vista de lista estudiante por año
"""
def primero(request):
    num_estudiantes = Estudiante.objects.filter(año__icontains=1).count()
    compu_list = Computadora.objects.all()

    anno = 1
    return render(
        request,
        'año-list.html',
        context={'num_estudiantes': num_estudiantes, 'compu_list': compu_list, 'anno': anno,},
    )
def segundo(request):

    num_estudiantes = Estudiante.objects.filter(año__icontains=2).count()
    compu_list = Computadora.objects.all()
    anno =2
    return render(
        request,
        'año-list.html',
        context={'num_estudiantes': num_estudiantes, 'compu_list': compu_list,  'anno': anno, },
    )
def tercero(request):

    num_estudiantes = Estudiante.objects.filter(año__icontains=3).count()
    compu_list = Computadora.objects.all()

    anno = 3
    return render(
        request,
        'año-list.html',
        context={'num_estudiantes': num_estudiantes, 'compu_list': compu_list, 'anno': anno, },
    )
def cuarto(request):

    num_estudiantes = Estudiante.objects.filter(año__icontains=4).count()
    compu_list = Computadora.objects.all()

    anno= 4
    return render(
        request,
        'año-list.html',
        context={'num_estudiantes': num_estudiantes, 'compu_list': compu_list, 'anno': anno,},
    )
def quinto(request):

    num_estudiantes = Estudiante.objects.filter(año__icontains=5).count()
    compu_list = Computadora.objects.all()

    anno= 5
    return render(
        request,
        'año-list.html',
        context={'num_estudiantes': num_estudiantes, 'compu_list': compu_list, 'anno': anno, },
    )