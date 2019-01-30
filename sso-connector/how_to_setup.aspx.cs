using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Web.Configuration;

namespace WebApplication1
{
    public partial class how_to_setup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string baseurl = ConfigurationManager.AppSettings["sp_entityid"];
            anurl.Text = baseurl + "request.aspx";
        }
    }
}