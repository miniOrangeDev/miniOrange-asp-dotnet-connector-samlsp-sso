<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="setup.aspx.cs" Inherits="WebApplication1.setup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="Stylesheet" href="include/css/main.css" />
   
</head>
        <body class="app sidebar-mini rtl">
    <form id="form1" runat="server" defaultbutton="Button2">
        <!-- Navbar-->
        <header class="app-header"><a class="app-header__logo" href="#" style="margin-top:10px;"><img src="image/logo-home.png" /></a>
        <!-- Sidebar toggle button --><a class="app-sidebar__toggle" href="#" data-toggle="sidebar" aria-label="Hide Sidebar"></a>
            <div class="drpdwn" style="margin-left:73%;margin-top:13px">
  <button class="dropbtn"><i class="fa fa-user fa-lg"><span style="margin-left:10px;"><% if (Session["UserId"] != null) { Response.Write(Session["UserId"]); } else { Response.Redirect("login_page.aspx"); } %></span></i></button>
  <div class="drpdwn-content">
    <a href="login_page.aspx"> Logout</a>
  </div>
</div>

        <!--<ul class="app-nav">
          <li class="drpdwn"><a class="app-nav__item" href="#" data-toggle="dropdown" ><i class="fa fa-user fa-lg"><span style="margin-left:10px;"></span></i></a>
            <ul  class="dropdown-menu settings-menu dropdown-menu-right" style="transform:translate3d(0px,50px,0px);left:24%;">
          <li><a class="dropdown-item" href="login_page.aspx"><i class="fa fa-sign-out fa-lg"></i> Logout</a></li>
        </ul>
        </li>
    </ul>-->
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
        <li><a class="app-menu__item active" href="setup.aspx"><i class="app-menu__icon fa fa-circle-o"></i><span class="app-menu__label">Plugin Settings</span></a></li>
          <li><a class="app-menu__item" href="loginsetup.aspx"><i class="app-menu__icon fa fa-circle-o"></i><span class="app-menu__label">Login Setup</span></a></li>
        <li><a class="app-menu__item" href="how_to_setup.aspx"><i class="app-menu__icon fa fa-circle-o"></i><span class="app-menu__label">How to Setup?</span></a></li>
                  </ul>
    </aside>

    <main class="app-content">
        <div class="app-title">
          <div>
            <h1><i class="fa fa-circle-o"></i> Plugin Settings</h1>
            
          </div>
          <ul class="app-breadcrumb breadcrumb">
            <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
            <li class="breadcrumb-item"><a href="#">Plugin Settings</a></li>
          </ul>
        </div>

        <div class="row">
            <div class="col-md-12">
              <div class="tile">
                <div class="row">
                  <div class="col-lg-6">
                    <form id="saml_form">
                      <h4>Identity Provider Settings</h4>
                      <br />
                      <div class="form-group">
               <div style="background-color: #ddffdd;margin-bottom:1%; width:95%;text-align:center;border-left: 6px solid #4CAF50;"><asp:Label Style=" color:#2a9020;font-size:17px;" ID="Message" runat="server" ></asp:Label></div><br />
                        <label id="idp_entity_id"><b>IDP Entity ID</b></label>
                             <textarea required="required"  id="idpentity" placeholder="Identity Provider Entity Id or Issuer" runat="server" style="display:block;font-family: 'Times New Roman', Times, serif; width: 555px; height: 35px;" class="form-control"></textarea>
                      </div>
                      <div class="form-group">
                        <label for="saml_login_url"><b>Singal Sigon URL</b></label> <textarea runat="server" required="required" style="font-family:'Times New Roman', Times, serif; width: 555px; height: 35px;" placeholder="Singl Sign On Service URL of your IdP" id="sso_url" class="form-control"></textarea>
                
                      </div>

                      <label><b>SAML Login Binding type</b></label>
                      <table>
                        <tr>
                          <td style="padding:10px;">
                      <div class="animated-radio-button">
                        <label>
                          <input checked="checked" type="radio" name="login_binding_type" id="http_redirect_binding" value="HttpRedirect" /><span class="label-text">Http-Redirect</span>    
                        </label>
                      </div>
                      </td>
                      <td style="padding:10px;">
                      <fieldset disabled="">
                      <div class="animated-radio-button">
                        <label>
                        <input type="radio" name="login_binding_type" id="http_post_binding" value="HttpPost" /><span class="label-text">Http-Post</span>
                        </label>
                        <small style="color:#FF0000">Not available in TRIAL version</small>
                      </div>
                      </fieldset>
                      </td>
                      </tr>
                    </table>

                      
                      <fieldset disabled="">
                      <div class="form-group">
                        <label for="x509_certificate"><b>SAML x509 Certificate</b></label>
               <textarea runat="server"  style="font-family:'Times New Roman', Times, serif; width: 555px; height: 207px;" placeholder="Copy and Paste content of downloaded X.509certificate" id="idpcertificate" class="form-control"></textarea>
                        <small style="color:#FF0000">Not available in TRIAL version</small>
                      </div>
                      </fieldset>
                      
                      
                      <fieldset disabled="">
                      <div class="animated-checkbox">
                        <label>
                          <input type="checkbox" id="sign_response" name="sign_response" /><span class="label-text">Signed Response</span>
                        </label>&nbsp
                        <small style="color:#FF0000">Not available in TRIAL version</small>
                      </div>
                      </fieldset>

                      <fieldset disabled="">
                      <div class="animated-checkbox">
                        <label>
                          <input type="checkbox" id="sign_assertion" name="sign_assertion" /><span class="label-text">Signed Assertion</span>
                        </label>&nbsp
                        <small style="color:#FF0000">Not available in TRIAL version</small>
                      </div>
                      </fieldset>


                    </form>  
                      <asp:Button ID="Button2" style=" font-family:'Times New Roman', Times, serif;" runat="server" Text="Save Configuration"  OnClick="IDP"  Class="btn btn-primary"  />
                      <asp:Button ID="Button3" style="margin:40px; font-family:'Times New Roman', Times, serif;" runat="server" Text="Test Configuration"  OnClick="TestConfig" Class="btn btn-primary"  />
                
                  </div>
                  <div class="col-lg-4 offset-lg-1">
                    <h4>Service Provider Settings</h4>
                    <br />
                    <br />
                    <div class="form-group">
                        <fieldset disabled="">
                      <label for="sp_entity_id"><b>SP Entity ID:   </b></label>
                        <textarea runat="server"  style="font-family:'Times New Roman', Times, serif; width: 355px; height: 35px;" id="sp_id" class="form-control"></textarea>                
                      </fieldset>
                            </div>
                    <div class="form-group">
                        <fieldset disabled="">
                      <label for="acs_url"><b>ACS URL:    </b></label>   
                       <textarea runat="server"  style="font-family:'Times New Roman', Times, serif; width: 355px; height: 35px;" id="acs_id" class="form-control"></textarea>    
                      </fieldset>
                    </div>

                    <br /><br />
                    <h4>Attribute Mapping</h4>
                    <br>
                    <fieldset>
                    <div class="form-group">
                        <div style="width:93%;text-align:center;font-size:17px;color:#2a9020;background-color: #ddffdd;border-left: 6px solid #4CAF50;">
                    <asp:Label style="" ID="Label1" runat="server" ></asp:Label></div><br />
                      <label for="saml_am_email"><b>NameID</b></label>
                        <textarea runat="server"  style="font-family:'Times New Roman', Times, serif; width: 355px; height: 35px;" placeholder="NameID" id="Name_ID" class="form-control"></textarea>                
                    </div>
                    </fieldset>

                    <fieldset>
                    <div class="form-group">
                      <label for="saml_am_username"><b>Email</b></label>
                        <textarea runat="server"  style="font-family:'Times New Roman', Times, serif; width: 355px; height: 35px;" placeholder="email" id="email" cols="20" class="form-control"></textarea>         
                    </div>
                    </fieldset>
                      <fieldset>
                    <div class="form-group">
                      <label for="saml_am_username"><b>Firstname</b></label>
                    <textarea runat="server"  style="font-family:'Times New Roman', Times, serif; width: 355px; height: 35px;" placeholder="firstname" id="firstname" class="form-control"></textarea>
      </div>
                    </fieldset>
                        <fieldset>
                    <div class="form-group">
                      <label for="saml_am_username"><b>Lastname</b></label>
                <textarea runat="server"  style="font-family:'Times New Roman', Times, serif; width: 355px; height: 35px;" placeholder="lastname" id="lastname" name="S1" class="form-control"></textarea>
      </div>
                    </fieldset>
                      <asp:Button ID="sub" class="btn btn-primary" style="font-family:'Times New Roman', Times, serif;" runat="server" Text="Save Configuration" OnClick="Attr"/>
            


                  </div>
                  </div>
                <div class="tile-footer">
                    </div>
              </div>
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
