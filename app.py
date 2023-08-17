from flask import Flask
import os

app = Flask(__name__)

@app.route("/")
def hello():
    return "Flask inside Docker by Bala!! done on August 17th 2023 at 8:46 changed again at 8:48"


if __name__ == "__main__":
    port = int(os.environ.get("PORT", 5000))
    app.run(debug=True,host='0.0.0.0',port=port)
