using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.Security;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Net.Configuration;
using System.Web.Configuration;

namespace miniOrange
{
    public partial class attributemapping : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.IsAuthenticated)
            {


            }
            else
            {
                FormsAuthentication.RedirectToLoginPage();
            }
        }

        protected void DisplayAtt()
        {
            if (Name_ID.InnerText == null || Name_ID.InnerText == "")
            {
                Name_ID.InnerText = ConfigurationManager.AppSettings["name_id"];
            }

        }

        public void Attr(Object sender, EventArgs args)
        {
            if (Request.IsAuthenticated)
            {
                Configuration config = WebConfigurationManager.OpenWebConfiguration("~");
                config.AppSettings.Settings["name_id"].Value = Name_ID.InnerText.TrimStart().TrimEnd();
                config.Save();
                messageerror.InnerHtml = "<span runat='server' style='font-size:15px;margin-left: 40px;' class='alert alert-success' >Your Configuration has been Saved.</span>";
                DisplayAtt();

            }
            else
            {
                FormsAuthentication.RedirectToLoginPage();
            }

        }
        public void Next_Step(Object sender, EventArgs args)
        {

            if (Request.IsAuthenticated)
            {
                Response.Redirect("loginsetup.aspx");
            }
            else
            {
                FormsAuthentication.RedirectToLoginPage();
            }

        }

    }
}