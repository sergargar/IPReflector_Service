from flask import Flask, request
app = Flask(__name__)
@app.route('/')
def index():
  try:
    return request.remote_addr
  except:
    return "FlaskApp Error: Unable to get client remote address"

if __name__ == '__main__':
 app.run(host="0.0.0.0", port=80)