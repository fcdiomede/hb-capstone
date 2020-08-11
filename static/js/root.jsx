const Router = ReactRouterDOM.BrowserRouter;
const Route =  ReactRouterDOM.Route;
const Link =  ReactRouterDOM.Link;
const Prompt =  ReactRouterDOM.Prompt;
const Switch = ReactRouterDOM.Switch;
const Redirect = ReactRouterDOM.Redirect;

function Homepage() {
    return <h1>This is the homepage!</h1>
}

function Cookbook() {
    return <h2>This is a cookbook!</h2>
}

function Login() {
    return <h1>Login/Create Account</h1>
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