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

function RecipieForm (props) {
     //track what user is entering in fields
     const [title, setTitle] = React.useState('');
     const [photo, setPhoto] = React.useState('');
     const [mins, setMins] = React.useState('');
     const [servings, setServings] = React.useState('');
     const [ingredients, setIngredients] = React.useState('');
     const [steps, setSteps] = React.useState(['']);

     console.log(props.recipeDetails)


     if (props.buttonClicked === 'edit') {
        React.useEffect(() => {
            setTitle(props.recipeDetails.title)
            setMins(props.recipeDetails.time_required)
            setServings(props.recipeDetails.servings)
            setIngredients(props.recipeDetails.ingredients)
            const instructions = [];
            for (const step of props.recipeDetails.steps) {
                instructions.push(step.body);
            }
            setSteps(instructions);
        },[])
     }
    
    const addStep = (evt) => {
        evt.preventDefault();
        setSteps([...steps, '']);
    };

    const handleStepChange = (evt) => {
        const updatedSteps = [...steps];
        updatedSteps[evt.target.dataset.idx] = evt.target.value;
        setSteps(updatedSteps);
      };

    const deleteStep = (evt) => {
        const updatedSteps = [...steps];
        const deleteIndex = evt.target.dataset.idx;
        updatedSteps.splice(deleteIndex, 1);
        setSteps(updatedSteps);
    };

    return (
        <form>
            <label>Title</label>
            <input type='text'
                    id='title'
                    onChange={(evt) => setTitle(evt.target.value)}
                    value={title}></input>
            <label>Cover Photo</label>
            <input type='file' 
               id='coverImg'
               accept="image/png, image/jpg"
               encType="multipart/form-data"
               onChange={(evt) => setPhoto(evt.target.value)}
                value={photo}></input>
            <label>Ready in Mins:</label>
            <input type='text'
                    id='readyMins'
                    onChange={(evt) => setMins(evt.target.value)}
                    value={mins}></input>
            <label>Servings:</label>
            <input type='text'
                    id='servings'
                    onChange={(evt) => setServings(evt.target.value)}
                    value={servings}></input>
            <label>Ingredients (seperate each with comma)</label>
            <input type='area'
                    id='ingredients'
                    onChange={(evt) => setIngredients(evt.target.value)}
                    value={ingredients}></input>
            <label>Steps:</label>
            <ol>
            {
                steps.map((stepBody, index) => {
                    return (
                        <li key={`step-${index}`}>
                            <input type='area'
                                    value={stepBody}
                                    id={`step-${index}`}
                                    data-idx={index}
                                    onChange={handleStepChange}></input>
                            <input type='button' 
                                    data-idx={index} 
                                    onClick={deleteStep}
                                    value='Delete' />
                        </li>
                    )
                }) 
            }
            </ol>
            <button onClick={addStep}>Add Step</button>
        </form>
    )
}

function ChangeRecipeButton(props) {

    const showForm = () => {
        if (props.caption === 'Edit Recipe') {
            props.setShowRecipeDetails([false, "edit"])
        } else {
            props.setShowRecipeDetails([false, "new"])
        }
    }

    return <button onClick={showForm}>{ props.caption }</button>
}

function BackButton(props) {

    const hideForm = () => {
        props.setShowRecipeDetails([true])
    }

    return <button onClick={hideForm}>Back to Recipe Details</button>

}

function Cookbook() {

    const [recipes, setRecipes] = React.useState([])
    const [recipeDetails, setRecipeDetails] = React.useState('')
    const [showRecipeDetails, setShowRecipeDetails] = React.useState([true])

    React.useEffect(() => {
        fetch('/api/cookbook-details')
        .then((res) => res.json())
        .then((data) => setRecipes(data))
    }, []);


    return (
        <React.Fragment>
            <h2>This is a cookbook!</h2>
            <RecipeList recipes={recipes} setRecipeDetails={setRecipeDetails}/>
            { showRecipeDetails[0] ?  <div>
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
                                        <RecipieForm recipeDetails={recipeDetails}
                                                        buttonClicked={showRecipeDetails[1]}/>
                                    </div>}
           
       </React.Fragment>
    )
}