#Objectives:
# Use the oc CLI (OpenShift command line interface)
# Use the OpenShift web console
# Build and deploy an application using s2i (‘Source-to-image’ build strategy)
# Inspect a BuildConfig and an ImageStream
# Autoscale the application

#Check oc version (oc is similar to kubectl but has additional things)
oc version

#Download the original project
#[ ! -d 'CC201' ] && git clone https://github.com/ibm-developer-skills-network/CC201.git

#List the currently running Pods using oc
oc get pods

#Get OpenShift related objects
oc get buildconfigs

#View OpenShift project that's currenlty in use:
oc project

#In addition to the CLI, OpenShift provides an intuitive web console. This is a useful and powerful feature because it enables you to deploy applications, view resources, monitor applications and view logs, and much more right in the console.
#Let’s open up the console and have a look around.
#To open openshift web console, click on the Skills Network button on the right, it will open the **멬ls Network Toolbox�Then click the Cloud then Open OpenShift console as shown in the following image.

#The console should open to the project details for the project you have been assigned. Take a look at all the information OpenShift provides you in an intuitive, visual manner. Click through the Dashboard, Overview, and other tabs for this project to see additional information. You should see inventory on the resources that currently exist in this project, the YAML that defines this project, and much more.

#Familiarize yourself with the items in the left navigation menu. You can see Operators, many different Kubernetes objects, and some OpenShift-specific objects, all of which we have talked about in this course. There won’t yet be many instances of these objects, but they will fill up once we deploy our application.

#Notice the word “Administrator” at the top left. This indicates that you are in the Administrator perspective. There is also a Developer perspective. Each perspective provides workflows specific to that persona. Switch to the Developer perspective to begin deploying an application. (If it says “Developer” already, don’t change it.)

#You can deploy an app using teh web console:
#The Developer perspective provides workflows specific to developer use cases, such as the ability to create and deploy applications. Let’s start here! You are likely in the “Topology” view, which provides a visual representation of applications. If not, switch to it to take a look.

#Let us add a new application to this project. There are several ways to add a new application in Openshift.

#Click the +Add button to add a new application.

#Select Import from Git repo and copy/paste the following url:
https://github.com/sclorg/nodejs-ex.git

