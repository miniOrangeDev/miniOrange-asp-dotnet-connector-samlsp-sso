using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Net.Configuration;
using System.Web.Configuration;
using System.Web.Security;
using Saml;
namespace WebApplication1
{
    public partial class setup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Response.Write(Session["UserId"].ToString());

            if (Request.IsAuthenticated)
            {
                
                if (sp_id.InnerText == null || sp_id.InnerText == "")
                {
                    sp_id.InnerText = BaseUrl().Trim(); //ConfigurationManager.AppSettings["sp_entityid"];
                    acs_id.InnerText = BaseUrl() + "ACS.aspx".Trim();
                    //SPEntityLabel.Text= BaseUrl().Trim();
                    Configuration config = System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration("~");
                    config.AppSettings.Settings["sp_entityid"].Value = sp_id.InnerText;
                    config.AppSettings.Settings["sp_acsurl"].Value = acs_id.InnerText;
                    config.Save();

                }
            }
            else
            {
                //If the session value for userid is not set, redirect the user to the loginpage
                //see the ReturnUrl querystring value, it will be the page, that the ASP.NEt
                //infrastructure will redirect to after successful validation of the user
                //See the <Authentication node in web.config
                FormsAuthentication.RedirectToLoginPage();
            }
            if (Request.IsAuthenticated)
            {
                DisplayData();
            }
            else
            {
                //If the session value for userid is not set, redirect the user to the loginpage
                //see the ReturnUrl querystring value, it will be the page, that the ASP.NEt
                //infrastructure will redirect to after successful validation of the user
                //See the <Authentication node in web.config
                FormsAuthentication.RedirectToLoginPage();
            }
            if (Request.IsAuthenticated)
            {
                DisplayAtt();
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

        protected void DisplayData()
        {

            // Response.Write("id : " + sender +" e" + e);
            //  if (idp_entity.Text == null || idp_entity.Text == "")
            if (idpentity.InnerText == null || idpentity.InnerText == "")
            {

                idpentity.InnerText = ConfigurationManager.AppSettings["idp_entityid"];
                sso_url.InnerText = ConfigurationManager.AppSettings["idp_ssourl"];
                //_certificate.InnerText = HttpUtility.HtmlDecode(ConfigurationManager.AppSettings["Name"]);
                idpcertificate.InnerText = ConfigurationManager.AppSettings["idp_certificate"];

                //idp_entityname.Text = ConfigurationManager.AppSettings["idp_entityname"];
                /*idp_entity.Text = ConfigurationManager.AppSettings["idp_entityid"];
                ssourl.Text = ConfigurationManager.AppSettings["idp_ssourl"];
                //_certificate.InnerText = HttpUtility.HtmlDecode(ConfigurationManager.AppSettings["Name"]);
                idp_certificate.Text = ConfigurationManager.AppSettings["idp_certificate"];
                NameID.Text = ConfigurationManager.AppSettings["name_id"];
                email_id.Text = ConfigurationManager.AppSettings["email_id"];
                first_name.Text = ConfigurationManager.AppSettings["first_name"];
                last_name.Text = ConfigurationManager.AppSettings["last_name"];*/


            }
        }

        public void IDP(Object sender, EventArgs args)
        {
            //string s = Page.Request.Form["_certificate"];

            // Response.Write("id : " + sender);
            //perform validation for the username and password

            Configuration config = WebConfigurationManager.OpenWebConfiguration("~");
            // config.AppSettings.Settings["idp_entityname"].Value = idp_entityname.Text.TrimStart().TrimEnd();
            config.AppSettings.Settings["idp_entityid"].Value = idpentity.InnerText.TrimStart().TrimEnd();
            config.AppSettings.Settings["idp_ssourl"].Value = sso_url.InnerText.TrimStart().TrimEnd();
            config.AppSettings.Settings["idp_certificate"].Value = idpcertificate.InnerText.TrimStart().TrimEnd();
            //config.AppSettings.Settings["_certificate"].Value = s.TrimStart().TrimEnd();



            config.Save();

            String x = "Configuration has been saved successfully,<br>Please wait, It will take a minute for loading configuration files.";
            Message.Text = x;
            DisplayData();
            //Call FormsAuthentication.RedirectFromLoginPage, which would set a cookie for validation
            //and depending on the ReturnUrl value in the URL redirect user back to that page(here default.aspx)
            //Response.Write(idpEntityId.Text);
            //FormsAuthentication.RedirectFromLoginPage(txtEmailId.Text, true);
            //Response.Redirect("SAMLLogin.aspx");
            //idp_entity.Text = ConfigurationManager.AppSettings["idp_entityid"];
            //ssourl.Text = ConfigurationManager.AppSettings["idp_ssourl"];
            //idp_certificate.Text = ConfigurationManager.AppSettings["idp_certificate"];
        }
        public void TestConfig(Object sender, EventArgs args)
        {
            
            if (Request.IsAuthenticated)
            {
                Response.Redirect("request.aspx?relayState=testvalidate");
                Message.Text = " ";

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
        public void Attr(Object sender, EventArgs args)
        {
            if (Session["UserId"] != null)
            {
                Configuration config = WebConfigurationManager.OpenWebConfiguration("~");
                // config.AppSettings.Settings["idp_entityname"].Value = idp_entityname.Text.TrimStart().TrimEnd();
                //config.AppSettings.Settings["_certificate"].Value = s.TrimStart().TrimEnd();
                config.AppSettings.Settings["name_id"].Value = Name_ID.InnerText.TrimStart().TrimEnd();
                config.AppSettings.Settings["email_id"].Value = email.InnerText.TrimStart().TrimEnd();
                config.AppSettings.Settings["first_name"].Value = firstname.InnerText.TrimStart().TrimEnd();
                config.AppSettings.Settings["last_name"].Value = lastname.InnerText.TrimStart().TrimEnd();


                config.Save();
               // System.Diagnostics.Debug.WriteLine("config=" + config.AppSettings.Settings["name_id"].Value);
                String x = "Configuration &nbsp has &nbsp been &nbsp saved &nbsp successfully";
                Label1.Text = x;
                DisplayAtt();

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
        protected void DisplayAtt()
        {
            if (Name_ID.InnerText == null || Name_ID.InnerText == "")
            {
                Name_ID.InnerText = ConfigurationManager.AppSettings["name_id"];
                email.InnerText = ConfigurationManager.AppSettings["email_id"];
                firstname.InnerText = ConfigurationManager.AppSettings["first_name"];
                lastname.InnerText = ConfigurationManager.AppSettings["last_name"];
            }

        }
        public string BaseUrl()
        {
            // variables  
            string Authority = Request.Url.GetLeftPart(UriPartial.Authority).TrimStart('/').TrimEnd('/');
            string ApplicationPath = Request.ApplicationPath.TrimStart('/').TrimEnd('/');

            // add trailing slashes if necessary  
            if (Authority.Length > 0)
            {
                Authority += "/";
            }

            if (ApplicationPath.Length > 0)
            {
                ApplicationPath += "/";
            }

            // return  
            return string.Format("{0}{1}", Authority, ApplicationPath);
        }
    }
}