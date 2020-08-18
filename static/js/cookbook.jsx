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
    return <div>
        <p> Title: {props.title}</p>
        <p> ingredients: {props.ingredients}</p>
        <p> 
            time required: {props.time_required}
            servings: {props.servings}
        </p>
    </div>
}

function RecipeListItem(props) {
    return <li> {props.title} </li>
}

function RecipeList () {

    const [recipes, updateRecipes] = React.useState(["Loading..."])

    React.useEffect(() => {
        fetch('/api/cookbook-details')
        .then((res) => res.json())
        .then((data) => updateRecipes(data))
    }, []);

    const cookbookRecipes = []
    for (const recipe of recipes) {
        cookbookRecipes.push(
            <RecipeListItem
                key={recipe.key}
                title={recipe.title}
            />
        )
    }

    return <ul>{cookbookRecipes}</ul>
}



function Cookbook() {
    return (
        <React.Fragment>
            <h2>This is a cookbook!</h2>
            <CreateNewCookbook />
            <RecipeList />
            <RecipeDetails />
       </React.Fragment>
    )
}