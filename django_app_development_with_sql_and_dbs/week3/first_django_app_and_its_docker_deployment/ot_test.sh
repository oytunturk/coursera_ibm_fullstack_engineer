pip install --upgrade distro-info
pip3 install --upgrade pip==23.2.1
pip install virtualenv
virtualenv djangoenv
source djangoenv/bin/activate

pip install Django

#Create a project named 'firstproject'
django-admin startproject firstproject

cd firstproject

#Create a Django app called 'firstapp' inside 'firstproject'
python3 manage.py startapp firstapp

#Info on project-related files:
#manage.py is a command-line interface used to interact with the Django project to perform tasks such as starting the server, migrating models, and so on.
#firstproject/settings.py contains the settings and configurations information.
#firstproject/urls.py contains the URL and route definitions of your Django apps within the project.

#Info on app-related files:
#firstapp/admin.py: is for building an admin site
#firstapp/models.py: contains model classes
#firstapp/views.py: contains view functions/classes
#firstapp/urls.py: contains URL declarations and routing for the app
#firstapp/apps.py: contains configuration meta data for the app
#firstapp/migrations/: model migration scripts folder

#Make migrations before running the app to create routes
python3 manage.py makemigrations

#Run the migration:
python3 manage.py migrate

#Run the server:
python3 manage.py runserver

#Check the web page on your web browser: http://127.0.0.1:8000/ (or curl http://127.0.0.1:8000/ from command line)


### Dockerization
#This is how it works for (basic) python applications:
# Install docker on your machine if you haven't already done so
# Create a requirements.txt file
# Create a Dockerfile which contains instructions on how to build a Docker image
# Run docker compose up to create a container image, and run it
# Commit and push the image to a remote repo so others can run it exactly as you’ve configured!
# Docker images are commonly used in conjunction with Kubernetes, which is a service that manages containers.

#The following will create requirements.txt
pip install pipreqs
pipreqs .

#Create Dockerfile. Details are here: https://github.com/docker/awesome-compose/tree/master/official-documentation-samples/django/
#touch Dockerfile and put these in:
#syntax=docker/dockerfile:1
#FROM python:3
#ENV PYTHONDONTWRITEBYTECODE=1
#ENV PYTHONUNBUFFERED=1
#WORKDIR /code
#COPY requirements.txt /code/
#RUN pip install -r requirements.txt
#COPY . /code/
#CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

#Create the docker image
docker build . -t my-django-app:latest && docker run -e PYTHONUNBUFFERED=1 -p  8000:8000 my-django-app

#This will run the app on localhost similar to when you run it directly in python.
#You can now share the app with others (along with settings that will work on their platform) by following these instructions:
#https://docs.docker.com/get-started/04_sharing_app/

#You can deploy on IBM cloud using Cloud Engine or anywhere else. Depends on how it will be done 'anywhere else'. TO DO: Learn more about it...
