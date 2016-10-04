from django.shortcuts import render

from django.views.decorators.csrf import csrf_protect, csrf_exempt
from django.http import HttpResponse
from django.contrib.auth import authenticate
import json


@csrf_exempt
def user_authenticate(request):
    post_data = json.loads(request.body)
    username = post_data['username']
    password = post_data['password']

    user = authenticate(username=username, password=password)

    if user is not None:
        return HttpResponse(True)
    else:
        return HttpResponse(False)



