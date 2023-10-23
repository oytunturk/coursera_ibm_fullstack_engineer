from flask import Flask

app = Flask(__name__)

#Add a route to handle request
@app.route('/')
def hello_world():
    return "<b>My first Flask app!</b>"


