#!/bin/bash

# Apply migrations
python manage.py makemigrations
python manage.py migrate

# Create superuser
echo "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.create_superuser('admin', 'admin@example.com', 'admin')" | python manage.py shell

# Start the Django app
python manage.py runserver 0.0.0.0:8000
