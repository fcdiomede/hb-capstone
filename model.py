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

    cookbooks = db.relationship('Cookbook', secondary="cookbook_recipes")

    def __repr__(self):
        return f'<Recipe recipe_id={self.recipe_id} title={self.title}>'

class CookbookRecipe(db.Model):
    """Recipes in a specific cookbook."""

    __tablename__ = 'cookbook_recipes'

    cookbook_recipe_id = db.Column(db.Integer, primary_key=True)
    cookbook_id = db.Column(db.Integer,
                        db.ForeignKey('cookbooks.cookbook_id'),
                        nullable=False)
    recipe_id = db.Column(db.Integer,
                         db.ForeignKey('recipes.recipe_id'),
                         nullable=False)

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
    db.create_all()
    
    # #create a test user
    # test_user = User(fname='T', lname='est', email='test@test.test', password='test')
    # db.session.add(test_user)
    # db.session.commit()

    # #create a test cookbook
    # test_cookbook = Cookbook(title='Experimental', cover_img='a url', user_id=test_user.user_id)
    # db.session.add(test_cookbook)
    # db.session.commit()

    # #create a test recipe
    # test_recipe= Recipe(title="My first recipe", ingredients="eggs")
    # db.session.add(test_recipe)
    # db.session.commit()

    # #connect test recipe and test cookbook
    # cookbook_recipe = CookbookRecipe(cookbook_id= test_cookbook.cookbook_id, recipe_id=test_recipe.recipe_id)
    # db.session.add(cookbook_recipe)
    # db.session.commit()