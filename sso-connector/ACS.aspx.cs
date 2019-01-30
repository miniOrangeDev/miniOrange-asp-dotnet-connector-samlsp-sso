using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Net.Configuration;
using System.Web.Configuration;
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
using System.Threading;


namespace WebApplication1
{
    public partial class ACS : System.Web.UI.Page
    {
        public String response_error;
        public String test_result;
        private string samlCertificate = ConfigurationManager.AppSettings["idp_certificate"];
        Constants cst = new Constants();
        string idp_sso_target_url = ConfigurationManager.AppSettings["idp_ssourl"];
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Form["SAMLResponse"]!=null)
            {

                    if (Request.Form["RelayState"] == "testvalidate")
                    {
                        testconfiguration();
                    }

                    else
                    {
                        try
                        {
                            Saml.Saml_Response samlResponse = new Saml_Response(samlCertificate, idp_sso_target_url,false);
                            samlResponse.LoadXmlFromBase64(Request.Form["SAMLResponse"]); //SAML providers usually POST the data here
                            
                            if (samlResponse.IsValid())
                            {
                                string username, email, firstname, lastname;
                                username = samlResponse.GetNameID();
                                firstname = samlResponse.getAttr(ConfigurationManager.AppSettings["first_name"]);
                                lastname = samlResponse.getAttr(ConfigurationManager.AppSettings["last_name"]);
                            try
                            {
                                if (ConfigurationManager.AppSettings["email_id"] == "NameID")
                                {
                                    email = samlResponse.GetNameID();
                                }
                                else
                                {
                                    email = samlResponse.getAttr(ConfigurationManager.AppSettings["email_id"]);
                                }

                                sendpost(username, email, firstname, lastname);
                            }
                            catch (ThreadAbortException texc)
                            {
                                //handle the exception if you want
                            }
                        }
                        }
                        catch (InvalidDataException ex)
                        {
                            string URLAuth = ConfigurationManager.AppSettings["user_url"].Trim();
                            HttpContext.Current.Response.Redirect(URLAuth + "?error=" + ex.Message);
                        }
                }
                
            }
            else
            {
                FormsAuthentication.RedirectToLoginPage();
            }
            
          // Response.Write("Request:" + Request.Form["SAMLResponse"]);
        }

        protected void Test_Done(object sender, EventArgs e)
        {
            Response.Redirect("setup.aspx");
        }

        private void testconfiguration()
        {
                string ent_id = "";
                Saml.Saml_Response samlResponse = null;
                if (Request.Form["SAMLResponse"] != null)
                {
                    try
                    {
                        samlResponse = new Saml_Response(samlCertificate, idp_sso_target_url,true);
                        samlResponse.LoadXmlFromBase64(Request.Form["SAMLResponse"]);//SAML providers usually POST the data here
                        if (samlResponse.IsValid())
                        {
                            //string username, email, firstname, lastname, emailid, name_attr, email_attr, first_attr, last_attr,show;
                            Label2.Text = "NameID ";
                            Label3.Text = samlResponse.GetNameID();
                            Label1.Text = samlResponse.GetAttributes();
                            this.test_result = "SUCCESSFUL";
                        }
                    }
                    catch (InvalidDataException ex)
                    {
                        
                        this.test_result = "FAILED";
                        string err= cst.RetError(ex.Message);
                        if (ex.Message == "invalid+issuer_id")
                        {
                            err += samlResponse.ent_id;
                        }
                        this.response_error = err;
                    }
                }

        }


        private void sendpost(string pname,string pemail,string pfirst, string plast )
        {
            try
            {
                HttpContext.Current.Session["user"] = pemail;   
                string userid = encrypt(pname).Trim();
                string useremail = encrypt(pemail).Trim();
                string userfirstname = encrypt(pfirst).Trim();
                string userlastname = encrypt(plast).Trim();
			
			
                string URLAuth = ConfigurationManager.AppSettings["user_url"].Trim(); 
          //string postString = string.Format("inputusername={0}&inputemail={1}&inputfirstname={2}&inputlastname={3}", userid , useremail,userfirstname ,userlastname );
                Response.Clear();

            /*HttpContext.Current.Session["username"] = pname;
            HttpContext.Current.Session["email"] = pemail;
            HttpContext.Current.Session["firstname"] = pfirst;
            HttpContext.Current.Session["lastname"] = plast;
            Response.Redirect(URLAuth);
             */
            //HttpContext.Current.Response.Redirect(URLAuth);

           
                StringBuilder sb = new StringBuilder();
                sb.Append("<html>");
                sb.AppendFormat(@"<body onload='document.forms[""form""].submit()'>");
                sb.AppendFormat("<form name='form' action='{0}' method='post'>", URLAuth);
                sb.AppendFormat("<input type='hidden' name='username' value='{0}'>", userid);
                sb.AppendFormat("<input type='hidden' name='email' value='{0}'>", useremail);
                sb.AppendFormat("<input type='hidden' name='firstname' value='{0}'>", userfirstname);
                sb.AppendFormat("<input type='hidden' name='lastname' value='{0}'>", userlastname);
                // Other params go here
                sb.Append("</form>");
                sb.Append("</body>");
                sb.Append("</html>");
                Response.Write(sb.ToString());
                Response.End();
            }
            catch (ThreadAbortException ex)
            {
               // System.Diagnostics.Debug.WriteLine("msg="+ex.Message);
            }
            
        }


        private string encrypt(string data)
        {
            string encryptionKey = ConfigurationManager.AppSettings["encrypt_key"].Trim();
            encryptionKey = encryptionKey.Substring(0, 24);

            byte[] resultArray;
            byte[] inputArray;
            inputArray = UTF8Encoding.UTF8.GetBytes(data);
            TripleDESCryptoServiceProvider tdes = new TripleDESCryptoServiceProvider();
            tdes.Key = UTF8Encoding.UTF8.GetBytes(encryptionKey);
            tdes.Mode = CipherMode.ECB;
            tdes.Padding = PaddingMode.PKCS7;
            ICryptoTransform itrans = tdes.CreateEncryptor();
            resultArray = itrans.TransformFinalBlock(inputArray, 0, inputArray.Length);
            tdes.Clear();
            return Convert.ToBase64String(resultArray, 0, resultArray.Length);
        }

    
   
    }
}