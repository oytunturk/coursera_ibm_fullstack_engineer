flask --app server --debug run
curl -X GET -i -w '\n' localhost:5000
curl -X GET -i -w '\n' localhost:5000/no_content
