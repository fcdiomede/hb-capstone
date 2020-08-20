const Router = ReactRouterDOM.BrowserRouter;
const Route =  ReactRouterDOM.Route;
const Link =  ReactRouterDOM.Link;
const Prompt =  ReactRouterDOM.Prompt;
const Switch = ReactRouterDOM.Switch;
const Redirect = ReactRouterDOM.Redirect;
const useHistory = ReactRouterDOM.useHistory;

//login page components

function CreateAccount(props) {

    const [fname, setFName] = React.useState('');
    const [lname, setLName] = React.useState('');

    //callback for back button
    const hideCreateAccount = () => {
        props.setShowCreateAccount(false)
        props.setVisible('visible')
    }

    let history = useHistory();

    //callback for user creation
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

    //track button pushes
    const [showCreateAccount, setShowCreateAccount] = React.useState(false);

    let history = useHistory();

    //callback for user login button
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
    const createAccount = (event) => {
        event.preventDefault();
        setShowCreateAccount(true)
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
            { showCreateAccount ? <CreateAccount 
                                    setShowCreateAccount={setShowCreateAccount}
                                    email={email}
                                    password={password}/> : 
                                    <div>
                                         <button onClick={authenticateUser}>
                                            Log In
                                        </button>
                                        <button onClick={createAccount}>
                                            Create Account
                                        </button>
                                    </div> }
        </form>
    )
}