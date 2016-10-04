from django.conf.urls import url
from django.contrib.auth.urls import url

from . import views

urlpatterns = [
    url(r'^$', views.index, name='index'),
    url(r'^get_summary/$', views.get_summary, name='get_summary'),
    url(r'^logout/$',
     'django.contrib.auth.views.logout', {'next_page': '/admin/login/?next=/dashboard'}, name='logout'
     ),
]
