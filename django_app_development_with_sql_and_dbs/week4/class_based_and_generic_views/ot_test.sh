# 1. Class-based views (CBVs): In Django, class-based views refer to a method of defining views using classes instead of functions.
#    CBVs provide a more structured and reusable approach to handling HTTP requests and generating responses.
# 2. Generic views: Generic views in Django are a type of class-based view that offers pre-defined, reusable views for common use cases.
#    They aim to reduce repetitive code and simplify common web development patterns.
# 3. Function-based views (FBVs): In Django, function-based views are a way of defining views using regular Python functions.
#    They are the simplest and most basic approach for handling HTTP requests and generating responses in Django.

#Download
wget "https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-CD0251EN-SkillsNetwork/labs/m5_django_advanced/lab1_template.zip"
unzip lab1_template.zip
rm lab1_template.zip
cd lab1_template

#Prepare venv
pip install --upgrade distro-info
pip3 install --upgrade pip==23.2.1
pip install virtualenv
virtualenv djangoenv
source djangoenv/bin/activate

#Install reqs
pip install -r requirements.txt

#Open myproject/settings.py and find DATABASES section and you can see that we use SQLite database in this lab,
# which is a file-based embedding database with some course data pre-loaded --> lab1_template/db.sqlite3

#Make and migrate
python3 manage.py makemigrations
python3 manage.py migrate

#Run the server
python3 manage.py runserver

#Connect and test in browser: http://127.0.0.1:8000/onlinecourse
