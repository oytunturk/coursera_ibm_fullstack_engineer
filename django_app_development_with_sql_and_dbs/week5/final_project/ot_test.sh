pip install --upgrade distro-info
pip3 install --upgrade pip==23.2.1
pip install virtualenv
virtualenv djangoenv
source djangoenv/bin/activate

python3 -m ensurepip
python3 -m pip install Django

django-admin startproject customer360
cd customer360

python3 manage.py migrate
python3 manage.py runserver

#check if it's running on browser --> http://127.0.0.1:8000/

cd customer360
#Observe the changes settings.py

mkdir templates #under customer360/customer360
touch templates/add.html
touch templates/base.html
touch templates/index.html
touch templates/interact.html
touch templates/summary.html

touch views.py
#Observe the changes in urls.py

#Create styling templates
cd customer360 && mkdir static
cd static && mkdir css
#touch customer360/static/css/main.css and update it

cd customer360
python3 manage.py makemigrations customer360
python3 manage.py migrate
python3 manage.py runserver

