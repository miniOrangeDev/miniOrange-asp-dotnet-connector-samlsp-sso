﻿using System;
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
using System.Web.Configuration;
using WebApplication1;
namespace Saml
{
    /*public class Certificate
    {
        public X509Certificate2 cert;

        public void LoadCertificate(string certificate) => LoadCertificate(StringToByteArray(certificate));

        public void LoadCertificate(byte[] certificate)
        {
            cert = new X509Certificate2();
            cert.Import(certificate);
        }

        private byte[] StringToByteArray(string st)
        {
            byte[] bytes = new byte[st.Length];
            for (int i = 0; i < st.Length; i++)
            {
                bytes[i] = (byte)st[i];
            }
            return bytes;
        }
    }
    */
    public class Saml_Response
    {
        public string saved_id = "";
        public string ent_id;
        private XmlDocument _xmlDoc;
        //private Certificate _certificate;
        private XmlNamespaceManager _xmlNameSpaceManager;
        private String response_error;
        public string Xml { get { return _xmlDoc.OuterXml; } }

        public Saml_Response(string certificateStr, string idp_sso_target_url, bool test)
        {
            /*try
            {
                _certificate = new Certificate();
                _certificate.LoadCertificate(certificateStr);
            }
            catch (CryptographicException cs)
            {
                throw new WebApplication1.InvalidDataException(Constants.INVALID_CERTIFICATE);
            }*/
        }

        public void LoadXml(string xml)
        {
            _xmlDoc = new XmlDocument();
            _xmlDoc.PreserveWhitespace = true;
            _xmlDoc.XmlResolver = null;
            _xmlDoc.LoadXml(xml);
            _xmlNameSpaceManager = GetNamespaceManager();

        }

        public void LoadXmlFromBase64(string response)
        {
            //System.Diagnostics.Debug.WriteLine("response=" + response);
            System.Text.UTF8Encoding enc = new System.Text.UTF8Encoding();
            if (response != null)
                LoadXml(enc.GetString(Convert.FromBase64String(response)));
        }

        public string Getresponse_error()
        {
            return this.response_error;
        }


        public bool IsValid()
        {
            XmlNodeList nodeList = _xmlDoc.SelectNodes("//ds:Signature", _xmlNameSpaceManager);
            SignedXml signedXml = new SignedXml(_xmlDoc);
            XmlNode issuer = _xmlDoc.SelectSingleNode("samlp:Response/saml:Issuer", _xmlNameSpaceManager);
            /*
            XmlNode authState = _xmlDoc.SelectSingleNode("samlp:Response/saml:Assertion/saml:AuthnStatement", _xmlNameSpaceManager);
            string sid = authState.Attributes["SessionIndex"].Value;
            Configuration config = WebConfigurationManager.OpenWebConfiguration("~");
            config.AppSettings.Settings["session_id"].Value = sid;
            config.Save();*/
            /* foreach(XmlNode node in nodeList) 
             {
                 try
                 {
                     XmlNodeList CatNodesList = _xmlDoc.SelectNodes("//saml:AttributeStatement", _xmlNameSpaceManager);
                     foreach (XmlNode CatNode  in CatNodesList)
                     {
                         if (node.SelectSingleNode("") != null)
                         {
                             categoryName = EncodeIt(Article.SelectSingleNode("Category").Value);
                             Response.Write(categoryName);
                             Response.Write("<br />");
                         }
                     }
                 }
             }
             */
            if (this.IsExpired())
            {
                throw new WebApplication1.InvalidDataException(Constants.TIMESTAMP_EXPIRE);
            }

            ent_id = issuer.InnerText;
            System.Diagnostics.Debug.WriteLine("issuer_valid=" + ent_id);
            string saved_id = ConfigurationManager.AppSettings["idp_entityid"];
            if (ent_id != saved_id)
            {
                throw new WebApplication1.InvalidDataException(Constants.INVALID_ISSUER);
            }
            if (nodeList.Count == 0)
            {
                throw new WebApplication1.InvalidDataException(Constants.SIGNED_RESPONSE);
            }

            signedXml.LoadXml((XmlElement)nodeList[0]);

            /*if (!signedXml.CheckSignature(_certificate.cert, true))
            {
                throw new WebApplication1.InvalidDataException(Constants.INVALID_SIGNATURE);
            }*/
            return true;
        }
        public string GetAttributes()
        {
            if (!(_xmlDoc == null))
            {
                XmlNode name = _xmlDoc.SelectSingleNode("samlp:Response/saml:Assertion/saml:Subject/saml:NameID", _xmlNameSpaceManager);
                String Namevalue = name.InnerText;
                //String Att = _xmlDoc.GetElementsByTagName().ToString();


                try
                {

                    XmlNodeList AssertionList = _xmlDoc.SelectNodes("samlp:Response/saml:Assertion", _xmlNameSpaceManager);


                    foreach (XmlNode Assertion in AssertionList)
                    {
                        try
                        {
                            XmlNodeList AttriNodesList = Assertion.SelectNodes("saml:AttributeStatement/saml:Attribute", _xmlNameSpaceManager);

                            String VariablesValue = "";
                            foreach (XmlNode Attribute in AttriNodesList)
                            {
                                //Console.Write("inside 2nd foreach");

                                if (Attribute.SelectSingleNode("saml:AttributeValue", _xmlNameSpaceManager) != null)
                                {
                                    //Console.Write("inside AttributeName");
                                    String AttributeValue = Attribute.SelectSingleNode("saml:AttributeValue", _xmlNameSpaceManager).InnerText;
                                    VariablesValue += "<tr><td style='font - weight:bold; border: 2px solid #949090;padding:2%; text-align:center;'>" + Attribute.Attributes["Name"].Value + " </td><td style='font - weight:bold; border: 2px solid #949090;padding:2%; text-align:center;'> " + AttributeValue + " " + "</td></tr>";

                                }


                            }
                            return VariablesValue + " ";


                        }
                        catch (Exception ex)
                        {
                            return ex.ToString();
                        }




                    }

                }

                catch (Exception ex)
                {
                    return ex.ToString();
                }

            }
            return null;

        }

