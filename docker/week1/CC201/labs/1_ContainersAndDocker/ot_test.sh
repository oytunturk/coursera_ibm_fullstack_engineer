docker --version
docker images

docker pull hello-world
docker images

docker run hello-world

#Check the running containers
docker ps -a #You should see hello-world with a CONTAINERID

#Remove the running container (get <container_id> from previous step)
docker container rm <container_id>

docker ps -a #Now you shouldn't see hello-world


#The current working directory contains a simple Node.js application that we will run in a container. The app will print a hello message along with the hostname. The following files are needed to run the app in a container:
# app.js is the main application, which simply replies with a hello world message.
# package.json defines the dependencies of the application.
# Dockerfile defines the instructions Docker uses to build the image.
#  The FROM instruction initializes a new build stage and specifies the base image that subsequent instructions will build upon.
#  The COPY command enables us to copy files to our image.
#  The RUN instruction executes commands.
#  The EXPOSE instruction exposes a particular port with a specified protocol inside a Docker Container.
#  The CMD instruction provides a default for executing a container, or in other words, an executable that should run in your container.

#Build the image using Dockerfile
docker build . -t myimage:v1

#Check the new image you created, note it's different from hello-world
docker images

#Run the image you created
docker run -dp 8080:8080 myimage:v1

#Check it's running
docker ps -a

#Test it with a curl command (you can also navigate to localhost:8080 on your web browser. You should see a Hello World message
curl localhost:8080

#Stop all running docker instances
docker stop $(docker ps -q)

#Or you can stop a specific instance by:
docker stop <container_id>

#Check if it really stopped
docker ps


### Now, let's push thing to ibm cloud registry. This could be a bit different with every cloud service provider.
#
#1. The environment should have already logged you into the IBM Cloud account that has been automatically generated for you by the Skills Network Labs environment. The following command will give you information about the account you’re targeting:
ibmcloud target

#2. The environment also created an IBM Cloud Container Registry (ICR) namespace for you. Since Container Registry is multi-tenant, namespaces are used to divide the registry among several users. Use the following command to see the namespaces you have access to:
ibmcloud cr namespaces

#3. Ensure that you are targeting the region appropriate to your cloud account, for instance us-south region where these namespaces reside as you saw in the output of the ibmcloud target command.
ibmcloud cr region-set us-south

#4. Log your local Docker daemon into IBM Cloud Container Registry so that you can push to and pull from the registry.
ibmcloud cr login

#5. Export your namespace as an environment variable so that it can be used in subsequent commands.
export MY_NAMESPACE=sn-labs-oytunturk

#6. Tag your image so that it can be pushed to IBM Cloud Container Registry.
docker tag myimage:v1 us.icr.io/$MY_NAMESPACE/hello-world:1

#7. Push the newly tagged image to IBM Cloud Container Registry.
docker push us.icr.io/$MY_NAMESPACE/hello-world:1

#8. Verify that the image was successfully pushed by listing images in Container Registry.
ibmcloud cr images

#9. Optionally, to only view images within a specific namespace.
ibmcloud cr images --restrict $MY_NAMESPACE
