start_postgres

#Note your password after postgres starts

#Install packages
pip install --upgrade distro-info
pip3 install --upgrade pip==23.2.1
pip install virtualenv
virtualenv djangoenv
source djangoenv/bin/activate
pip install Django psycopg2-binary

#Get lab package
wget "https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-CD0251EN-SkillsNetwork/labs/m3_django_orm/lab2_template.zip"
unzip lab2_template.zip
rm lab2_template.zip

#Run migrate after your code changes
python3 manage.py makemigrations crud

#Run migrations
python3 manage.py migrate

python3 write.py
