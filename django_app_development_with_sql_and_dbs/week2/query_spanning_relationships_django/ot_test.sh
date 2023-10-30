pip install --upgrade distro-info
pip3 install --upgrade pip==23.2.1

wget "https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-CD0251EN-SkillsNetwork/labs/m3_django_orm/lab3_template.zip"  
unzip lab3_template.zip
rm lab3_template.zip

#Change settings.py to in clude you postgres password

cd lab3_template
pip install virtualenv
virtualenv djangoenv
source djangoenv/bin/activate
pip install Django psycopg2-binary

python3 manage.py makemigrations related_objects

python3 manage.py migrate

python3 write.py

python3 read_course_instructors.py

python3 read_enrollments.py
