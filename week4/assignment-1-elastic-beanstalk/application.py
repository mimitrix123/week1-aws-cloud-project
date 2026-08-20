from flask import Flask, jsonify

app = Flask(__name__)

@app.get('/')
def home():
    return '<h1>Week 4 Elastic Beanstalk Application</h1><p>Deployed automatically on AWS.</p>'

@app.get('/health')
def health():
    return jsonify(status='ok', service='week4-beanstalk')

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
