#!/bin/bash

python manage.py migrate

python manage.py collectstatic --noinput

gunicorn app.wsgi:application --reload -w 2 -b :8000
