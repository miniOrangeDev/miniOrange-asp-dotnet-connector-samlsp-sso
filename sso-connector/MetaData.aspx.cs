using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WebApplication1
{
    public partial class MetaData : System.Web.UI.Page
    {
    
        protected void ViewXML(object sender, EventArgs e)
        {
            Response.Clear();
            Response.Buffer = true;
            Response.Charset = "";
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = "application/xml";
            Response.WriteFile(Server.MapPath("~/saml.xml"));
            Response.Flush();
            Response.End();
        }
    }
}