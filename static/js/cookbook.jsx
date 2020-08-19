const Router = ReactRouterDOM.BrowserRouter;
const Route =  ReactRouterDOM.Route;
const Link =  ReactRouterDOM.Link;
const Prompt =  ReactRouterDOM.Prompt;
const Switch = ReactRouterDOM.Switch;
const Redirect = ReactRouterDOM.Redirect;
const useHistory = ReactRouterDOM.useHistory;

function NewCookbookForm() {

   //newcookbook form
   return (
       <form>
           <label>Title:</label>
           <input type='text'
               id='title'>
           </input>
           <label>Cover Img:</label>
           <input type='file' 
               id='coverImg'
               accept="image/png, image/jpg"
               encType="multipart/form-data">
           </input>
           <button>Create It!</button>
       </form>
   )
}

function RecipeDetails (props) {

    const currentRecipeId = props.currentRecipe.data_id
    const currentRecipeDetails = []

    console.log(props)

    for (const recipe of props.allRecipes) {
        if (recipe.key === currentRecipeId) {
            currentRecipeDetails.push(recipe)
        }
    }
    console.log(currentRecipeDetails)

    return <div>
        <p> Title: {currentRecipeDetails.title}</p>
        <p> ingredients: {currentRecipeDetails.ingredients}</p>
        <p> 
            time required: {currentRecipeDetails.time_required}
            servings: {currentRecipeDetails.servings}
        </p>
    </div>
}

function RecipeListItem(props) {

    let data = {'data_id': props.recipe_id,
            'item': 'recipe_id'}

    const goToRecipe = () => {
        fetch('/api/set-data', {method: 'POST', 
        body: JSON.stringify(data), 
        headers: {'Accept': 'application/json',
        'Content-Type': 'application/json'}})
        .then((res) => res.json())
        .then((data) => props.setCurrentRecipe(data))
    }

    return <li onClick={goToRecipe}> {props.title} </li>
}

function RecipeList (props) {

    const cookbookRecipes = []
    for (const recipe of props.recipes) {
        cookbookRecipes.push(
            <RecipeListItem
                key={recipe.key}
                recipe_id={recipe.key}
                title={recipe.title}
                setCurrentRecipe={props.setCurrentRecipe}
            />
        )
    }

    return <ul>{cookbookRecipes}</ul>
}



function Cookbook() {

    const [recipes, setRecipes] = React.useState([])
    const [currentRecipe, setCurrentRecipe] = React.useState('')


    React.useEffect(() => {
        fetch('/api/cookbook-details')
        .then((res) => res.json())
        .then((data) => setRecipes(data))
    }, []);


    return (
        <React.Fragment>
            <h2>This is a cookbook!</h2>
            <CreateNewCookbook />
            <RecipeList recipes={recipes} setCurrentRecipe={setCurrentRecipe}/>
            <RecipeDetails currentRecipe={currentRecipe} allRecipes={recipes}/>
       </React.Fragment>
    )
}