        private XmlNamespaceManager GetNamespaceManager()
        {
            XmlNamespaceManager manager = new XmlNamespaceManager(_xmlDoc.NameTable);
            manager.AddNamespace("ds", SignedXml.XmlDsigNamespaceUrl);
            manager.AddNamespace("saml", "urn:oasis:names:tc:SAML:2.0:assertion");
            manager.AddNamespace("samlp", "urn:oasis:names:tc:SAML:2.0:protocol");

            return manager;
        }




        public string getAttr(String attrName)
        {
            XmlNode node = _xmlDoc.SelectSingleNode("/samlp:Response/saml:Assertion/saml:AttributeStatement/saml:Attribute[@Name='" + attrName + "']/saml:AttributeValue", _xmlNameSpaceManager);
            if (node == null)
            {
                return "";
            }
            return node.InnerText;
        }


        public string GetNameID()
        {
            XmlNode node = _xmlDoc.SelectSingleNode("/samlp:Response/saml:Assertion/saml:Subject/saml:NameID", _xmlNameSpaceManager);
            if (node == null)
            {
                return "";
            }

            return node.InnerText;
        }
        /*
                public string GetFirstName()
                {
                    XmlNode node = _xmlDoc.SelectSingleNode("/samlp:Response/saml:Assertion/saml:AttributeStatement/saml:Attribute[@Name='first_name']/saml:AttributeValue", _xmlNameSpaceManager);
                    return node.InnerText;
                }

                public string GetLastName()
                {
                    XmlNode node = _xmlDoc.SelectSingleNode("/samlp:Response/saml:Assertion/saml:AttributeStatement/saml:Attribute[@Name='last_name']/saml:AttributeValue", _xmlNameSpaceManager);
                    return node.InnerText;
                }
               */
        private bool IsExpired()
        {

            DateTime expirationDate = DateTime.MaxValue;
            XmlNode node = _xmlDoc.SelectSingleNode("/samlp:Response/saml:Assertion/saml:Subject/saml:SubjectConfirmation/saml:SubjectConfirmationData", _xmlNameSpaceManager);
            if (node != null && node.Attributes["NotOnOrAfter"] != null)
            {
                DateTime.TryParse(node.Attributes["NotOnOrAfter"].Value, out expirationDate);
            }
            return DateTime.UtcNow > expirationDate.ToUniversalTime();
        }

        /*
        public class XmlNode{

            public String GetNameID;
            public String GetFirstName;
        } 
           /* XmlNamespaceManager manager = new XmlNamespaceManager(_xmlDoc.NameTable);
            manager.AddNamespace("ds", SignedXml.XmlDsigNamespaceUrl);
            manager.AddNamespace("saml", "urn:oasis:names:tc:SAML:2.0:assertion");
            manager.AddNamespace("samlp", "urn:oasis:names:tc:SAML:2.0:protocol");
        public String GetValue(){

            XmlNode node = new XmlNode();
            node.GetNameID = _xmlDoc.SelectSingleNode("/samlp:Response/saml:Assertion/saml:Subject/saml:NameID", _xmlNameSpaceManager).InnerText;
            node.GetFirstName = _xmlDoc.SelectSingleNode("/samlp:Response/saml:Assertion/saml:AttributeStatement/saml:Attribute[@Name='first_name']/saml:AttributeValue", _xmlNameSpaceManager).InnerText;

            return node.ToString();

            //node2= _xmlDoc.SelectSingleNode("/samlp:Response/saml:Assertion/saml:AttributeStatement/saml:Attribute[@Name='email_id']/saml:AttributeValue", _xmlNameSpaceManager);

            //node = _xmlDoc.SelectSingleNode("/samlp:Response/saml:Assertion/saml:AttributeStatement/saml:Attribute[@Name='last_name']/saml:AttributeValue", _xmlNameSpaceManager);
        }*/

