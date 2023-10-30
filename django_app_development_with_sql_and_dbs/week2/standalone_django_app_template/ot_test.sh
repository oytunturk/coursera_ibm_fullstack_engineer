#If you are using the Theia environment hosted by Skills Network Labs, a pre-installed PostgreSQL instance is provided for you which can be started with one simple command line.
#You can skip this step if you have already started it in previous labs.
#If the terminal was not open, go to Terminal > New Terminal and run:
start_postgres

#Once PostgreSQL is started, you can check the server connection information in the terminal.
#You need to save the connection information such as generated username, password, and host, etc,
#which will be used to configure the Django app to connect to this database.

#pgAdmin should be running

pip install --upgrade distro-info
pip3 install --upgrade pip==23.2.1

#Create venv
cd ormtemplate
pip install virtualenv
virtualenv djangoenv
source djangoenv/bin/activate

#Install packages
pip install django==4.2.4 psycopg2-binary==2.9.7

#Generate migration scripts
python3 manage.py makemigrations standalone

#Run migration scripts
python3 manage.py migrate

#Test
python3 test.py

#You have successfully crated a standalone Django app template that you can use in your future projects
