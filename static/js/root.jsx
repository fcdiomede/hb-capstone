const Router = ReactRouterDOM.BrowserRouter;
const Route =  ReactRouterDOM.Route;
const Link =  ReactRouterDOM.Link;
const Prompt =  ReactRouterDOM.Prompt;
const Switch = ReactRouterDOM.Switch;
const Redirect = ReactRouterDOM.Redirect;


function CookbookCover(props) {
    return (
        <div className="cookbook">
          <p>Name: {props.title}</p>
          <img src={props.imgUrl} />
        </div>
      );
    }

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
    return <CookbookContainer />
}

function Cookbook() {
    return <h2>This is a cookbook!</h2>
}

function Login() {

    const [email, setEmail] = React.useState('');
    const [password, setPassword] = React.useState('');

    //whenever the user makes a change, update the corresponding
    const handleEmailChange = (evt) => {setEmail(evt.currentTarget.value)};
    const handlePasswordChange = (evt) => {setPassword(evt.currentTarget.value)};

    const authenticateUser = () => {
        const user = {
            email: email,
            password: password
          };

        fetch('api/auth-user', {method: 'POST', 
                                 body: JSON.stringify(user), 
                                headers: {'Accept': 'application/json',
                                'Content-Type': 'application/json'}})
        .then((res) => res.json())
        .then((data) => {
            if (data === true) {
                return <Redirect to="/" />;
            } else {
                alert('Password does not match.');
        }
    });
    }

    return (
        <div>
            Email:
            <input type="text" 
                id="emailField" 
                onChange={handleEmailChange} 
                value={email}>
            </input>
            Password:
            <input type="text" 
                id="passwordField" 
                onChange={handlePasswordChange} 
                value={password}>
            </input>
            <button onClick={authenticateUser}>Log In</button>
            {/* <button onClick={createAccount}>Create Account</button> */}
        </div>
    )
}

function NavBar() {
    return <React.Fragment>
        <Router>
        <div>
        <nav>
            <ul>
            <li>
                <Link to="/"> Home </Link>
            </li>
            <li>
                <Link to="/cookbook"> Cookbooks </Link>
            </li>
            <li>
                <Link to="/login"> Logout </Link>
            </li>
            </ul>
        </nav>
        <Switch>
            <Route exact path="/">
                <Homepage />
            </Route>
            <Route path="/cookbook">
                <Cookbook />
            </Route>
            <Route path="/login">
                <Login />
            </Route>
        </Switch>
        </div>
    </Router>
  </React.Fragment>
}

function App() {
    return <NavBar />;

}

ReactDOM.render(<App />, document.getElementById('root'))