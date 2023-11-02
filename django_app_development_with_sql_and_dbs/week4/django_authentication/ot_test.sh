#1. Authentication: The process of verifying the identity of a user or system.
#2. User: Represents an individual who interacts with the Django application. It typically includes information such as username, password, and email.
#3. Registration: The process of creating a new user account in the application.
#4. Login: The process by which a user provides credentials (such as username and password) to access a protected area of the application.
#5. Logout: The process of ending a user’s session and removing their authentication status.

wget "https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-CD0251EN-SkillsNetwork/labs/m5_django_advanced/lab2_template.zip"
unzip lab2_template.zip
rm lab2_template.zip

pip install --upgrade distro-info
pip3 install --upgrade pip==23.2.1
pip install virtualenv
virtualenv djangoenv
source djangoenv/bin/activate
pip install -U -r requirements.txt

python3 manage.py makemigrations
python3 manage.py migrate
python3 manage.py runserver

#visit http://127.0.0.1:8000/onlinecourse/ to see what it does

#Now the authentication part:
#Create superuser (admin)
python3 manage.py createsuperuser
# --> will ask you to enter a username, password, and email address

#Re-run
killal -9 python3
python3 manage.py runserver
#visit http://127.0.0.1:8000/admin to login as admin, you can add users, groups, courses, lessons, instructors, learners there
