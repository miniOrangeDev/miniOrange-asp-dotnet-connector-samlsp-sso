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
    public partial class idpconfig : System.Web.UI.Page
    {
        protected void DisplayData()
        {

            if (idpentity.InnerText == null || idpentity.InnerText == "")
            {

                idpentity.InnerText = ConfigurationManager.AppSettings["idp_entityid"];
                sso_url.InnerText = ConfigurationManager.AppSettings["idp_ssourl"];
                idpcertificate.InnerText = ConfigurationManager.AppSettings["idp_certificate"];

            }
        }


        public void IDP(Object sender, EventArgs args)
        {
            Configuration config = WebConfigurationManager.OpenWebConfiguration("~");

            config.AppSettings.Settings["idp_entityid"].Value = idpentity.InnerText.TrimStart().TrimEnd();
            config.AppSettings.Settings["idp_ssourl"].Value = sso_url.InnerText.TrimStart().TrimEnd();
            config.AppSettings.Settings["idp_certificate"].Value = idpcertificate.InnerText.TrimStart().TrimEnd();

            config.Save();
            messageerror.InnerHtml = "<span runat='server' style='font-size:15px;margin-left: 40px;' class='alert alert-success' >Service Provider Details Saved Successfully</span>";
            DisplayData();

        }
        public void TestConfig(Object sender, EventArgs args)
        {

            if (Request.IsAuthenticated)
            {
                Response.Redirect("request.aspx?relayState=testvalidate");
                messageerror.InnerText = "Test Successful";

            }
            else
            {
                FormsAuthentication.RedirectToLoginPage();
            }

        }

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request.IsAuthenticated)
            {
                DisplayData();
            }
            else
            {
                FormsAuthentication.RedirectToLoginPage();
            }
        }

    }
}