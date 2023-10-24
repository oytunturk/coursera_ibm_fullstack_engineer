from flask import Flask

app = Flask(__name__)

if False:
#Add a route to handle request
    @app.route('/')
    def hello_world():
        return "<b>My first Flask app!</b>"
        #return {"message":"<b>Hello World!</b>"} #or you can return json

#or multiple routes:
@app.route('/test', methods=["GET","POST"])
def test_hello():
    if request.method == "GET": return jsonify(status="OK", method="GET"), 200
    if request.method == "POST": return jsonify(status="OK", method="POST"), 200
