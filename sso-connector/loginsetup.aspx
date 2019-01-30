<%@ Page Language="C#" AutoEventWireup="true"  CodeBehind="loginsetup.aspx.cs" Inherits="WebApplication1.loginsetup" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
  
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="Stylesheet" href="include/css/main.css" />
   <style>
.dropbtn {
  background-color: #fefdfd;
  color: white;
  padding: 10px;
  font-size: 16px;
  border: none;
  color:dimgrey;
  min-width:150px;
}

.drpdwnwn {
  position: relative;
  display: inline-block;

}

.drpdwn-content {
  display: none;
  position: absolute;
  background-color: #f1f1f1;
  min-width: 150px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
  text-align:center;
}

.drpdwn-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.drpdwn-content a:hover {background-color: #ddd;color:white;}

.drpdwn:hover .drpdwn-content {display: block;}

.drpdwn:hover .dropbtn {background-color: #3e8e41;color:white;}
</style>
</head>
        <body class="app sidebar-mini rtl">
    <form id="form1" runat="server" defaultbutton="Save">
        <!-- Navbar-->
        <header class="app-header"><a class="app-header__logo" href="#" style="margin-top:11px;"><img src="image/logo-home.png" /></a>
        <!-- Sidebar toggle button --><a class="app-sidebar__toggle" href="#" data-toggle="sidebar" aria-label="Hide Sidebar"></a>
         <div class="drpdwn" style="margin-left:73%;margin-top:13px">
  <button class="dropbtn"><i class="fa fa-user fa-lg"><span style="margin-left:10px;"><% if (Session["UserId"] != null) { Response.Write(Session["UserId"]); } else { Response.Redirect("login_page.aspx"); } %></span></i></button>
  <div class="drpdwn-content">
    <a href="login_page.aspx"> Logout</a>
  </div>
</div>
        </header>
        <!-- Sidebar menu-->
    <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
    
    <aside class="app-sidebar">
      <div class="app-sidebar__user" style="padding-left:40px"><img src="image/miniorange.png"  style="width:37.25px; height:50px;" alt="User Image" />
        <div style="margin-left:15px;">
          <p class="app-sidebar__user-name">ASP.NET SAML</p>
          <p class="app-sidebar__user-designation">Connector</p>
        </div>
      </div>
      <ul class="app-menu">
        <li><a class="app-menu__item" href="setup.aspx"><i class="app-menu__icon fa fa-circle-o"></i><span class="app-menu__label">Plugin Settings</span></a></li>
          <li><a class="app-menu__item active" href="loginsetup.aspx"><i class="app-menu__icon fa fa-circle-o"></i><span class="app-menu__label">Login Setup</span></a></li>
        <li><a class="app-menu__item" href="how_to_setup.aspx"><i class="app-menu__icon fa fa-circle-o"></i><span class="app-menu__label">How to Setup?</span></a></li>
                  </ul>
    </aside>
        
    <main class="app-content" style="height:70%;">
    <div class="app-title">
          <div>
            <h1><i class="fa fa-circle-o"></i> Login Setup</h1>
            
          </div>
          <ul class="app-breadcrumb breadcrumb">
            <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
            <li class="breadcrumb-item"><a href="#">Login Setup</a></li>
          </ul>
        
        </div>
    <div runat="server">

         <div  class="tile" style="height:90%;">
             <table style="width:50%; margin-left:2%;margin-top:3%">
                <tr><td colspan="2">
              <div style=" background-color: #ddffdd; border-left: 6px solid #4CAF50;text-align:center;" ><asp:Label style="color:#2a9020;font-size:18px;" ID="labelencrypt" runat="server" ></asp:Label></div></td></tr>
                        
                        <tr style="">
                        <td colspan="2" style="text-align:left;" ><asp:label ID="weburl" runat="server"  style="font-size:18px;"><strong>Endpoint URL</strong></asp:label></td></tr>
                        <tr><td style="font-size:12px;padding:2px;">(Provide your Endpoint URL in Login Setup where you will read your SAML response.)</td></tr>
                        <tr><td colspan="2"><asp:TextBox id="urlid"  runat="server" placeholder="Please enter endpoint Url you created" style=" color:black;" class="form-control"></asp:TextBox></td>
                        </tr>
                        <tr><td><label /></td>
                        <tr style="margin-top:2%;">
                        <td colspan="2" style="text-align:left"><asp:label ID="keylabel" runat="server"  style="font-size:18px;"><strong>Encryption Key</strong></asp:label></td></tr>
                        </tr>
                        <tr><td style="font-size:12px;padding:2px;">(Add 24-character Encryption Key which will be used to encrypt response.)</td></tr>
                        <tr><td colspan="2"><asp:TextBox id="ecryptionkey" runat="server" placeholder="Encryption Key" style=" color:black; " class="form-control" ></asp:TextBox></td></tr>
                        <tr> <td colspan="2"><asp:Button ID="Save" class="btn btn-primary" Style="margin-top:3%;font-size:large;" runat="server" Text="Save" OnClick="save" Width="141px" Height="50px" /></td>
                        </tr>
                        </table>
                      </div>
        </div>
        </main>
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="include/js/jquery-3.2.1.min.js"></script>
    <script src="include/js/popper.min.js"></script>
    <script src="include/js/bootstrap.min.js"></script>
    <script src="include/js/main.js"></script>
    <!-- The javascript plugin to display page loading on top-->
    <script src="include/js/plugins/pace.min.js"></script>  
        </form>
</body>
</html>