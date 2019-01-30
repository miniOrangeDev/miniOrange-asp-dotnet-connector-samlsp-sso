using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Xml;
using System.Security.Cryptography.X509Certificates;
using System.Security.Cryptography.Xml;
using System.IO.Compression;
using System.Text;
using System.Security.Cryptography;
using System.Configuration;
using System.Net.Configuration;
using System.Web.Configuration;
using System.Web.Security;


namespace WebApplication1
{
    public partial class loginsetup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           // Response.Write(Session["UserId"].ToString());
            if (Request.IsAuthenticated)
            {
                if (urlid.Text == "" || urlid.Text == null)
                {
                    urlid.Text = ConfigurationManager.AppSettings["user_url"];
                    ecryptionkey.Text = ConfigurationManager.AppSettings["encrypt_key"];
                    
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
          //labelencrypt.Text = this.Encrypt(urlid.InnerText.Trim());
        }

       /* protected void Login_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (this.login_type.SelectedValue == "1")
            {
                url_login.Visible = true;
                form_authentication.Visible = false;
                
            }

            else if (this.login_type.SelectedValue == "2")
            {

                url_login.Visible = false;
                form_authentication.Visible = true;
            }

        }*/

        protected void save(object sender, EventArgs e){
            //Response.Write(Session["UserId"].ToString());
            //System.Diagnostics.Debug.WriteLine("req=" + Request.IsAuthenticated);
            if (Request.IsAuthenticated)
            {
                Configuration config = WebConfigurationManager.OpenWebConfiguration("~");
                config.AppSettings.Settings["user_url"].Value = urlid.Text;
                config.AppSettings.Settings["encrypt_key"].Value = ecryptionkey.Text;
                config.Save();
               // System.Diagnostics.Debug.WriteLine("urlid.Text=" + urlid.Text);
                //System.Diagnostics.Debug.WriteLine("enc.Text=" + ecryptionkey.Text);
                String x = "Configuration has been saved Successfully ";
                labelencrypt.Text = x;
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