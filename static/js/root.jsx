const Router = ReactRouterDOM.BrowserRouter;
const Route =  ReactRouterDOM.Route;
const Link =  ReactRouterDOM.Link;
const Prompt =  ReactRouterDOM.Prompt;
const Switch = ReactRouterDOM.Switch;
const Redirect = ReactRouterDOM.Redirect;
const useHistory = ReactRouterDOM.useHistory;



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
            <Route path='/create-new-cookbook'>
                <NewCookbookForm />
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