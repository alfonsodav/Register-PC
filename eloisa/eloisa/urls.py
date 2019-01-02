"""rangel URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""

from django.urls import path
from django.contrib import admin
from django.conf.urls import url
from django.conf import settings
from registerpc import views
from django.conf.urls.static import static




urlpatterns = [
    url(r'^$', views.index, name='index'),
    url(r'^estudiante/$', views.estu, name="estu"),
    url(r'^computadora/$', views.compu, name="compu"),
    url(r'^representante/$', views.repre, name="repre"),
    url(r'^computadora/(?P<pk>\d+)$', views.Detallescompu.as_view(), name='detalles­compu'),
    url(r'^representante/(?P<pk>\d+)$', views.Detallesrepre.as_view(), name='detalles­repre'),
    url(r'^estudiante/(?P<pk>\d+)$', views.DetallesEstu.as_view(), name='detalles­estudiante'),
]
urlpatterns += [
    path('admin/', admin.site.urls, name="admin"),
] + static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)

