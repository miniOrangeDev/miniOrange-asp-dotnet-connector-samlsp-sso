<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login_page.aspx.cs" Inherits="WebApplication1.login_page" %>
<%@ Import Namespace="System.Security.Cryptography"%>
<%@ Import Namespace="System.IO"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
   <head runat="server">
      <script language="C#" runat="server">
         public void Page_Load(Object sender, EventArgs e)
         {
         Configuration config = System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration("~");
         if ( !String.IsNullOrEmpty(config.AppSettings.Settings["uname_id"].Value) && !String.IsNullOrEmpty(config.AppSettings.Settings["password"].Value))
         FormsAuthentication.RedirectFromLoginPage(txtUserId.Text, true);
         }
         public string encrypt(string encryptString)   
         {  
             string EncryptionKey = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";  
             byte[] clearBytes = Encoding.Unicode.GetBytes(encryptString);  
             using(Aes encryptor = Aes.Create())   
             {  
                 Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] {  
                     0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76  
                 });  
                 encryptor.Key = pdb.GetBytes(32);  
                 encryptor.IV = pdb.GetBytes(16);  
                 using(MemoryStream ms = new MemoryStream())  
                 {  
                     using(CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write)) {  
                         cs.Write(clearBytes, 0, clearBytes.Length);  
                         cs.Close();  
                         }  
                 encryptString = Convert.ToBase64String(ms.ToArray());  
                 }  
             }  
             return encryptString;  
          }  
         
         public string HashPassword(string password)
         {
         byte[] salt;
         byte[] buffer2;
         if (password == null)
         {
         throw new ArgumentNullException("password");
         }
         using (Rfc2898DeriveBytes bytes = new Rfc2898DeriveBytes(password, 0x10, 0x3e8))
         {
         salt = bytes.Salt;
         buffer2 = bytes.GetBytes(0x20);
         }
         byte[] dst = new byte[0x31];
         System.Buffer.BlockCopy(salt, 0, dst, 1, 0x10);
         System.Buffer.BlockCopy(buffer2, 0, dst, 0x11, 0x20);
         return Convert.ToBase64String(dst);
         }
         
         public void btnValidate_Click(Object sender, EventArgs args)
         {
         if(String.Compare(txtPassword1.Text,txtPassword2.Text)==0)
         {
         Configuration config = System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration("~");
         config.AppSettings.Settings["uname_id"].Value = txtUserId.Text;
         config.AppSettings.Settings["password"].Value = HashPassword(txtPassword1.Text);
                 DateTime dt1970 = new DateTime(1970, 1, 1);
           DateTime current = DateTime.UtcNow; //DateTime.Now;//DateTime.UtcNow for unix timestamp
           TimeSpan span = current - dt1970;
           long timestampinlong = (long)span.TotalMilliseconds;
         String expiry_timestamp = ""+(timestampinlong+(1000l * 60 * 60 * 24 * 30));
                 config.AppSettings.Settings["issue"].Value=encrypt(expiry_timestamp);
         config.Save();
         Session["UserId"] = txtUserId.Text;
         Response.Redirect("setup.aspx");
         }
         else{
         errormsg.Text="Passwords Do Not Match";
         }
             
         }
         
      </script>
       <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="include/css/main.css" />
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
    <title>Register - miniOrange Admin</title>   
  </head>
  <body>
      
      <form  runat="server">
    <section class="material-half-bg">
      <div class="cover"></div>
    </section>
    <section class="login-content">
      <div class="logo">
      </div>
      <div class="col-md-6">
          <div class="tile">
            <h3 class="tile-title">Register</h3>
            <form class="register_form" id="register_form">
            <div class="tile-body">
              
                     <asp:Label ID="errormsg" Style="color:red;margin-left:27%;margin-bottom:2%;" runat="server"></asp:Label><br />
                <div class="form-group row">
                  <label class="control-label col-md-3">Username</label>
                  <div class="col-md-8">
                        <asp:TextBox ID="txtUserId"  class="form-control"   runat="server" placeholder="Enter Username" required="" />
                    </div>
                </div>
                <div class="form-group row">
                <label class="control-label col-md-3">Password</label>
                <div class="col-md-8">
                    <asp:TextBox ID="txtPassword1" class="form-control"  TextMode="Password" style="float:left;" runat="server" placeholder="Enter a password" required="" />
                 
                </div>
                </div>
                <div class="form-group row">
                <label class="control-label col-md-3">Confirm Password</label>
                <div class="col-md-8">
                  <asp:TextBox ID="txtPassword2"  class="form-control" TextMode="Password"  runat="server"  placeholder="Re-type the password" required="" />
                  </div>
                </div>
                
            </div>
            <div class="tile-footer">
              <div class="row">
                <div class="col-md-8 col-md-offset-3">
                    <asp:Button runat="server" class="btn btn-primary" OnClick="btnValidate_Click" ID="btnValidate"  Text="Sign Up" />
                </div>
              </div>
            </div>
            </form>
          </div>
        </div>

    </section>
    <!-- Essential javascripts for application to work-->
    <script src="includes/js/jquery-3.2.1.min.js"></script>
    <script src="includes/js/popper.min.js"></script>
    <script src="includes/js/bootstrap.min.js"></script>
    <script src="includes/js/main.js"></script>
    <!-- The javascript plugin to display page loading on top-->
    <script src="includes/js/plugins/pace.min.js"></script>
          </form>
  </body>
</html>
