# ImagesAPI
Project is configured with python 3.10.2 and poetry 1.2.2


## Initial Setup
1. Remember to install:
- docker
- docker-compose
- poetry==1.2.2
- pre-commit
2. Run `make init` to install dependencies with poetry, initialize pre-commit and copy sample files.


## Run application
1. Run `docker-compose build` to rebuild docker image.
2. docker-compose uses `run_server.sh` script to perform all of the required actions like
```
python manage.py makemigrations
python manage.py migrate
python manage.py runserver
```
3. Run `make up` which will starts api and db services
4. Run `make superuser` to create default superuser
Admin panel permissions:
    login: admin
    password: admin
