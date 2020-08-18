from flask import Flask, render_template, jsonify, request, session
from model import connect_to_db
import crud


app = Flask(__name__)
app.secret_key = "outofthefryingpan"

@app.route('/')
def root():
    return render_template("root.html")

@app.route('/api/user-cookbooks')
def get_user_cookbooks():

    user_id = session["user_id"]
    
    cookbooks = crud.cookbooks_by_user_id(user_id)
    cookbook_list = []

    for c in cookbooks:
       cookbook_list.append({"key": c.cookbook_id,
                            "title": c.title, 
                            "imgUrl": c.cover_img})

    return jsonify(cookbook_list)


@app.route('/api/login', methods=['POST'])
def authenticate_user():
    data = request.get_json()
    email = data["email"]
    password = data["password"]

    user = crud.get_user_by_email(email)

    if user and password == user.password:
        session["user_id"] = user.user_id
        status = "success"
    else:
        status = "error"
    
    return jsonify({'status':status})

@app.route('/api/create-account', methods=['POST'])
def create_user():
    data = request.get_json()
    email = data["email"]
    password = data["password"]
    fname = data["fname"]
    lname = data["lname"]

    user = crud.get_user_by_email(email)

    if user:
        status = "error"
    else:
        status = "success"
        new_user = crud.create_user(
                        fname=fname,
                        lname=lname,
                        email=email,
                        password=password)
        session["user_id"] = new_user.user_id
    
    return jsonify({'status':status})
    

# @app.route('/api/clear-cookies')
# def clear_cookies():
#     print(session["user_id"])
#     session.pop("user_id")
#     print(session["user_id"])


# @app.route('/api/check-cookies')
# def is_user_id_stored():
#     return "user_id" in session

if __name__ == '__main__':
    connect_to_db(app)
    app.run(host='0.0.0.0')

