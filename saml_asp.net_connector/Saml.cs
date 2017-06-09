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


namespace Saml
{



    public class Certificate
    {
        public X509Certificate2 cert;

        public void LoadCertificate(string certificate)
        {
            LoadCertificate(StringToByteArray(certificate));
        }

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

    public class Saml_Response
    {
        private XmlDocument _xmlDoc;
        private Certificate _certificate;
        private XmlNamespaceManager _xmlNameSpaceManager;

        public string Xml { get { return _xmlDoc.OuterXml; } }

        public Saml_Response(string certificateStr, string idp_sso_target_url)
        {
            _certificate = new Certificate();
            _certificate.LoadCertificate(certificateStr);
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
            System.Text.UTF8Encoding enc = new System.Text.UTF8Encoding();
            if (response != null)
                LoadXml(enc.GetString(Convert.FromBase64String(response)));
        }

        public bool IsValid()
        {

            XmlNodeList nodeList = _xmlDoc.SelectNodes("//ds:Signature", _xmlNameSpaceManager);

            SignedXml signedXml = new SignedXml(_xmlDoc);

            if (nodeList.Count == 0) return false;

            signedXml.LoadXml((XmlElement)nodeList[0]);


            return signedXml.CheckSignature(_certificate.cert, true);
        }

        public string GetAttributes()
        {


            if (!(_xmlDoc == null))
            {
                XmlNode name = _xmlDoc.SelectSingleNode("samlp:Response/saml:Assertion/saml:Subject/saml:NameID", _xmlNameSpaceManager);
                String Namevalue = name.InnerText;


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


                                if (Attribute.SelectSingleNode("saml:AttributeValue", _xmlNameSpaceManager) != null)
                                {

                                    String AttributeValue = Attribute.SelectSingleNode("saml:AttributeValue", _xmlNameSpaceManager).InnerText;
                                    VariablesValue += "<tr><td style='font-weight:bold;border:2px solid #949090;padding:2%;'>" + Attribute.Attributes["Name"].Value + "</td>" + "<td style='padding:2%;border:2px solid #949090; word-wrap:break-word;'>" + AttributeValue + "</td></tr>";


                                }


                            }
                            return VariablesValue;


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
            _issue_instant = DateTime.Now.ToString("s") + "Z";

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

                    xw.WriteAttributeString("ID", _id);
                    xw.WriteAttributeString("Version", "2.0");
                    xw.WriteAttributeString("IssueInstant", _issue_instant);
                    xw.WriteAttributeString("ProtocolBinding", "urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST");
                    xw.WriteAttributeString("AssertionConsumerServiceURL", _assertionConsumerServiceUrl);
                    xw.WriteStartElement("saml", "Issuer", "urn:oasis:names:tc:SAML:2.0:assertion");
                    xw.WriteString(_issuer);
                    xw.WriteEndElement();
                    xw.WriteEndElement();
                }

                if (format == AuthRequestFormat.Base64)
                {
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

