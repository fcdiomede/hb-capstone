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


@app.route('/api/set-data', methods=['POST'])
def set_cookbook():
    data = request.get_json()
    data_to_set = data["item"]
    data_id = data["data_id"]
    session[data_to_set] = data_id
    print(session)
    return jsonify({'data_id': data_id})



@app.route('/api/cookbook-details')
def get_cookbook_details():

    cookbook_id = session["cookbook_id"]
    recipes = crud.get_cookbook_recipes(cookbook_id)
    data = []

    for recipe in recipes:
        data.append({"key": recipe.recipe_id,
                    "title": recipe.title,
                    "ingredients": recipe.ingredients,
                    "time_required": recipe.time_required,
                    "servings": recipe.servings,
                    "media": recipe.media})
    
    return jsonify(data)


@app.route('/api/recipe-steps')
def get_recipe_steps():
    recipe_id = session["recipe_id"]

    steps = crud.get_steps_for_recipe(recipe_id)
    
    instructions = []
    for i, step in enumerate(steps):
        instructions.append({"num":i+1, "body":step})
    
    return jsonify(steps)



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

