const Router = ReactRouterDOM.BrowserRouter;
const Route =  ReactRouterDOM.Route;
const Link =  ReactRouterDOM.Link;
const Prompt =  ReactRouterDOM.Prompt;
const Switch = ReactRouterDOM.Switch;
const Redirect = ReactRouterDOM.Redirect;
const useHistory = ReactRouterDOM.useHistory;

//specific cookbook card component
function CookbookCover(props) {
    let history = useHistory()

    const goToCookbook =() => {
        history.push('/cookbook');
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

function Cookbook() {
    return <h2>This is a cookbook!</h2>
}

function CreateAccount(props) {

    const [fname, setFName] = React.useState('');
    const [lname, setLName] = React.useState('');

    const hideCreateAccount = () => {
        props.setShowCreateAccount(false)
        props.setVisible('visible')
    }

    let history = useHistory();

    const addUser = () => {
        event.preventDefault();

        //format user data to send to server        
        const user = {'email': props.email, 
                    'password': props.password,
                    'fname': fname,
                    'lname': lname};

        fetch('/api/create-account', {method: 'POST', 
                                body: JSON.stringify(user), 
                                headers: {'Accept': 'application/json',
                                'Content-Type': 'application/json'}})
        .then((res) => res.json())
        .then((data) => {
            if (data.status == "success") {
                alert("Success! Account has been created.")
                history.push('/');
            } else {
                alert('This user already exists. Try logging in.');
        }
    });
    }

    return (<React.Fragment>
         <label>First Name:</label>
            <input type='text'
                id='fname'
                onChange={(evt) => setFName(evt.target.value)} 
                value={fname}></input>
        <label>Last Name:</label>
            <input type='text'
                id='lname'
                onChange={(evt) => setLName(evt.target.value)} 
                value={lname}></input>
        
        <button onClick={addUser}>Create Account</button> 
        <button onClick={hideCreateAccount}> Back </button>
    </React.Fragment>)
}

//login form component
//handles authenticating password
function Login() {
    
    //track email and password enters
    const [email, setEmail] = React.useState('');
    const [password, setPassword] = React.useState('');

    //track button push
    const [showCreateAccount, setShowCreateAccount] = React.useState(false);
    const[visible, setVisible] = React.useState('visible')

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

    //callback for creating an account
    //directs to account creation component
    const createAccount = (event) => {
        event.preventDefault();
        setShowCreateAccount(true)
        setVisible('hidden')
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
            <button onClick={authenticateUser} style={{visibility: visible}}>
                Log In
            </button>
            <button onClick={createAccount} style={{visibility: visible}}>
                Create Account
            </button>
            { showCreateAccount ? <CreateAccount 
                                    setVisible={setVisible}
                                    setShowCreateAccount={setShowCreateAccount}
                                    email={email}
                                    password={password}/> : null }
        </form>
    )
}

function NavBar() {

    // const clearCookies = () => {fetch('/api/clear-cookies')}

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