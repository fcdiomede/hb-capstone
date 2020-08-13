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
        cookbook_img = f"/static/img/cooking_{randint(1,7)}"

        crud.create_cookbook(cookbook_title, cookbook_img, user.user_id)