        //returns namespace manager, we need one b/c MS says so... Otherwise XPath doesnt work in an XML doc with namespaces
        //see https://stackoverflow.com/questions/7178111/why-is-xmlnamespacemanager-necessary

        public IEnumerable<XmlNode> AsseriontList { get; set; }
    }



    public class AuthRequest
    {
        public string _id;
        private string _issue_instant;

        private string _issuer;
        private string _assertionConsumerServiceUrl;

        public enum AuthRequestFormat
        {
            Base64 = 1
        }

        public AuthRequest(string issuer, string assertionConsumerServiceUrl)
        {
            _id = "_" + System.Guid.NewGuid().ToString();
            _issue_instant = DateTime.UtcNow.ToString("s") + "Z";

            _issuer = issuer;
            _assertionConsumerServiceUrl = assertionConsumerServiceUrl;
        }

        public string GetRequest(AuthRequestFormat format)
        {
            using (StringWriter sw = new StringWriter())
            {
                XmlWriterSettings xws = new XmlWriterSettings();
                xws.OmitXmlDeclaration = true;

                using (XmlWriter xw = XmlWriter.Create(sw, xws))
                {
                    xw.WriteStartElement("samlp", "AuthnRequest", "urn:oasis:names:tc:SAML:2.0:protocol");

                    //_id = "_87bdfb98d95249a696f3f040fc4d9990";
                    xw.WriteAttributeString("ID", _id);

                    xw.WriteAttributeString("Version", "2.0");
                    xw.WriteAttributeString("IssueInstant", _issue_instant);
                    xw.WriteAttributeString("ProtocolBinding", "urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST");
                    xw.WriteAttributeString("AssertionConsumerServiceURL", _assertionConsumerServiceUrl);
                    xw.WriteStartElement("saml", "Issuer", "urn:oasis:names:tc:SAML:2.0:assertion");
                    xw.WriteString(_issuer);
                    xw.WriteEndElement();

                    /*xw.WriteStartElement("samlp", "NameIDPolicy","");
                    xw.WriteAttributeString("AllowCreate", "true"); 
                    xw.WriteAttributeString("Format", "urn:oasis:names:tc:SAML:1.1:nameid-format:unspecified");
                    xw.WriteEndElement();*/

                    /*xw.WriteStartElement("samlp", "RequestedAuthnContext", "urn:oasis:names:tc:SAML:2.0:protocol");
                    xw.WriteAttributeString("Comparison", "exact");
                    xw.WriteStartElement("saml", "AuthnContextClassRef", "urn:oasis:names:tc:SAML:2.0:assertion");
                    xw.WriteString("urn:oasis:names:tc:SAML:2.0:ac:classes:PasswordProtectedTransport");
                    xw.WriteEndElement();
                    xw.WriteEndElement();*/

                    xw.WriteEndElement();
                }
                //System.Diagnostics.Debug.WriteLine("sw=" + sw);
                if (format == AuthRequestFormat.Base64)
                {
                    //byte[] toEncodeAsBytes = System.Text.ASCIIEncoding.ASCII.GetBytes(sw.ToString());
                    //return System.Convert.ToBase64String(toEncodeAsBytes);

                    //https://stackoverflow.com/questions/25120025/acs75005-the-request-is-not-a-valid-saml2-protocol-message-is-showing-always%3C/a%3E
                    var memoryStream = new MemoryStream();
                    var writer = new StreamWriter(new DeflateStream(memoryStream, CompressionMode.Compress, true), new UTF8Encoding(false));
                    writer.Write(sw.ToString());
                    writer.Close();
                    string result = Convert.ToBase64String(memoryStream.GetBuffer(), 0, (int)memoryStream.Length, Base64FormattingOptions.None);
                    return result;
                }

                return null;
            }
        }

        //returns the URL you should redirect your users to (i.e. your SAML-provider login URL with the Base64-ed request in the querystring
        public string GetRedirectUrl(string samlEndpoint, string relayState)
        {
            var queryStringSeparator = samlEndpoint.Contains("?") ? "&" : "?";
            var Separator = samlEndpoint.Contains("/") ? "" : "/";

            return samlEndpoint + queryStringSeparator + "SAMLRequest=" + HttpUtility.UrlEncode(this.GetRequest(AuthRequest.AuthRequestFormat.Base64)) + "&RelayState=" + relayState + Separator;
        }


    }
}

