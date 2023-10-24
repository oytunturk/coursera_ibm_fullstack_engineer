flask --app server --debug run

curl -X GET -i -w '\n' localhost:5000

curl -X GET -i -w '\n' localhost:5000/no_content

curl -X GET -i -w '\n' localhost:5000/exp

curl -X GET -i -w '\n' localhost:5000/data

#Existing person
curl -X GET -i -w '\n' "localhost:5000/name_search?q=Abdel"

#Missing q
curl -X GET -i -w '\n' "localhost:5000/name_search"

#Non-existing person
curl -X GET -i -w '\n' "localhost:5000/name_search?q=qwerty"
