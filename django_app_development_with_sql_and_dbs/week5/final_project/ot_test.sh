pip install --upgrade distro-info
pip3 install --upgrade pip==23.2.1
pip install virtualenv
virtualenv djangoenv
source djangoenv/bin/activate

pip install -U -r requirements.txt

# Migrations are Django's way of propagating changes you make to your models
#  (adding a field, deleting a model, etc.) into your database schema.
#  They are designed to be mostly automatic, but you will need to know when to make migrations,
#  when to run them, and the common problems you might run into.
#
# There are several commands which you will use to interact with migrations and Django's handling of database schema:
#  1. migrate, which is responsible for applying and unapplying migrations
#  2. makemigrations, which is responsible for creating new migrations based on the changes you have made to your models
#  3. sqlmigrate, which displays the SQL statements for a migration
#  4. showmigrations, which lists a project's migrations and their status

python3 manage.py makemigrations
python3 manage.py migrate
python3 manage.py runserver

#On your browser, check what it does by navigating to:
#http://127.0.0.1:8000/onlinecourse/

cd final_project
python3 manage.py makemigrations onlinecourse
python3 manage.py migrate
