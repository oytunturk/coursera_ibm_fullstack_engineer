#Instructions. This is not the complete thing as IBM cloud uses postgres to show SQL info etc

brew install wget #for OSX wget
wget "https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-CD0251EN-SkillsNetwork/labs/m3_django_orm/lab1_template.zip"
unzip lab1_template.zip
rm lab1_template.zip

cd lab1_template

pip install virtualenv
virtualenv djangoenv
source djangoenv/bin/activate

pip install -r requirements.txt

#manage.py is a command-line interface that allows you to interact with and manage your Django project

#settings.py contains setting information about this project such as databases or installed Django apps

#orm folder is a container for a standalone Django ORM app

#orm/models.py contains model definitions

#First, you will need to generate migration scripts for orm app
python3 manage.py makemigrations orm

#Check SQL statement for testing:
python3 manage.py sqlmigrate orm 0001

#Migrates it to sql
python3 manage.py migrate

#Test it
python3 test.py
