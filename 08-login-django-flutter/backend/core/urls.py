from django.urls import path

from .views import basic_page


urlpatterns = [
    path("", basic_page),
]
