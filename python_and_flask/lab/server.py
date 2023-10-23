from flask import Flask, make_response
app = Flask(__name__)

@app.route("/")
def index():
    return "hello world"

@app.route("/no_content")
def content_error():
    return ({"message":"No content found"},{"status_code":204})

@app.route("/exp")
def index_explicit():
    """return 'Hello World' message with a status code of 200

    Returns:
        string: Hello World
        status code: 200
    """
    resp = make_response({"message": "Hello World"})
    resp.status_code = 200
    return resp
