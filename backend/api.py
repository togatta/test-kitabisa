from flask import Flask
import requests
app = Flask(__name__)
app.config["TEMPLATES_AUTO_RELOAD"] = True

@app.route('/', methods=['GET'])
def home():
    return "UP"


@app.route('/<id>', methods=['GET'])
def number(id):
    r = requests.get('http://numbersapi.com/' + str(id), allow_redirects=False)
    r.mimetype = "text/plain"
    return r.text

if __name__ == '__main__':
 app.run(host='0.0.0.0')
