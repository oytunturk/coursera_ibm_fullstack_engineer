#This hands-on Django lab covers:
#1. SQLite: A lightweight relational database management system (RDBMS) that provides an SQL-based interface to store, manage, and retrieve structured data.
#2. List view: A class-based view that provides a convenient way to fetch and present multiple records in a tabular or list format.
#3. HttpResponseRedirect: A class that is used to redirect users to a different page or URL after processing a request.
#4. reverse(): A utility function provided by Django that takes the name of a URL pattern as an argument and returns the corresponding URL as a string.
#5. CSS container class: Creates a responsive fixed-width container for webpage content and provides a consistent layout and spacing for your content across different screen sizes and devices.
#6. CSS card class: Creates a flexible and stylized container called a “card” to present information, images, and actions in a compact and organized manner.

#Download the project template
wget "https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-CD0251EN-SkillsNetwork/labs/m4_django_app/lab3_template.zip"
unzip lab3_template.zip
rm lab3_template.zip

#Install requirements
cd lab3_template
pip install --upgrade distro-info
pip3 install --upgrade pip==23.2.1
pip install virtualenv
virtualenv djangoenv
source djangoenv/bin/activate
pip install -U -r requirements.txt

#Migrations
python3 manage.py makemigrations
python3 manage.py migrate

#Run the server
python3 manage.py runserver

#Check to see how it works on your browser
#http://127.0.0.1:8000/onlinecourse
#http://127.0.0.1:8000/onlinecourse/course/1/
#http://127.0.0.1:8000/onlinecourse/course/2/
