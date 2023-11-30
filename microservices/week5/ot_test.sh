#Clone the back-end code:
#https://github.com/ibm-developer-skills-network/dealer_evaluation_backend.git

#Deploy back-end microservice1: /products_list
#Deploy back-end microservice2: /dealer_details

#Clone and deploy the front-end app
#https://github.com/ibm-developer-skills-network/dealer_evaluation_frontend.git

#Make changes to the index.html file by replacing the placeholder URLs with the deployment URLs obtained in the Part A of the project.
#Deploy the frontend, and load the home page. Choose a product and dealer and get the price. Get the price for all dealers of a product.

#OT:
#On IBM Cloud Code Engine go to --> CLOUD --> Create Project
#Wait for it, when it's ready click "Code Engine CLI"
#Then you can try the create commands below

ibmcloud ce application create --name prodlist --image us.icr.io/${SN_ICR_NAMESPACE}/prodlist --registry-secret icr-secret --port 5000 --build-context-dir products_list --build-source https://github.com/ibm-developer-skills-network/dealer_evaluation_backend.git

ibmcloud ce application create --name dealerdetails --image us.icr.io/${SN_ICR_NAMESPACE}/dealerdetails --registry-secret icr-secret --port 5000 --build-context-dir dealer_details  --build-source https://github.com/ibm-developer-skills-network/dealer_evaluation_backend.git

#List the apps:
ibmcloud ce app list

#Clone, build, and deploy the front-end app
cd /home/project
git clone https://github.com/ibm-developer-skills-network/dealer_evaluation_frontend.git

cd dealer_evaluation_frontend

#Change index.html to replace placeholder values localhost:5000 and localhost:8080 with the deployed back-end service urls:
# let produrl = "https://prodlist.1abefo78mejc.us-south.codeengine.appdomain.cloud/"
# let dealerurl = "https://dealerdetails.1abefo78mejc.us-south.codeengine.appdomain.cloud/"

#Deploy the front-end app
#build-source - .
#port - 5001
#name - frontend
#image - us.icr.io/${SN_ICR_NAMESPACE}/frontend
ibmcloud ce application create --name frontend2 --image us.icr.io/${SN_ICR_NAMESPACE}/frontend2 --registry-secret icr-secret --port 5001 --build-context-dir frontend2 --build-source .

#Check if deployed successfully:
ibmcloud ce application get -n frontend

#Note the url:
https://frontend2.1abefo78mejc.us-south.codeengine.appdomain.cloud
