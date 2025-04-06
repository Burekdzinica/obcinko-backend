from flask import Flask, jsonify
from flask_cors import CORS
import json

app = Flask(__name__)
CORS(app)

app.url_map.strict_slashes = False  

@app.route("/api/<string:date>")
def hello(date):
    with open('solutions.json', 'r', encoding='utf-8') as file:
        data = json.load(file)

    try:
        return jsonify({"solution": data[date]}), 200
    except:
        return jsonify({"error": "Not Found"}), 404