flask --app server --debug run

curl -X GET -i -w '\n' localhost:5000

curl -X GET -i -w '\n' localhost:5000/no_content

curl -X GET -i -w '\n' localhost:5000/exp

curl -X GET -i -w '\n' localhost:5000/data

#Test existing person
curl -X GET -i -w '\n' "localhost:5000/name_search?q=Abdel"

#Test missing q
curl -X GET -i -w '\n' "localhost:5000/name_search"

#Test non-existing person
curl -X GET -i -w '\n' "localhost:5000/name_search?q=qwerty"

#Test count end-point
curl -X GET -i -w '\n' "localhost:5000/count"

#Test the /person/uuid URL
curl -X GET -i localhost:5000/person/66c09925-589a-43b6-9a5d-d1601cf53287

#Test invalid uuid
curl -X GET -i localhost:5000/person/not-a-valid-uuid

#Test valid uuid that doesn't exist in data
curl -X GET -i localhost:5000/person/11111111-589a-43b6-9a5d-d1601cf51111

#Test the DELETE /person/uuid URL
curl -X DELETE -i localhost:5000/person/66c09925-589a-43b6-9a5d-d1601cf53287

#Test if the data count has reduced by one
curl -X GET -i localhost:5000/count

#Test deleting an invalid uuid
curl -X DELETE -i localhost:5000/person/not-a-valid-uuid

#Test deleting a valid uuid that's not in data
curl -X DELETE -i localhost:5000/person/11111111-589a-43b6-9a5d-d1601cf51111

#Test POST with json input
curl -X POST -i -w '\n' \
  --url http://localhost:5000/person \
  --header 'Content-Type: application/json' \
  --data '{
        "id": "4e1e61b4-8a27-11ed-a1eb-0242ac120002",
        "first_name": "John",
        "last_name": "Horne",
        "graduation_year": 2001,
        "address": "1 hill drive",
        "city": "Atlanta",
        "zip": "30339",
        "country": "United States",
        "avatar": "http://dummyimage.com/139x100.png/cc0000/ffffff"
}'

#Test POST with empty json
curl -X POST -i -w '\n' \
  --url http://localhost:5000/person \
  --header 'Content-Type: application/json' \
  --data '{}'

#Test error handling (invalid routes, without error handling, it returns an HTML page and it's hard to figure out what went wrong for the user)
curl -X POST -i -w '\n' http://localhost:5000/notvalid
