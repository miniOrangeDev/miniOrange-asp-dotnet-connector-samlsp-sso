using System;
using System.IO;
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
using System.Web.Configuration;
using Saml;

namespace WebApplication1
{
    public partial class request : System.Web.UI.Page
    {
        public string Decrypt(string cipherText)
        {
            string EncryptionKey = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
            cipherText = cipherText.Replace(" ", "+");
            byte[] cipherBytes = Convert.FromBase64String(cipherText);
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] {  
            0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76  
        });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateDecryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(cipherBytes, 0, cipherBytes.Length);
                        cs.Close();
                    }
                    cipherText = Encoding.Unicode.GetString(ms.ToArray());
                }
            }
            return cipherText;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            DateTime dt1970 = new DateTime(1970, 1, 1);
		    DateTime current = DateTime.UtcNow; //DateTime.Now;//DateTime.UtcNow for unix timestamp
		    TimeSpan span = current - dt1970;
		    long timestampinlong = (long)span.TotalMilliseconds;
            //String expiry_tmestamp = Decrypt(ConfigurationManager.AppSettings["issue"]);
            //if (Convert.ToInt64(expiry_tmestamp) > timestampinlong)
            //{
                var samlEndpoint = ConfigurationManager.AppSettings["idp_ssourl"].TrimStart().TrimEnd();
                // Response.Write("IDP_sso" + samlEndpoint);
                var request = new AuthRequest(
                    ConfigurationManager.AppSettings["sp_entityid"].TrimStart().TrimEnd(),       //put your app's "unique ID" here
                    ConfigurationManager.AppSettings["sp_acsurl"].TrimStart().TrimEnd() //assertion Consumer Url - the URL where provider will redirect authenticated users after authenticating them
                    );

            var relay = "";
            if (Request.QueryString["relayState"] != null)
                {
                    relay = Request.QueryString["relaystate"].ToString();

                }
            string url= request.GetRedirectUrl(samlEndpoint, relay);
                Response.Redirect(url);
            
                //then redirect your user to the above "url" var
                //for example, like this:
            //}
            //else
            //{
             //   Response.Write("Expired");
           // }
        }

   }
        
}