#!/bin/sh

./manage.py migrate

echo "yes" | ./manage.py updatecatalog 

echo "yes" | ./manage.py collectstatic 

./manage.py runserver 0.0.0.0:8000