from flask import Flask, render_template, jsonify, request
from model import connect_to_db


app = Flask(__name__)

@app.route('/')
def root():
    return render_template("root.html")


if __name__ == '__main__':
    connect_to_db(app)
    app.run(debug=True, host='0.0.0.0')