<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login_page.aspx.cs" Inherits="WebApplication1.login_page" %>
<%@ Import Namespace="System.Security.Cryptography"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
   <head runat="server">
      <title></title>
      <script language="C#" runat="server">
         public void Page_Load(Object sender, EventArgs e)
         {
             
         }
         public void btnValidate_Click(Object sender, EventArgs args)
         {
             //perform validation for the username and password
             if (ValidateUser(txtUserId.Text, txtPassword.Text))
             {
                 Session["UserId"] = txtUserId.Text;
                 Response.Redirect("setup.aspx");
             }
             else
             {
                 String x = "Login failed. Please check your user name and password and try again.";
                 errormsg.Text = x;
         
             }
         }
         private bool ValidateUser(string userName, string password)
         {
         Configuration config = System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration("~");
             return (userName == config.AppSettings.Settings["uname_id"].Value && VerifyHashedPassword(config.AppSettings.Settings["password"].Value,password) );
         }
         public static bool VerifyHashedPassword(string hashedPassword, string password)
         {
         byte[] buffer4;
         if (hashedPassword == null)
         {
         return false;
         }
         if (password == null)
         {
         throw new ArgumentNullException("password");
         }
         byte[] src = Convert.FromBase64String(hashedPassword);
         if ((src.Length != 0x31) || (src[0] != 0))
         {
         return false;
         }
         byte[] dst = new byte[0x10];
         System.Buffer.BlockCopy(src, 1, dst, 0, 0x10);
         byte[] buffer3 = new byte[0x20];
         System.Buffer.BlockCopy(src, 0x11, buffer3, 0, 0x20);
         using (Rfc2898DeriveBytes bytes = new Rfc2898DeriveBytes(password, dst, 0x3e8))
         {
         buffer4 = bytes.GetBytes(0x20);
         }
         return buffer3.SequenceEqual(buffer4);
         }	
      </script>
      <link rel="stylesheet" href="include/css/main.css" />
   </head>
    <body>
  <section class="material-half-bg">
      <div class="cover"></div>
    </section>
      <form id="form1" runat="server" class="login-form">
    <section class="login-content">
      <div class="logo">
        <h1><img src="image/logo_large.png"></h1>
      </div>
      <div class="col-md-6">
          <div class="tile">
            <h3 class="tile-title">Login with miniOrange</h3>
            <form class="login_form" >
            <input type="hidden" name="option" value="login" />
            <div class="tile-body">
                     <asp:Label ID="errormsg" Style="color:red;" runat="server"></asp:Label>
              <div class="form-group row">
                  <label class="control-label col-md-3">Username</label>
                  <div class="col-md-8">
                        <asp:TextBox ID="txtUserId" class="form-control" placeholder="Enter Usename" style="float:left;" runat="server" required=""/>
                  </div>
                </div>
                <div class="form-group row">
                <label class="control-label col-md-3">Password</label>
                <div class="col-md-8">
                        <asp:TextBox ID="txtPassword" class="form-control"  TextMode="Password" placeholder="Enter Password" style="float:left;" runat="server" required=""/>
                </div>
                </div>
            </div>
            <div class="tile-footer">
              <div class="row">
                <div class="col-md-8 col-md-offset-3">
                       <asp:Button runat="server" class="btn btn-primary" OnClick="btnValidate_Click" ID="Button1" style="width:20%;" Text="Login"></asp:Button>
                </div>
              </div>
            </div>
            </form>
          </div>
        </div>
    </section>
    </form>
  </body>

   </html>