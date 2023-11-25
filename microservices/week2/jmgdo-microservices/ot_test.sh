#Original project:
#[ ! -d 'jmgdo-microservices' ] && git clone https://github.com/ibm-developer-skills-network/jmgdo-microservices.git

cd jmgdo-microservices/CRUD

#1. Simple Falsk app

#Install dependencies
python3 -m pip install flask flask_cors

#Run the server
python3 products.py

#Add item and test it
curl -X POST -H "Content-Type: application/json" \
    -d '{"id": 145, "name": "Pen", "price": 2.5}' \
    http://localhost:5000/products

curl http://localhost:5000/products/145

###
#2. Swagger example
cd jmgdo-microservices/swagger_example

# Run the server
python3 app.py

#Modify swagger_config.json
#by pasting the url you get after running the app to host: "..." section. Note that you should drop https:// and also the final / if it exists

#Go to https://editor.swagger.io/
#File --> Clear Editor
#Paste the whole contents of swagger_config.json (Press 'Cancel' if it asks for converting it to yaml)
#This will automatically populate the UI based on your json and let's you test your REST API from swagger, generate documentation etc.
#Try out the tasks GET, etc in the UI. You'll need to select the task, expand it, and press Execute and see the result. It's like Postman but using the Swagger UI.

#Now, let's create documentation
#In Swagger, File --> Clear Editor
#Paste the following into the editor (choose Cancel if it asks to convert to yaml):
#{
#    "swagger": "2.0",
#    "info": {
#      "version": "1.0",
#      "title": "Our first generated REST API",
#      "description": "<h2>This is a sample server code the is generated from Swagger Documenation with Swagger Editor</h2>"
#    },3
#
#    "paths": {
#      "/greetings": {
#        "get": {
#          "summary": "Returns a list of Greetings",
#          "tags": ["Hello in Different Languages"],
#          "description": "Returns greetings in different languages",
#          "produces": [
#            "application/json"
#          ],
#          "responses": {
#            "200": {
#              "description": "OK"
#            }
#          }
#        }
#      }
#    }
#}

#Go to Generate Server and download the zip file it generates
#Copy the zip into your jmgdo-microservices folder and unzip it and go to the subfolder where it's been extracted:

unzip python-flask-server-generated.zip -d python-flask-server-generated/

cd python-flask-server-generated/python-flask-server

#Build the docker image
docker build . -t mynewserver

#Run docker app
docker run -dp 8080:8080 mynewserver

#Test it using curl
curl localhost:8080/greetings

#If it doesn't work , try changing the config as follows:
docker images
docker rmi -f <IMAGE ID> #where <IMAGE ID> is the id of mynewserver

#Change requirements.txt to include this line where it defines connexion version:
#connexion >= 2.7.0, < 3.0.0

#Build the docker image again
docker build . -t mynewserver

#Run docker app again
docker run -dp 8080:8080 mynewserver

#Test it using curl again, it should show "do some magic!"
curl localhost:8080/greetings


#3. GraphQL
cd jmgdo-microservices/graphql_example

#Build it
docker build . -t graphqlservice

#Run it
docker run -dp 8080:4000 graphqlservice

#Test it
curl localhost:8080



