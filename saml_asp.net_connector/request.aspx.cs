using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Security.Cryptography;
using System.Security.Cryptography.X509Certificates;
using System.Security.Cryptography.Xml;
using System.IO.Compression;
using System.Text;
using System.Configuration;
using System.Net.Configuration;
using Saml;

namespace miniOrange
{
    public partial class request : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            var samlEndpoint = ConfigurationManager.AppSettings["idp_ssourl"].TrimStart().TrimEnd();

            var request = new AuthRequest(
                ConfigurationManager.AppSettings["sp_entityid"].TrimStart().TrimEnd(),//put your app's "unique ID" here
                ConfigurationManager.AppSettings["sp_acsurl"].TrimStart().TrimEnd() //assertion Consumer Url - the URL where provider will redirect authenticated users after authenticating them
                );

            var relay = "";
            if (Request.QueryString["relayState"] != null)
            {
                relay = Request.QueryString["relaystate"].ToString();

            }
            string url = request.GetRedirectUrl(samlEndpoint, relay);
            Response.Redirect(url);
            //then redirect your user to the above "url" var

        }
    }
}