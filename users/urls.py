
from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'^user_authenticate/', views.user_authenticate, name='user_authenticate'),
]