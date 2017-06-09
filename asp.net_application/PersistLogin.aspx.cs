using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Net.Configuration;
using System.IO;
using System.Xml;
using System.Security.Cryptography.X509Certificates;
using System.Security.Cryptography.Xml;
using System.IO.Compression;
using System.Text;
using System.Security.Cryptography;
using System.Net;
using System.Web.Security;


namespace MiniApplication
{

    public partial class PersistLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Form["name"] != null)
            {
                //
                //Here you will pass Parameters to decrypt and formauthentication code... 
                //

               /* String username = Decrypt(Request.Form["name"].Trim());
                FormsAuthentication.RedirectFromLoginPage(username,true); */


            }

        }

        //
        //Here Decrypt Code will be added...
        //

       /* private string Decrypt(string ciphertext)
         {
             string EncryptionKey = "qawsedrftgyhujik".Trim();

             byte[] cipherBytes = Convert.FromBase64String(ciphertext.Trim());

             using (Aes encryptor = Aes.Create())
             {
                 Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                 encryptor.Key = pdb.GetBytes(32);
                 encryptor.IV = pdb.GetBytes(16);
                 using (MemoryStream ms = new MemoryStream())
                 {
                     using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateDecryptor(), CryptoStreamMode.Write))
                     {
                         cs.Write(cipherBytes, 0, cipherBytes.Length);
                         cs.Close();

                     }

                     ciphertext = Encoding.UTF8.GetString(ms.ToArray());

                 }
             }

            
             return ciphertext.Trim();
         }
       */
    }
}