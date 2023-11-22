#Original project:
#[ ! -d 'jmgdo-microservices' ] && git clone https://github.com/ibm-developer-skills-network/jmgdo-microservices.git

cd jmgdo-microservices/CRUD

#Install dependencies
python3 -m pip install flask flask_cors

#Run the server
python3 products.py

#Add item and test it
curl -X POST -H "Content-Type: application/json" \
    -d '{"id": 145, "name": "Pen", "price": 2.5}' \
    http://localhost:5000/products

curl http://localhost:5000/products/145

