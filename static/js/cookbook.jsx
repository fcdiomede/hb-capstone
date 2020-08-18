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
               enctype="multipart/form-data">
           </input>
           <button>Create It!</button>
       </form>
   )
}


function Cookbook() {
    return <h2>This is a cookbook!</h2>
}