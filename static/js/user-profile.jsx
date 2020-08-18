const Router = ReactRouterDOM.BrowserRouter;
const Route =  ReactRouterDOM.Route;
const Link =  ReactRouterDOM.Link;
const Prompt =  ReactRouterDOM.Prompt;
const Switch = ReactRouterDOM.Switch;
const Redirect = ReactRouterDOM.Redirect;
const useHistory = ReactRouterDOM.useHistory;

//user profile page components

//specific cookbook card component
function CookbookCover(props) {

    let history = useHistory()

    const data = {'cookbook_id': props.cookbook_id}

    const goToCookbook = () => {
        fetch('/api/set-cookbook', {method: 'POST', 
        body: JSON.stringify(data), 
        headers: {'Accept': 'application/json',
        'Content-Type': 'application/json'}})
        .then(() => history.push('/cookbook'));
    }

    return (
        <div className="cookbook" onClick={goToCookbook}>
          <p>Name: {props.title}</p>
          <img src={props.imgUrl} />
        </div>
      );
    }


//component to hold all cookbook cards
function CookbookContainer() {

    // make a call to the server to ask for information
    //user's personal cookbooks to appear

    const [cookbooks, updateCookbooks] = React.useState([]);

    React.useEffect(() => {
      fetch('/api/user-cookbooks')
      .then((res) => res.json())
      .then((data) => updateCookbooks(data))
    }, []);

    const userCookbooks = []
    for (const cookbook of cookbooks) {
        userCookbooks.push(
          <CookbookCover
            key={cookbook.key}
            cookbook_id={cookbook.key}
            title={cookbook.title}
            imgUrl={cookbook.imgUrl}
          />
        );
      }
     
      return (
        <div>{userCookbooks}</div>
      );
}

function CreateNewCookbook() {

    let history = useHistory();

    const goToCreateCookbookForm = () => {
        history.push('/create-new-cookbook')
    }

    return (
        <button onClick={goToCreateCookbookForm}>Create New Cookbook</button>
    )
}

//main page component
function Homepage() {

    // let history = useHistory();

    // fetch('/api/check-cookies')
    // .then((res) => res.json())
    // .then((data) => {
    //     if (!data) {
    //         history.push('/login')
    //     }
    // })

    return (
        <React.Fragment>
            <CreateNewCookbook />
            <CookbookContainer />
        </React.Fragment>
    ) 
}