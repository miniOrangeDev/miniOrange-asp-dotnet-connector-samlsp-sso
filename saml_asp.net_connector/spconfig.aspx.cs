using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Net.Configuration;
using System.Web.Configuration;
using System.Web.Security;

namespace miniOrange
{
    public partial class spconfig : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request.IsAuthenticated)
            {
                if (sp_id.InnerText == null || sp_id.InnerText == "")
                {
                    sp_id.InnerText = BaseUrl().Trim();
                    acs.InnerText = BaseUrl() + "ACS.aspx".Trim();
                }
            }
            else
            {

                FormsAuthentication.RedirectToLoginPage();
            }


        }
        public void SP_Click(Object sender, EventArgs args)
        {

            Configuration config = WebConfigurationManager.OpenWebConfiguration("~");
            config.AppSettings.Settings["sp_entityid"].Value = sp_id.InnerText;
            config.AppSettings.Settings["sp_acsurl"].Value = acs.InnerText;

            config.Save();

            messageerror.InnerHtml = "<span runat='server' style='font-size:15px;margin-left: 40px;' class='alert alert-success' >Identity Provider Details Saved Successfully</span>";

        }
        public void Next_Step(Object sender, EventArgs args)
        {

            if (Request.IsAuthenticated)
            {
                Response.Redirect("idpconfig.aspx");
            }
            else
            {

                FormsAuthentication.RedirectToLoginPage();
            }

        }




        public string BaseUrl()
        {
            // variables  
            string Authority = Request.Url.GetLeftPart(UriPartial.Authority).TrimStart('/').TrimEnd('/');
            string ApplicationPath = Request.ApplicationPath.TrimStart('/').TrimEnd('/');

            // add trailing slashes if necessary  
            if (Authority.Length > 0)
            {
                Authority += "/";
            }

            if (ApplicationPath.Length > 0)
            {
                ApplicationPath += "/";
            }

            // return  
            return string.Format("{0}{1}", Authority, ApplicationPath);
        }
    }
}