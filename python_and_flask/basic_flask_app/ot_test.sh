#!/bin/bash

# Create venv and install Flask if not already installed
#python3 -m venv venv
#source ./venv/bin/activate
#pip install Flask==2.2.2
#pip freeze

#Export Flask related variables before running your app
export FLASK_APP=app.py
export FLASK_ENV=development #This will be depreceated in Flask 2.3.x

#This runs it on localhost:5000 by default. After running go there and see what you get (or run curl localhost:5000 from another command line or whatever web address flask run shows that the server is being run on)
flask run

#There might be an issue with default Werkzeug. I needed to do this to fix it:
#pip freeze > requirements.txt
# Change requirements.txt to include Werkzeug==2.2.2
#pip install -r requirements.txt
#pip freeze # should now show Werkzeug==2.2.2
#flask run
#Go to another command line and:
#curl <ip_address_provided_by_flask>

#You can also use this to avoid exporting environment variables:
#flask run --app=app.y --debug

#If the command line becomes too long, you can shorten it usin:
#export PS1="[\[\033[01;32m\]\u\[\033[00m\]: \[\033[01;34m\]\W\[\033[00m\]]\$ "
