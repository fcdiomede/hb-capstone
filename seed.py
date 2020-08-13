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
