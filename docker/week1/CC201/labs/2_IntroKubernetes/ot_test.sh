#In this lab, you will:
#
# - Use the kubectl CLI
# - Create a Kubernetes Pod
# - Create a Kubernetes Deployment
# - Create a ReplicaSet that maintains a set number of replicas
# - Witness Kubernetes load balancing in action


#This is where the original project comes from:
#[ ! -d 'CC201' ] && git clone https://github.com/ibm-developer-skills-network/CC201.git

#Check kubectl (command line tool) version:
kubectl version

#Basic kubectl commands

#kubectl requires configuration so that it targets the appropriate cluster. Get cluster information with the following command:
kubectl config get-clusters

#A kubectl context is a group of access parameters, including a cluster, a user, and a namespace. View your current context with the following command:
kubectl config get-contexts

#List all the Pods to see if you have any:
kubectl get pods

#Create a simple Pod
MY_NAMESPACE=oytunturk
export MY_NAMESPACE=sn-labs-${MY_NAMESPACE}

#Check the Dockerfile, it will be used to build a docker image and then push it to deployment
docker build -t us.icr.io/$MY_NAMESPACE/hello-world:1 . && docker push us.icr.io/$MY_NAMESPACE/hello-world:1

#Run the hello world app in a container
kubectl run hello-world --image us.icr.io/$MY_NAMESPACE/hello-world:1 --overrides='{"spec":{"template":{"spec":{"imagePullSecrets":[{"name":"icr"}]}}}}'

#The --overrides option above enables us to specify the needed credentials to pull this image from IBM Cloud Container Registry. Note that this is an imperative command, as we told Kubernetes explicitly what to do: run hello-world

#Check the running Pod(s): --> you should see hello-world
kubectl get pods

#Call describe to see more details about the Pod:
kubectl describe pod hello-world

#Delete the Pod
kubectl delete pod hello-world

#List again to see if it's really deleted
kubectl get pods

#Now, let's create a Pod with imperative object configuration. This uses a template in yaml file which makes it easier to share the exactl deployment details
#Note that hello-world-create.yaml contains this template. Insert your user (oytunturk) in the section that says <my_namespace> in that yaml

#Imperatively create a docker image using the config
kubectl create -f hello-world-create.yaml

#Check if it's created actually:
kubectl get pods

#Delete the Pod
kubectl delete pod hello-world

#Check if it's deleted
kubectl get pods

#Now, let's create a Pod with a declarative command. The previous two methods were imperative which were more restrictive. This is the way to go for actual production system.
#A sample hello-world-apply.yaml is provided. Change my_namespace to your user.
#Notice the following in the yaml file:
# - We are creating a Deployment (kind: Deployment).
# - There will be three replica Pods for this Deployment (replicas: 3).
# - The Pods should run the hello-world image (- image: us.icr.io/<my_namespace>/hello-world:1).

#Use kubectl apply to set the desired Kubernetes state to this yaml file. Kubernetes will now try to adjust things automatically for you make sure this is its state without you imperatively telling it what to do (as in previous examples)
kubectl apply -f hello-world-apply.yaml

#Check if the deployments were actually created
kubectl get deployments

#Check if the Pod is created
kubectl get pods

#You can delete a specific pod by using:
pod_name=hello-world-8954f4694-8666d #Get the name from the list of pods you obtained using kubectl get pods
kubectl delete pod $pod_name && kubectl get pods

#Load balancing:
#Since there are three replicas of this application deployed in the cluster, Kubernetes will load balance requests across these three instances. Let’s expose our application to the internet and see how Kubernetes load balances requests.
#In order to access the application, we have to expose it to the internet using a Kubernetes Service.
kubectl expose deployment/hello-world

#List services to see if this service was actually created:
kubectl get services

#Open a split terminal and run the following.
#Since the cluster IP is not accessible outside of the cluster, we need to create a proxy. Note that this is not how you would make an application externally accessible in a production scenario. Run this command in the new terminal window since your environment variables need to be accessible in the original window for subsequent commands.
kubectl proxy

#In the original terminal, access your server using curl:
curl -L localhost:8001/api/v1/namespaces/sn-labs-oytunturk/services/hello-world/proxy

#Run it 10 times to see new Pods created. Kubernetes handles all these new Pod creation for you for load balancing
for i in `seq 10`; do curl -L localhost:8001/api/v1/namespaces/sn-labs-oytunturk/services/hello-world/proxy; done

#Return to the terminal window running the proxy command and kill it using Ctrl+C.
