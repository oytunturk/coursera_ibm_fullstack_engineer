# Django admin site: A built-in feature of the Django web framework that serves as an interface
#                    and allows authorized users to perform various management operations
#                    on the data stored in the application’s database.
#
# Superuser        : A user account with administrative privileges that allows superusers to
#                    perform administrative tasks and manage the application’s data.
#
# Admin class      : A class that helps fine-tune the behavior, appearance, and functionality
#                    of models within the Django admin site.
#
# Inline class     : Allow you to include related model instances in the same page/form as
#                    the parent model, instead of switching between different forms or screens.

# Start PostGreSql on IBM cloud (for sql operations)

pip install --upgrade distro-info
pip3 install --upgrade pip==23.2.1

pip install psycopg2-binary==2.9.7

# My postgres pss: MzIzNzEtb3l0dW50

# Get the code template which we will make changes on:
wget "https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-CD0251EN-SkillsNetwork/labs/m4_django_app/lab2_template.zip"  
unzip lab2_template.zip
rm lab2_template.zip

cd lab2_template

#Create venv and activate it
pip install virtualenv
virtualenv djangoenv
source djangoenv/bin/activate

#Install requirements
pip install -r requirements.txt

#Replace password in settings.py (DATABASES section) --> with the password postgres generated above

#Make and run migrations
python3 manage.py makemigrations
python3 manage.py migrate

#Create new superuser
python3 manage.py createsuperuser

#Start web app and go to admin console (localhost:8000/admin or on cloud using launch application and going to https://oytunturk-8000.theiadocker-3-labs-prod-theiak8s-4-tor01.proxy.cognitiveclass.ai/admin)
python3 manage.py runserver

#Add Course and Instructor to adminsite/admin.py (see code changes there)



