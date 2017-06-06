using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Net.Configuration;
using Saml;
using System.IO;
using System.Xml;
using System.Security.Cryptography.X509Certificates;
using System.Security.Cryptography.Xml;
using System.IO.Compression;
using System.Text;
using System.Security.Cryptography;
using System.Net;
using System.Net.Http;
using System.Web.Security;


namespace miniOrange
{
    public partial class ACS : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Form["SAMLResponse"] != null)
            {
                string samlCertificate = ConfigurationManager.AppSettings["idp_certificate"];
                string idp_sso_target_url = ConfigurationManager.AppSettings["idp_ssourl"];
                Saml.Saml_Response samlResponse = new Saml_Response(samlCertificate, idp_sso_target_url);
                samlResponse.LoadXmlFromBase64(Request.Form["SAMLResponse"]); //SAML providers usually POST the data here
                if (samlResponse.IsValid())
                {
                    if (Request.Form["RelayState"] == "testvalidate")
                    {
                        testconfiguration(samlResponse);
                    }

                    else
                    {



                        string username;
                        if (ConfigurationManager.AppSettings["name_id"].Equals("NameID"))
                        {
                            username = samlResponse.GetNameID();
                        }
                        else
                        {
                            username = samlResponse.getAttr(ConfigurationManager.AppSettings["name_id"]);
                        }

                        //Function to create post request for passing user credential
                        sendpost(username);
                    }

                } else {
                    
                    //insert error handling code
                    Response.Write("Failed");
                }
            }
            else
            {
                FormsAuthentication.RedirectToLoginPage();

            }
        }

        protected void Test_Done(object sender, EventArgs e)
        {

            Response.Redirect("attributemapping.aspx");
        }

        private void testconfiguration(Saml.Saml_Response samlResponse)
        {
                    attri.InnerText = "NameID";
                    val.InnerText = samlResponse.GetNameID();
                    Label1.Text = samlResponse.GetAttributes();
    
        }

        //Post Fuction to create hidden form for credentials.
        private void sendpost(string pname)
        {

            string userid = Encrypt(pname).Trim();
            string URLAuth = ConfigurationManager.AppSettings["user_url"].Trim();
            Response.Clear();

            StringBuilder sb = new StringBuilder();
            sb.Append("<html>");
            sb.AppendFormat(@"<body onload='document.forms[""form""].submit()'>");
            sb.AppendFormat("<form name='form' action='{0}' method='post'>", URLAuth);
            sb.AppendFormat("<input type='hidden' name='name' value='{0}'>", userid);
            // Other params go here
            sb.Append("</form>");
            sb.Append("</body>");
            sb.Append("</html>");

            Response.Write(sb.ToString());

            Response.End();

        }

        //Encrypt Function
        private string Encrypt(string cleartext)
        {
            string EncryptionKey = ConfigurationManager.AppSettings["encrypt_key"].Trim();
            byte[] clearBytes = Encoding.UTF8.GetBytes(cleartext);


            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(clearBytes, 0, clearBytes.Length);

                        cs.Close();

                    }
                    cleartext = Convert.ToBase64String(ms.ToArray());


                }
            }
            return cleartext.Trim();

        }

    }
}