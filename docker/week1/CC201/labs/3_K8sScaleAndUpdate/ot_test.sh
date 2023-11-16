#Scaling and updating apps - objectives:
# - Scale an application with a ReplicaSet
# - Apply rolling updates to an application
# - Use a ConfigMap to store application configuration
# - Autoscale the application using Horizontal Pod Autoscaler


#Clone the original project:
#[ ! -d 'CC201' ] && git clone https://github.com/ibm-developer-skills-network/CC201.git
cd CC201/labs/3_K8sScaleAndUpdate/

#Export your username (oytunturk)
export MY_NAMESPACE=sn-labs-$USERNAME

#Build and push the docker image using the Dockerfile
docker build -t us.icr.io/$MY_NAMESPACE/hello-world:1 . && docker push us.icr.io/$MY_NAMESPACE/hello-world:1

#Change the username in deployment.yaml and run the image as Deployment
kubectl apply -f deployment.yaml

#List the Pods until the status is 'Running'
kubectl get pods

#Expose the app to internet via Kubernetes
kubectl expose deployment/hello-world

#Note that this is run as ClusterIP
#On another terminal, run proxy service
kubectl proxy

#Go to original terminal and access the app via curl:
curl -L localhost:8001/api/v1/namespaces/sn-labs-$USERNAME/services/hello-world/proxy

#Scale up your app with a ReplicaSet
kubectl scale deployment hello-world --replicas=3

#Now, you'll see 3 pods
kubectl get pods

#You can now access them using:
for i in `seq 10`; do curl -L localhost:8001/api/v1/namespaces/sn-labs-$USERNAME/services/hello-world/proxy; done

#Now, scale down to 1 ReplicaSet
kubectl scale deployment hello-world --replicas=1

#Check if it happened
kubectl get pods

#Now, let's perform a rolling update while the app is still running:
# Rolling updates are an easy way to update our application in an automated and controlled fashion.
# To simulate an update, let’s first build a new version of our application and push it to Container Registry.
#  Edit app.js. The path to this file is CC201/labs/3_K8sScaleAndUpdate/.
#  Change the welcome message from 'Hello world from ' + hostname + '! Your app is up and running!\n' to 'Welcome to ' + hostname + '! Your app is up and running!\n'. Make sure to save the file when you’re done.

#Build and push the new image after modifying app.js
docker build -t us.icr.io/$MY_NAMESPACE/hello-world:2 . && docker push us.icr.io/$MY_NAMESPACE/hello-world:2

#Check images running on ibmcloud
ibmcloud cr images

#Update the =Deployment to the new version:
kubectl set image deployment/hello-world hello-world=us.icr.io/$MY_NAMESPACE/hello-world:2

#Get teh status of the rolling update
kubectl rollout status deployment/hello-world

#You can also get the Deployment with -wide option to see if the new version is running
kubectl get deployments -o wide

#Check the new version using curl. You should see the new message that you put in app.js above
curl -L localhost:8001/api/v1/namespaces/sn-labs-$USERNAME/services/hello-world/proxy

#You can rollback to old version if needed using:
kubectl rollout undo deployment/hello-world

#Check the status again to make sure it rolled back to the first version
kubectl rollout status deployment/hello-world

#Or using -wide option as explained above
kubectl get deployments -o wide


#Using a ConfigMap to store configuration
# ConfigMaps and Secrets are used to store configuration information separate from the code so that nothing is hardcoded.
# It also lets the application pick up configuration changes without needing to be redeployed.
# To demonstrate this, we’ll store the application’s message in a ConfigMap so that the message can be updated simply by updating the ConfigMap.

#Create a config map with a new message
kubectl create configmap app-config --from-literal=MESSAGE="This message came from a ConfigMap!"

#Edit deployment-configmap-env-var.yaml. The path to this file is CC201/labs/3_K8sScaleAndUpdate/. You need to insert your namespace where it says <my_namespace>.

#In the same file, notice the section reproduced below.
#The bottom portion indicates that environment variables should be defined in the container from the data in a ConfigMap named app-config

#Change app.js --> res.send line to following:
#res.send(process.env.MESSAGE + '\n')

#Build and push the new image
docker build -t us.icr.io/$MY_NAMESPACE/hello-world:3 . && docker push us.icr.io/$MY_NAMESPACE/hello-world:3

#Apply the new Deployment configuration
kubectl apply -f deployment-configmap-env-var.yaml

#Test it
curl -L localhost:8001/api/v1/namespaces/sn-labs-$USERNAME/services/hello-world/proxy

#With this approach, you can change the message without recrateing and pushing an image which gives us flexibility making changes without deploying again
kubectl delete configmap app-config && kubectl create configmap app-config --from-literal=MESSAGE="This message is different, and you didn't have to rebuild the image!"

#Restart the deployment and check the result
kubectl rollout restart deployment hello-world

curl -L localhost:8001/api/v1/namespaces/sn-labs-$USERNAME/services/hello-world/proxy


#Autoscale the hello-world application using Horizontal Pod Autoscaler
# Please add the following section to the deployment.yaml file under the template.spec.containers section for increasing the CPU resource utilization
# after containerPort: 8080
#          name: http
#        resources:
#          limits:
#            cpu: 50m
#          requests:
#            cpu: 20m

#Apply the Deployment
kubectl apply -f deployment.yaml

#Autoscale deployment
kubectl autoscale deployment hello-world --cpu-percent=5 --min=1 --max=10

#Check current status
kubectl get hpa hello-world

#Start proxy server in another terminal
kubectl proxy

#Curl into the app in the original terminal
for i in `seq 100000`; do curl -L localhost:8001/api/v1/namespaces/sn-labs-$USERNAME/services/hello-world/proxy; done

#Observe replicas as they increase:
kubectl get hpa hello-world --watch

#Get details of autoscaler
kubectl get hpa hello-world

#Delete the Deployment
kubectl delete deployment hello-world

#Delete the service
kubectl delete service hello-world
