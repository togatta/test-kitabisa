from flask import Flask, render_template
import requests
app = Flask(__name__)
app.config["TEMPLATES_AUTO_RELOAD"] = True


@app.route('/', methods=['GET'])
def home():
    return render_template('kitabisa.html',id=0 )


@app.route('/<id>', methods=['GET'])
def number(id):
    r = requests.get('http://backend-numbersapi.default.svc.cluster.local:5000/' + str(id))
    return render_template('kitabisa.html', name = r.text, id=id)

if __name__ == '__main__':
 app.run(host='0.0.0.0')
