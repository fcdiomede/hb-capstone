"""CRUD operations."""

from model import db, connect_to_db, Cookbook, Recipe, CookbookRecipe, Step, User


def create_user(fname, lname, email, password):
    """Create and return a new user."""

    user = User(fname=fname, lname=lname, email=email, password=password)

    db.session.add(user)
    db.session.commit()

    return user

    
def create_cookbook(title, cover_img, user_id):
    """Create and return and new cookbook"""

    cookbook = Cookbook(title=title, cover_img=cover_img, user_id=user_id)

    db.session.add(cookbook)
    db.session.commit()

    return cookbook

if __name__ == '__main__':
    from server import app
    connect_to_db(app)