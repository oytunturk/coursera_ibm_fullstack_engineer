#1. Bootstrap: A popular open-source framework that provides a set of CSS and JavaScript components for building responsive and mobile-first web applications.
#2. Template: A Django-specific file that defines the structure and presentation of a web page. It typically contains a mixture of HTML, CSS, and Django template language code.
#3. Django template language: A specialized template language provided by Django that allows dynamic content rendering, looping, conditional statements, and more.
#4. Bootstrap Components: Pre-designed UI elements provided by Bootstrap, such as buttons, forms, navigation bars, and modals, that can be easily integrated into web pages.
#5. Bootstrap Grid System: A responsive layout system provided by Bootstrap that divides the page into a grid of rows and columns, allowing for easy alignment and arrangement of content.

wget "https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-CD0251EN-SkillsNetwork/labs/m5_django_advanced/lab3_template.zip"
unzip lab3_template.zip
rm lab3_template.zip

pip install --upgrade distro-info
pip3 install --upgrade pip==23.2.1
pip install virtualenv
virtualenv djangoenv
source djangoenv/bin/activate
pip install -r requirements.txt

python3 manage.py makemigrations
python3 manage.py migrate
python3 manage.py runserver
