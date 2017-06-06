using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;


namespace miniOrange
{
    public partial class instruction : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
           
           
            if (Request.IsAuthenticated)
            {

            }
            else
            {
                //If the session value for userid is not set, redirect the user to the loginpage
                //see the ReturnUrl querystring value, it will be the page, that the ASP.NEt
                //infrastructure will redirect to after successful validation of the user
                //See the <Authentication node in web.config
                FormsAuthentication.RedirectToLoginPage(); 
            }
        }
    }
}