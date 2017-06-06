using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Configuration;
using System.Net.Configuration;


namespace miniOrange
{
    public partial class logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            Session.Remove("UserId");
            Session.RemoveAll();
            //This would signout the user and remove the authentication cookie, so the user is taken back to the login page directly
            FormsAuthentication.SignOut();
            Response.Redirect("login_page.aspx".Trim());
        }
    }
}