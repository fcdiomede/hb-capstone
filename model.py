"""Models for cooking site app."""

from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()


class User(db.Model):
    """A user."""

    __tablename__ = 'users'

    user_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    fname = db.Column(db.String)
    lname = db.Column(db.String)
    email = db.Column(db.String, unique=True)
    password = db.Column(db.String, nullable=False)
    profile_picture = db.Column(db.String)

    cookbook = db.relationship('Cookbook')

    def __repr__(self):
        return f'<User user_id={self.user_id} email={self.email}>'


class Cookbook(db.Model):
    """A cookbook"""

    __tablename__ = 'cookbooks'

    cookbook_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    title = db.Column(db.String, nullable=False)
    cover_img = db.Column(db.String)
    user_id = db.Column(db.Integer, db.ForeignKey('users.user_id'))

    user = db.relationship('User')
    recipes = db.relationship('Recipe', secondary="cookbook_recipes")

    def __repr__(self):
        return f'<Cookbook cookbook_id={self.cookbook_id} title={self.title}>'


class Recipe(db.Model):
    """A recipe"""

    __tablename__ = 'recipes'

    recipe_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    title = db.Column(db.String, nullable=False)
    ingredients = db.Column(db.Text)
    time_required = db.Column(db.Integer)
    time_units = db.Column(db.String)
    servings = db.Column(db.Integer)

    cookbooks = db.relationship('Cookbook', secondary="cookbook_recipes")
    steps = db.relationship('Step')

    def __repr__(self):
        return f'<Recipe recipe_id={self.recipe_id} title={self.title}>'


#A recipe could be stored in several cookbooks
#ex. Dinner cookbook and a vegetarian cookbook
class CookbookRecipe(db.Model):
    """Recipes in a specific cookbook."""

    __tablename__ = 'cookbook_recipes'

    cookbook_recipe_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    cookbook_id = db.Column(db.Integer,
                        db.ForeignKey('cookbooks.cookbook_id'),
                        nullable=False)
    recipe_id = db.Column(db.Integer,
                         db.ForeignKey('recipes.recipe_id'),
                         nullable=False)

    def __repr__(self):
        return f'<CookbookRecipe cookbook_id={self.cookbook_id} recipe_id={self.recipe_id}>'


class Step(db.Model):
    """Each step of a recipe"""

    __tablename__ = 'steps'

    step_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    recipe_id = db.Column(db.Integer,
                        db.ForeignKey('recipes.recipe_id'),
                        nullable=False)
    step_number = db.Column(db.Integer, nullable=False)
    body = db.Column(db.Text, nullable=False)
    media = db.Column(db.String)

    recipe = db.relationship('Recipe')

    def __repr__(self):
        return f'<Step step_id={self.step_id} recipe_id={self.recipe_id}>'



# Helper functions

def connect_to_db(flask_app, db_uri='postgresql:///recipeapp', echo=True):
    """Connect the database to our Flask app."""

    # Configure to use our database.
    flask_app.config['SQLALCHEMY_DATABASE_URI'] = db_uri
    flask_app.config['SQLALCHEMY_ECHO'] = echo
    flask_app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

    db.app = flask_app
    db.init_app(flask_app)

    print('Connected to the db!')


if __name__ == "__main__":
    from server import app
    connect_to_db(app)