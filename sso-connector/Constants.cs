using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
namespace WebApplication1
{
    public class Constants
    {
        public static string INVALID_CERTIFICATE = "invalid+certificate";
        public static string INVALID_ISSUER = "invalid+issuer_id";
        public static string INVALID_SIGNATURE = "invalid+signature";
        public static string TIMESTAMP_EXPIRE = "SAML+Response+Expired";
        public static string SIGNED_RESPONSE = "Signed+Response+Required";
        public string RetError(string msg)
        {
            if (msg == "invalid+certificate")
                return "<span style='color:red;'>Error :</span> Invalid Certificate</td></tr>" +
                        "<tr><td><span style='font-weight:bold;font-size:17px;padding:20px'>Description :</span> Certificate configured in the connector is in wrong format";
            else if (msg == "invalid+issuer_id")
                return "<span style='color:red;'>Error :</span> Invalid Issuer</td></tr><tr><td><span style='font-weight:bold;font-size:20px;padding:20px'>Saved Issuer :</span>" + ConfigurationManager.AppSettings["idp_entityid"] + "<tr><td><span style='font-weight:bold;font-size:20px;padding:20px'>Expected Issuer :</span>";
            else if (msg == "invalid+signature")
                return "<span style='color:red;'>Error :</span> Invalid Signature</td></tr>" + "<tr><td><span style='font-weight:bold;font-size:20px;padding:20px'>Description :</span><br>Signature is in wrong format";
            else
                return "<span style='color:red;'>Error :</span> Unknown Error</td></tr>" +
                        "<tr><td><span style='font-weight:bold;font-size:20px;'>Description :</span><br>";


        }
    }
}