const Router = ReactRouterDOM.BrowserRouter;
const Route =  ReactRouterDOM.Route;
const Link =  ReactRouterDOM.Link;
const Prompt =  ReactRouterDOM.Prompt;
const Switch = ReactRouterDOM.Switch;
const Redirect = ReactRouterDOM.Redirect;

function Homepage() {
    return <div> Welcome to my site </div>
}

function App() {
    return (
        <Router>
          <div>
            <nav>
              <ul>
                <li>
                    <Link to="/"> Home </Link>
                </li>
              </ul>
            </nav>
            <Switch>
              <Route path="/">
                <Homepage />
              </Route>
            </Switch>
          </div>
        </Router>
      );

}

ReactDOM.render(<App />, document.getElementById('root'))