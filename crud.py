"""CRUD operations."""

from model import db, connect_to_db, Cookbook, Recipe, CookbookRecipe, Step, User


def create_user(fname, lname, email, password, profile_picture='a url'):
    """Create and return a new user"""

    user = User(fname=fname, lname=lname, email=email, password=password,
                profile_picture=profile_picture)

    db.session.add(user)
    db.session.commit()

    return user


def create_cookbook(title, cover_img, user_id):
    """Create and return and new cookbook"""

    cookbook = Cookbook(title=title, cover_img=cover_img, user_id=user_id)

    db.session.add(cookbook)
    db.session.commit()

    return cookbook

def create_recipe(title, ingredients):
    """Create and return a new recipe"""

    recipe = Recipe(title=title, ingredients=ingredients)

    db.session.add(recipe)
    db.session.commit()

    return recipe

def link_recipe_to_cookbook(cookbook_id, recipe_id):
    """Link a recipe to a cookbook and return linkage object"""

    cookbook_recipe = CookbookRecipe(cookbook_id=cookbook_id, 
                                    recipe_id=recipe_id)

    db.session.add(cookbook_recipe)
    db.session.commit()

    return cookbook_recipe

def create_step(recipe_id, step_number, body, media):
    """Create and return a recipe step"""

    step = Step(recipe_id=recipe_id, step_number=step_number, 
                body=body, media=media)

    db.session.add(step)
    db.session.commit()

    return step


if __name__ == '__main__':
    from server import app
    connect_to_db(app)