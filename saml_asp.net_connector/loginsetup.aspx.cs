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


namespace miniOrange
{
    public partial class loginsetup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (Request.IsAuthenticated)
            {
                if(urlid.InnerText == "" || urlid.InnerText == null)
                {
                    urlid.InnerText = ConfigurationManager.AppSettings["user_url"];
                    ecryptionkey.InnerText = ConfigurationManager.AppSettings["encrypt_key"];
                    
                    
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
          
        }

  

        protected void save(object sender, EventArgs e){
           
            if (Request.IsAuthenticated)
            {
                Configuration config = WebConfigurationManager.OpenWebConfiguration("~");
                config.AppSettings.Settings["user_url"].Value = urlid.InnerText.Trim();
                config.AppSettings.Settings["encrypt_key"].Value = ecryptionkey.InnerText.Trim();
                config.Save();

                messageerror.InnerHtml = "<span runat='server' style='font-size:15px;margin-left:40px;' class='alert alert-success' >Your Configuration has been Saved.</span>";
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