const Router = ReactRouterDOM.BrowserRouter;
const Route =  ReactRouterDOM.Route;
const Link =  ReactRouterDOM.Link;
const Prompt =  ReactRouterDOM.Prompt;
const Switch = ReactRouterDOM.Switch;
const Redirect = ReactRouterDOM.Redirect;
const useHistory = ReactRouterDOM.useHistory;

//specific cookbook card component
function CookbookCover(props) {
    return (
        <div className="cookbook">
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
    return <CookbookContainer />
}

function Cookbook() {
    return <h2>This is a cookbook!</h2>
}

//login form component
//handles authenticating password
function Login() {

    //track email and password enters
    const [email, setEmail] = React.useState('');
    const [password, setPassword] = React.useState('');

    let history = useHistory();

    //makes a server request to authenticate password typed in
    const authenticateUser = (event) => {
        event.preventDefault();

        //format user data to send to server        
        const user = {'email': email, 'password': password};

        fetch('/api/login', {method: 'POST', 
                                body: JSON.stringify(user), 
                                headers: {'Accept': 'application/json',
                                'Content-Type': 'application/json'}})
        .then((res) => res.json())
        .then((data) => {
            if (data.status == "success") {
                history.push('/');
            } else {
                alert('Email/Password combination is incorrect.');
        }
    });
    }

    //login form
    return (
        <form>
            <label>Email:</label>
            <input type='text'
                id='email'
                onChange={(evt) => setEmail(evt.target.value)} 
                value={email}>
            </input>
            <label>Password:</label>
            <input type='password' 
                id='password'
                onChange={(evt) => setPassword(evt.currentTarget.value)}
                value={password}>
            </input>
            <button onClick={authenticateUser}>Log In</button>
            {/* <button onClick={createAccount}>Create Account</button> * */}
        </form>
    )
}

function NavBar() {
    return <React.Fragment>
        <Router>
        <div>
        <nav>
            <ul>
            <li>
                <Link to='/'> Home </Link>
            </li>
            <li>
                <Link to='/cookbook'> Cookbooks </Link>
            </li>
            <li>
                <Link to='/login'> Logout </Link>
            </li>
            </ul>
        </nav>
        <Switch>
            <Route exact path='/'>
                <Homepage />
            </Route>
            <Route path='/cookbook'>
                <Cookbook />
            </Route>
            <Route path='/login'>
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