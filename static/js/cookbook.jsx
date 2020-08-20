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

function RecipeStep (props) {
    return (
            <li>{props.body} </li>
    )
}

function RecipeDetails (props) {

    if (!props.recipeDetails) {
        return <div></div>
    }
    console.log(props.recipeDetails)
    
      const recipeSteps = []
      for (const step of props.recipeDetails.steps) {
        recipeSteps.push(
          <RecipeStep
            key={step.key}
            num={step.num}
            body={step.body}
          />
        );
      }

    return <div>
        <div> Title: {props.recipeDetails.title}</div>
        <img src={props.recipeDetails.media} />
        <div> ingredients: {props.recipeDetails.ingredients}</div>
        <div> 
            time required: {props.recipeDetails.time_required}
            servings: {props.recipeDetails.servings}
        </div>
        <ol>{recipeSteps}</ol>
    </div>
}

function RecipeListItem(props) {

    const goToRecipe = () => {
        fetch(`/api/recipe-details/${props.recipeId}`, {method: 'POST', 
        headers: {'Accept': 'application/json',
        'Content-Type': 'application/json'}})
        .then((res) => res.json())
        .then((data) => props.setRecipeDetails(data));
    }

    return <li onClick={goToRecipe}> {props.title} </li>
}

function RecipeList (props) {

    const cookbookRecipes = []
    for (const recipeId in props.recipes) {
        cookbookRecipes.push(
            <RecipeListItem
                key={recipeId}
                recipeId={recipeId}
                title={props.recipes[recipeId]}
                setRecipeDetails={props.setRecipeDetails}
            />
        )
    }

    return <ul>{cookbookRecipes}</ul>
}

function RecipieForm () {
    return (
        <form>
            <label>Title</label>
            <input type='text'></input>
            <label>Cover Photo</label>
            <input type='file' 
               id='coverImg'
               accept="image/png, image/jpg"
               encType="multipart/form-data"></input>
            <label>Ready in Mins:</label>
            <input type='text'></input>
            <label>Servings:</label>
            <input type='text'></input>
            <label>Ingredients</label>
            <input type='area'></input>
            <label>Steps</label>
            <input type='area'></input>
        </form>
    )
}


function ChangeRecipeButton(props) {

    const showForm = () => {
        props.setShowRecipeDetails(false)
    }

    return <button onClick={showForm}>{ props.caption }</button>
}

function BackButton(props) {

    const hideForm = () => {
        props.setShowRecipeDetails(true)
    }

    return <button onClick={hideForm}>Back to Recipe Details</button>

}

function Cookbook() {

    const [recipes, setRecipes] = React.useState([])
    const [recipeDetails, setRecipeDetails] = React.useState('')
    const [showRecipeDetails, setShowRecipeDetails] = React.useState(true)

    React.useEffect(() => {
        fetch('/api/cookbook-details')
        .then((res) => res.json())
        .then((data) => setRecipes(data))
    }, []);


    return (
        <React.Fragment>
            <h2>This is a cookbook!</h2>
            <RecipeList recipes={recipes} setRecipeDetails={setRecipeDetails}/>
            { showRecipeDetails ?  <div>
                                        <CreateNewCookbook />
                                        <ChangeRecipeButton caption='Edit Recipe'
                                                            setShowRecipeDetails={setShowRecipeDetails}/>
                                        <ChangeRecipeButton caption='New Recipe' 
                                                            setShowRecipeDetails={setShowRecipeDetails}/>
                                        <RecipeDetails  recipeDetails={recipeDetails}/> 
                                    </div>
                                    :
                                    <div>
                                        <BackButton setShowRecipeDetails={setShowRecipeDetails}/>
                                        <RecipieForm />
                                    </div>}
           
       </React.Fragment>
    )
}