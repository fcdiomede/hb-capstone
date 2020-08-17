from flask import Flask, render_template, jsonify, request
from model import connect_to_db
import crud


app = Flask(__name__)

@app.route('/')
def root():
    return render_template("root.html")

@app.route('/api/user-cookbooks')
def get_user_cookbooks():
    cookbooks = crud.all_cookbooks()
    cookbook_list = []

    for c in cookbooks:
       cookbook_list.append({"key": c.cookbook_id,"title": c.title, "imgUrl": c.cover_img})

    return jsonify(cookbook_list)

@app.route('/api/auth-user', methods=["POST"])
def authenticate_user():
    data = request.get_json()
    email = data["email"]
    password = data["password"]
    
    user = {"email": email, "password": password}

    correct_password = crud.get_user_by_email(email).password

    return jsonify(user["password"] == correct_password)


if __name__ == '__main__':
    connect_to_db(app)
    app.run(debug=True, host='0.0.0.0')