<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login_page.aspx.cs" Inherits="miniOrange.login_page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="~/Content/bootstrap-3.3.6-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/login.css" rel="stylesheet" />
    <script language="C#" runat="server">

        public void Page_Load(Object sender, EventArgs e)
        {

        }
        public void btnValidate_Click(Object sender, EventArgs args)
        {
            //perform validation for the username and password
            if (ValidateUser(txtUsers.Text, txtPassword.Text))
            {
                //Call FormsAuthentication.RedirectFromLoginPage, which would set a cookie for validation
                //and depending on the ReturnUrl value in the URL redirect user back to that page(here default page=instruction.aspx)
                Session["UserId"] = txtUsers.Text;
                FormsAuthentication.RedirectFromLoginPage(txtUsers.Text, true);
            }
            else
            {
                actionMessages.InnerHtml = "<div class='alert alert-warning alert-dismissible walter-custom'><ul ><li><span runat='server' style='margin-left:50px;' id='error'>'Incorrect Email/Password'</span></li></ul>";



            }
        }
        private bool ValidateUser(string userName, string password)
        {
            //ideally this would be validating against a datastore like a database or something else
            //for demo purpose we have done some hard code validation
            //so it will erturn true is username and password = demo
            return (userName == "demo@gmail.com" && password == "demo");
        }
    </script>
    <style type="text/css">
  
    </style>
</head>
<body>
    <form id="form1" runat="server" action="login_page.aspx">
        <div class="header">
            <img style="margin-top: 10px;" src="images/logo.png" />
        </div>
        <div class="background_banner">
            <h1 class="text-center">Registration Login</h1>
            <div class="row row_custom">
                <div class="col-mid-offset-4">
                    <div class="login_box col-min-6" style="height: 26em; width: 400px;">
                        <div runat="server" id="actionMessages">
                        </div>
                        <div runat="server" id="logo" style="margin-left: 165px; width: 60px;">
                            <img src="images/usericon.png" />
                        </div>
                        <div class="login-group">
                            <div class="input-group text-padding col-md-offset-1">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <asp:TextBox ID="txtUsers" Class="form-control" runat="server" Placeholder="Enter your username here"></asp:TextBox>
                                <br />
                            </div>
                            <br />
                            <div class="input-group text-padding col-md-offset-1">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>

                                <asp:TextBox ID="txtPassword" Class="form-control" TextMode="Password" Placeholder="Enter your password here" runat="server" />

                                <br />
                            </div>
                            <br />
                            <div class="text-center">
                                <asp:Button runat="server" OnClick="btnValidate_Click" ID="btnValidate" Class="btn btn-warning btn-submit" Text="Submit" />
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <div class="footer">
            <p style="color: black;">
                © Copyright
		2017
		miniOrange Security Software Pvt. Ltd. All Rights Reserved.
            </p>
        </div>
    </form>


</body>
</html>
