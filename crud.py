"""CRUD operations."""

from model import db, connect_to_db, Cookbook, Recipe, CookbookRecipe, Step, User


def create_user(fname, lname, email, password):
    """Create and return a new user."""

    user = User(fname=fname, lname=lname, email=email, password=password)

    db.session.add(user)
    db.session.commit()

    return user

if __name__ == '__main__':
    from server import app
    connect_to_db(app)