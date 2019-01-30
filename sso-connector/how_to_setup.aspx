<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="how_to_setup.aspx.cs" Inherits="WebApplication1.how_to_setup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="include/css/main.css" />
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
</head>

    <form id="form1" runat="server">
        <body class="app sidebar-mini rtl">
        <!-- Navbar-->
        <header class="app-header"><a class="app-header__logo" href="#" style="margin-top:10px;"><img src="image/logo-home.png"></a>
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
          <li><a class="app-menu__item" href="loginsetup.aspx"><i class="app-menu__icon fa fa-circle-o"></i><span class="app-menu__label">Login Setup</span></a></li>
        <li><a class="app-menu__item active" href="how_to_setup.aspx"><i class="app-menu__icon fa fa-circle-o"></i><span class="app-menu__label">How to Setup?</span></a></li> 
      </ul>
    </aside>
    <main class="app-content">
    <div class="app-title">
          <div>
            <h1><i class="fa fa-circle-o"></i> How to Setup?</h1>
            
          </div>
          <ul class="app-breadcrumb breadcrumb">
            <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
            <li class="breadcrumb-item"><a href="#">How to Setup?</a></li>
          </ul>
        </div>

        <div class="row">
            <div class="col-md-12">
              <div class="tile">
                <div class="row">
                  <div class="col-lg-10">
                    <h3>Follow these steps to setup the plugin:</h3>
                    <h4>Step 1:  <b>To Add Application in IIS Manager</b></h4><ul>
                    <li> Extract asp-net-saml-connector-xxx.zip and Copy sso_connector folder to path- C:\inetpub\wwwroot.</li>
                      <li>Open IIS manager.<br />In left panel right click <b>Default Web Site</b> and click <b>Add Application.</b></li></ul><br />
                    <img src="image/add_app.png" style="width:800px;height:380px;margin-left:50px; border:1px solid;" />
                      <br /><br />
                      <ul><br />
                          <li>
                      As given below provide Alias Name that is a webpage Address Name for example Alias Name.</li>
                         <li> Give Physical path where you have copied the Application:<br />
                          C:\inetpub\wwwroot\ sso-connector.<br /></li>
                      </ul>
                     <br /> <img src="image/alias.png" style="width:548px;height:400px;margin-left:50px; border:1px solid;" /><br /><br />
                    <h4>Step 2: <b>Steps to give authority to user to make changes in SAML Connector (web.config File).</b></h4>
                    <ul>
                      <li>Go to this path C:\inetpub\wwwroot\</li>
                      <li>Right click the sso-connector and select <b>Properties</b></li>
                      <li>Select the <b>Security tab</b> and click the <b> Edit button</b>.</li>
                        <li>Select <b>IIS_IUSRS</b> in under Group or Usernames option.</li>
                        <li>After following the steps given above, tick the box in the Permission for IIS_IUSRS container as shown in the figure below:</li>
                    </ul><br />
                    <img src="image/control.png" style="width:500px;height:200px;margin-left:50px; border:1px solid;" /><br /><br /><br />
                    <h4>Step 3: Open SAML ASP.NET Connector on Browser</h4><br />
                      <ul>
                            <li>Open any browser and go to the following link: http://localhost/</li>
                            <li>A signup page opens up..</li>
                            </ul>
                    <img src="image/signup.png" style="width:650px;height:400px;margin-left:50px; border:1px solid;" /><br /><br /><br />
                    <h4>Step 4: Configure your Identity Provider</h4>
                    <h5></h5><br/>
                        <ul>
                            <li>You need to provider these SP Entity ID and ACS URL values while configuring your Identity Provider.</li>
                            </ul>
                    <img src="image/sp_set.png" style="width:800px;height:400px;margin-left:50px; border:1px solid;" /><br /><br /><br />
                      <h4>Step 5: Configure your Service Provider</h4>
                        Using IDP information user could add details in Configure SP:<br />
                        <ul>
                            <li>Provide the required settings (i.e. IDP Entity ID, IDP Single Sign on URL, X.509 certificate) in the connector.</li>
                            <li>And click <b>Save Configuration</b> to Save your IDP details.</li>
                            <li>Then click on <b>Test Configuration</b> button.</li>
                            </ul>
                        
                    <img src="image/idp_set.png" style="width:800px;height:400px;margin-left:50px; border:1px solid;" /><br /><br />
                    <img src="image/savetest.png" style="width:800px;height:400px;margin-left:50px; border:1px solid;" /><br />
                <ul><br /><br />
                    <li>The below Screenshot shows a successful result.</li>
                    <li>This screenshot shows the attributes that are received and are mapped by attribute mapping (i.e. NameID, email, firstname, lastname).</li>
                    </ul><br />
                    <img src="image/setup_4.png" style="width:600px;height:400px;margin-left:50px; border:1px solid;" /><br /><br /><br />
                    <h4>Step 6:Attribute Mapping</h4>
                        <ul>
                            <li>Attribute Mapping is used by the IDP and the SP to map user information from IDP to SP.</li>
                            <li>Attribute Mapping helps you to get user attributes from your IdP and map them to your user attributes in SP.</li>
                            <li>Attributes received in successful test configuration are used for attribute mapping.</li>
                            <li>In Attribute Mapping details like NameID and Email as shown in Figure Test Successful are mapped to NameID and Email respectively like Attribute: NameID,&nbsp Email,&nbsp FirstName,&nbsp LastName.</li>  
                            </ul>
                    <img src="image/atrrbute.png" style="width:500px;height:400px;margin-left:50px; border:1px solid;" /><br /><br />                      
                    <h4>Step 7: Login Setup</h4><br />
                        <ul>
                            <li>Provide your Endpoint URL in Login Setup where you will read your SAML response.</li>
                            <li>Add 24-character Encryption Key which will be used to encrypt response and same key will be used to Decrypt the response in login ASP.Net application.</li>
                            <li>Click on Save button.</li><br /></ul>
                    <img src="image/logsetup.png" style="width:700px;height:420px;margin-left:50px; border:1px solid;" /><br /><br />

                             <h4>Step 8: Add following link in your application</h4>
                      <ul>
                          <li>Use the following html code in your application from where you want perform SSO:<br />
                              <code>&lt;a href="<asp:Label id="anurl" runat="server" />”&gt;Log in&lt;/a&gt;"</code>
                          </li>
                      </ul>
                             
                      <p></p>
                    </form>
                  </div>
                </div>
              </div>
            </div>
        </div>
    </main><script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="include/js/jquery-3.2.1.min.js"></script>
    <script src="include/js/popper.min.js"></script>
    <script src="include/js/bootstrap.min.js"></script>
    <script src="include/js/main.js"></script>
    <!-- The javascript plugin to display page loading on top-->
    <script src="include/js/plugins/pace.min.js"></script>
</body>
    </form>
</html>
