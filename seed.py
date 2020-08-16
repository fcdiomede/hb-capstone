import os
import json
from random import choice, randint
from faker import Faker

import crud
import model
import server

os.system('dropdb recipeapp')
os.system('createdb recipeapp')

model.connect_to_db(server.app)
model.db.create_all()

fake = Faker()

#create fake users
for i in range(10):
    fname = fake.first_name()
    lname = fake.last_name()
    email = fake.email()
    password = "test"

    user = crud.create_user(fname, lname, email, password)

#For each user, create 2 fake cookbooks
users = crud.all_users()

for user in users:
    for i in range(2):
        cookbook_title = fake.word()
        cookbook_img = f"/static/img/cooking_{randint(1,7)}.jpg"

        cookbook = crud.create_cookbook(cookbook_title, cookbook_img, 
                                        user.user_id)

#create fake recipes
cookbooks = crud.all_cookbooks()

for cookbook in cookbooks:
    for i in range(2):
        recipe_title = fake.word()
        num_ingredients = randint(1,10)
        ingredients= fake.words(num_ingredients)
        time_required = f"{randint(1,30)} mins"
        servings = randint(1,8)

        recipe = crud.create_recipe(recipe_title, ingredients, time_required, 
                                servings)

        #link recipe to the cookbook
        crud.link_recipe_to_cookbook(cookbook.cookbook_id, recipe.recipe_id)

#create steps in each recipe
recipes = crud.all_recipes()

for recipe in recipes:
    num_steps = randint(1,5)
    for step in range(1,num_steps+1):
        body = fake.text()
        does_step_have_img = choice([True, False])
        if does_step_have_img:
            media = f"/static/img/cooking_{randint(1,7)}.jpg"
        else:
            media = None
        
        crud.create_step(recipe.recipe_id, step, body, media)
