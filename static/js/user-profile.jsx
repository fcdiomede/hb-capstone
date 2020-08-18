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

    const goToCookbook =() => {
        fetch(`/api/cookbook-details/${props.key}`)
        .then((res => res.json()))
        .then(history.push('/cookbook'));
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
            title={cookbook.title}
            imgUrl={cookbook.imgUrl}
          />
        );
      }
     
      return (
        <div>{userCookbooks}</div>
      );
}


function Homepage() {

    // let history = useHistory();

    // fetch('/api/check-cookies')
    // .then((res) => res.json())
    // .then((data) => {
    //     if (!data) {
    //         history.push('/login')
    //     }
    // })

    return <CookbookContainer />
}