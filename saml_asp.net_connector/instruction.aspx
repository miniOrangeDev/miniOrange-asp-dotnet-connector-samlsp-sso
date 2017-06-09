<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/_header.master" CodeBehind="instruction.aspx.cs" Inherits="miniOrange.instruction" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
   
    <div class="heading" style="margin-left:10px;font-size:25px;">INSTRUCTIONS TO SETUP SAML DOTNET CONNECTOR</div>
				<div class="panel panel-default panel-height">
					<div class="panel-heading heading_font">
						<h3>Introduction</h3>
					</div>    
    </div>
    <br/>
       <div>
          
           <p style="font-size:15px; margin:0px 10px 18px 25px;">
               SAML ASP.Net Connector is the way to go to make your application act as a full-fledged SAML 2.0 Service Provider.<br/> 
               It provides Single Sign-On between your IdP and ASP DOTNET application.<br/><br/>
               SAML completely eliminates all passwords and instead uses standard cryptography and digital signatures to <br/> pass a secure sign-in token from an identity provider such as: ADFS, onelogin, Google Apps, miniOrange etc. to ASP.Net application<br/>
          </p>
           <img src="images/samlaspconnectors.png" style="border:solid windowtext 1.0pt;margin-left:100px;height: 300px; width:490px" /><br /><br/><br/>
          <div class="panel panel-default panel-height">
					<div class="panel-heading heading_font">
						<h3>Advantage</h3>
					</div>    
              </div>
           <p style="font-size:15px; margin:18px;">
               •	Secure your application<br/>
               •	Reduce development costs<br/> 
               •	Reach greater and faster adoption<br/>  

           </p>

          
           <br/>
            <asp:Label ID="Label3" runat="server" Text="Follow Below Instruction To Setup the &lt;b&gt;&lt;u&gt;SAML ASP.NET CONNECTOR&lt;/u&gt;&lt;/b&gt; With Your SP and IdP:" Font-Size="20px"></asp:Label>
         <br/><br/>
          <div style="padding-left:50px">
            <p><strong style="font-size:22px;">Step 1:<span class="auto-style8"> Configure your Identity Provider</span></strong></p>
            <ul style="box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; font-family:Helvetica, Arial, sans-serif; font-size:15px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;  text-decoration-style: initial; text-decoration-color: initial;">
                <li style="box-sizing: border-box;list-style:none;padding: 0px 0px 10px 24px;"><strong>&gt;</strong>Copy this generated <strong>SP Entity ID</strong> to your IdP settings. Also you can edit this and add your own Custom Entity ID.</li>
                <li style="box-sizing: border-box; list-style: none; padding: 0px 0px 10px 24px;"><strong>&gt;</strong> Copy this<b> ACS URL</b> to your IdP Settings.</li>
                <li style="box-sizing: border-box; list-style: none; padding: 0px 0px 10px 24px;"><strong>&gt; </strong>Click <strong>Save Configuration</strong> button to save your configuration.</li>
                <li style="box-sizing: border-box; list-style: none; padding: 0px 0px 10px 24px;"><strong>&gt;</strong> After Saving the SP details in Configure IDP click on <strong>Next Config</strong> to Configure SP.</li>
            </ul>
            <div style="padding-left:60px;">
                <img src="images/configure_idp.JPG" style="border:solid windowtext 1.0pt;height: 320px; width: 600px" /></div>
              <p><br/>
                <strong style="font-size:22px;">Step 2:<span class="auto-style8"> Configure Your Service Provider</span></strong></p>
               
              <ul style="box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; font-family:Helvetica, Arial, sans-serif; font-size:15px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;text-decoration-style: initial; text-decoration-color: initial;">
                <li style="box-sizing: border-box;list-style:none;padding: 0px 0px 10px 24px;"><strong>Using IdP information user could add details in Configure SP.</strong></li>
                  <li style="box-sizing: border-box;list-style:none;padding: 0px 0px 10px 24px;"><strong>&gt;</strong> Provide the required settings (i.e.<strong> IdP Entity ID, IdP Single SignOn Url, X.509 certificate)</strong>in the Connector.</li>
                  <li style="box-sizing: border-box; list-style: none; padding: 0px 0px 10px 24px;"><strong>&gt;</strong> And<span class="Apple-converted-space"> click &nbsp;<strong>Save Configuration</strong>&nbsp;to Save your IdP details.</span></li>
                  <li style="box-sizing: border-box; list-style: none; padding: 0px 0px 10px 24px;"><strong>&gt;</strong> Than<span class="Apple-converted-space"> click <strong>Test Configuration</strong>&nbsp;button.</span></li>
              </ul>
               <div style="padding-left:60px;"><img src="images/configure_sp.JPG" style="border:solid windowtext 1.0pt;height: 420px; width: 600px" /><br />
              </div><br/>
              <ul style="box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; font-family:Helvetica, Arial, sans-serif; font-size:15px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;">
                  <li style="box-sizing: border-box; list-style: none; padding: 0px 0px 10px 24px;"><strong>&gt;</strong> The below screenshot shows the successful result.</li>
                  <li style="box-sizing: border-box; list-style: none; padding: 0px 0px 10px 24px;"><strong>&gt;</strong> This screenshot shows the attributes that are received and are mapped by attribute mapping (i.e. NameID, email, firstname, lastname).</li>

            
            </ul>
           <div style="padding-left:60px;"><img src="images/testsuccess.JPG" style="border:solid windowtext 1.0pt;height: 330px; width: 600px" /></div><br/>
<p>
            <strong style="font-size:22px;">Step 3:<span class="auto-style8"> Attribute Mapping</span></strong></p>
              <ul style="box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; font-family:Helvetica, Arial, sans-serif; font-size:15px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;  text-decoration-style: initial; text-decoration-color: initial;">
                  <li style="box-sizing: border-box; list-style: none; padding: 0px 0px 10px 24px;"><strong>&gt;</strong> Attribute Mapping is used by the Identity Provider(IdP) and the Service Provider(SP) to map user information from IdP to SP.</li>
                  <li style="box-sizing: border-box; list-style: none; padding: 0px 0px 10px 24px;"><strong>&gt;</strong> Attribute Mapping helps you to get user attributes from your IdP and map them to your user attributes.</li>
                  <li style="box-sizing: border-box; list-style: none; padding: 0px 0px 10px 24px;"><strong>&gt;</strong> Attributes received in successful Test configuration are used for Attribute Mapping.</li>
                  
                  <li style="box-sizing: border-box; list-style: none; padding: 0px 0px 10px 24px;"><strong>&gt;</strong> In Attribute Mapping details like<span class="Apple-converted-space">&nbsp;&nbsp;</span><b style="box-sizing: border-box; font-weight: bold;">NameID </b>and<span class="Apple-converted-space"><strong> Email</strong> </span>as shown in <span class="Apple-converted-space">Fig.&nbsp;</span><b style="box-sizing: border-box; font-weight: bold;">Test Successful</b><span class="Apple-converted-space">&nbsp;</span>are mapped to<span class="Apple-converted-space">&nbsp;<strong>NameID </strong>&nbsp;</span>and<span class="Apple-converted-space">&nbsp;</span><b style="box-sizing: border-box; font-weight: bold;">Email</b><span class="Apple-converted-space">&nbsp;</span>respectively <br/>(i.e. <strong>Atrribute:NameID,Email,FirstName,LastName</strong>).</li>
                
            </ul>
              <div style="padding-left:60px;"><img src="images/attribute_mapping.JPG" style="border:solid windowtext 1.0pt;height: 330px; width: 600px" /></div>
            
              <br/>
            
          <p>
            <strong style="font-size:22px;">Step 4:<span class="auto-style8"> Login Setup</span></strong></p>
            <ul style="box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; font-family:Helvetica, Arial, sans-serif; font-size:15px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;  text-decoration-style: initial; text-decoration-color: initial;">
                <li style="box-sizing: border-box;list-style:none;padding: 0px 0px 10px 24px;"><strong>&gt;</strong> Provide your <b>Endpoint URL</b> in Login Setup where you will read your response.</li>
                <li style="box-sizing: border-box; list-style: none; padding: 0px 0px 10px 24px;"><strong>&gt;</strong> Add 16 character <b>Encryption Key</b> which will be use to encrypt response and same key would be used to decrypt the response.</li>
                <li style="box-sizing: border-box; list-style: none; padding: 0px 0px 10px 24px;"><strong>&gt;</strong> Click <b>Save</b> button.</li>
            </ul>
            
            <div style="padding-left:60px;"><img src="images/Login_Setting.JPG" style="border:solid windowtext 1.0pt;height: 330px; width: 600px" /><br />
                <br />
              </div>
          
              <p>
              <strong style="font-size:22px;">Step 5:<span class="auto-style8"> </span>SSO Sign In Settings</strong></p>
              <ul class="disc">
                  <li class="MsoNormal"><span style="font-size:15px;font-family:Times New Roman serif">Add below code in <b>web.config</b> file of your <b>asp.net application</b>:</span></li>
              </ul>
              <div style="width:600px;background-color :white;border:solid windowtext 1.0pt;padding:1.0pt 4.0pt 1.0pt 4.0pt;margin-left:40.0pt;margin-right:0cm">
                  <p class="MsoNormal">
                      <span style="font-size: 8.0pt; font-family: Consolas; color: blue; background: white;">&lt;</span><span style="font-size: 8.0pt; font-family: Consolas;color: #A31515; background: white;">appSettings</span><span style="font-size: 8.0pt; font-family: Consolas;color: blue; background: white;">&gt;</span>
                 <br/>
                      <span style="font-size: 8.0pt; font-family: Consolas; color: blue; background: white;">&lt;</span><span style="font-size: 8.0pt; font-family: Consolas;color: #A31515; background: white;">add</span><span style="font-size: 8.0pt; font-family: Consolas;color: blue; background: white;"> </span><span style="font-size: 8.0pt; font-family: Consolas; color: red; background: white;">key</span><span style="font-size: 8.0pt; font-family: Consolas; color: blue; background: white; ">=</span><span style="font-size: 8.0pt; font-family: Consolas;  color: black; background: white;">&quot;</span><span style="font-size: 8.0pt; font-family: Consolas; color: blue; background: white; ">Key 
                      Name</span><span style="font-size: 8.0pt; font-family: Consolas;  color: black; background: white;">&quot;</span><span style="font-size: 8.0pt; font-family: Consolas;  color: blue; background: white;"> </span><span style="font-size: 8.0pt; font-family: Consolas; color: red; background: white; ">value</span><span style="font-size: 8.0pt; font-family: Consolas;  color: blue; background: white;">=</span><span style="font-size: 8.0pt; font-family: Consolas;  color: black; background: white; ">&quot;</span><span style="font-size: 8.0pt; font-family: Consolas; color: blue; background: white;">https://localhost/[Connector Alias Name]/request.aspx</span><span style="font-size: 8.0pt; font-family: Consolas; color: black; background: white;">&quot;</span><span style="font-size: 8.0pt; font-family: Consolas; color: blue; background: white;">/&gt;</span>
                  
                     <br/> <span style="font-size: 8.0pt; font-family: Consolas; color: blue; background: white;">&lt;</span><span style="font-size: 8.0pt; font-family: Consolas;color: #A31515; background: white;">add</span><span style="font-size: 8.0pt; font-family: Consolas;color: blue; background: white;"> </span><span style="font-size: 8.0pt; font-family: Consolas; color: red; background: white;">key</span><span style="font-size: 8.0pt; font-family: Consolas; color: blue; background: white; ">=<span style="font-size: 8.0pt; font-family: Consolas;  color: black; background: white; ">&quot;</span></span><span style="font-size: 8.0pt; font-family: Consolas; color: blue; background: white">ValidationSettings:UnobtrusiveValidationMode<span style="font-size: 8.0pt; font-family: Consolas;  color: black; background: white; ">&quot;</span></span><span style="font-size: 8.0pt; font-family: Consolas;  color: blue; background: white;"> </span><span style="font-size: 8.0pt; font-family: Consolas; color: red; background: white; ">value</span><span style="font-size: 8.0pt; font-family: Consolas;  color: blue; background: white;">=</span><span style="font-size: 8.0pt; font-family: Consolas;  color: blue; background: white; ">&quot;None&quot;</span><span style="font-size: 8.0pt; font-family: Consolas; color: blue; background: white;">/&gt;</span>
                
                      <br/><span style="font-size: 8.0pt; font-family: Consolas;  color: blue; background: white; ">&lt;/</span><span style="font-size: 8.0pt; font-family: Consolas;  color: #A31515; background: white; ">appSettings</span><span style="font-size: 8.0pt; font-family: Consolas; color: blue; background: white; ">&gt;</span><o:p></o:p></p>
              </div>
              <br/>
              <ul type="disc">
                  <li class="MsoNormal"><span style="font-size:15px;font-family:Times New Roman serif;">Add the SAML login link by adding code to your <span">&nbsp;</span><b>Login UI</b> part:<o:p></o:p></span></li>
              </ul>
              <div style="border: solid windowtext 1.0pt; padding: 1.0pt 4.0pt 1.0pt 4.0pt; background: white; margin-left: 40.0pt; width:600px ; margin-right: 0cm">
                  <p class="MsoNormal">
                      <span style="font-size:8.0pt;font-family:Times New Roman, serif;color:black;">&lt;a href=”</span><span style="font-size: 8.0pt; font-family: Consolas; color: black; background: yellow; ">&lt;%</span><span style="font-size: 8.0pt; font-family: Consolas; color: blue; background: white;">=</span><span style="font-size: 8.0pt; font-family: Consolas; color: #2B91AF; background: white;">ConfigurationManager</span><span style="font-size: 8.0pt; font-family: Consolas;color: black; background: white;">.AppSettings[</span><span style="font-size: 8.0pt; font-family: Consolas;color: #A31515; background: white;">&quot;key Name&quot;</span><span style="font-size: 8.0pt; font-family: Consolas;color: black; background: white; ">]</span><span style="font-size: 8.0pt; font-family: Consolas; color: black; background: yellow;"> 
                      %&gt;</span><span style="font-size:8.0pt;font-family:Times New Roman,serif;color:black;">”&gt;Login with IdP&lt;/a&gt;<o:p></o:p></span></p>
              </div><br/>
              <ul  type="disc">
                  <li class="MsoNormal"><span style="font-size:15px ;font-family:Times New Roman serif;">Also, add below code to <b>Decrypt</b> the attributes at your login side:<o:p></o:p></span></li>
              </ul>
              <div style="width:600px;background-color :white;border:solid windowtext 1.0pt;padding:1.0pt 4.0pt 1.0pt 4.0pt;margin-left:40.0pt;margin-right:0cm">
                  <p style="background-color:white;">
                      <span style="font-size: 8.0pt; font-family: Consolas; color: #2B91AF; background: white;">String</span><span style="font-size: 8.0pt; font-family: Consolas; color: black; background: white;"> username = Decrypt(Request.Form[</span><span style="font-size: 8.0pt; font-family: Consolas; color: #A31515; background: white;">&quot;name&quot;</span><span style="font-size: 8.0pt; font-family: Consolas;  color: black; background: white; ">].Trim()); </span><span style="font-size: 8.0pt; font-family: Consolas;color: #2B91AF; background: white; ">FormsAuthentication</span><span style="font-size: 8.0pt; font-family: Consolas;  color: black; background-color: white;">.RedirectFromLoginPage(username,</span><span style="font-size: 8.0pt; font-family: Consolas;  color: blue; background: white;">true</span><span style="font-size: 8.0pt; font-family: Consolas;color: black; background-color: white;">);</span></p>
              </div>
              <br/>
              <ul type="disc">
              <li class="MsoNormal"><span style="font-size:15px ;font-family:Times New Roman serif;">Add the SAML login link by adding code to your login logic part:&nbsp;</span><br />
              </li>
                  </ul>
              <p>
                  <code style="margin:0px 0px 0px 55px;font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial; padding: 2px 4px; font-family: monaco, menlo, consolas; font-size: 12px; color: rgb(221, 17, 68); border-radius: 3px;  border: 1px solid rgb(225, 225, 232); white-space: nowrap;">‹a href=&#39;<a style="color: rgb(17, 85, 204);">http://localhost/<wbr />[Your Site Name]/request.aspx</a>&#39; style=&#39;padding-left:20px;&#39;›<wbr />Login with Idp‹/a›</code></p>
          <ul type="disc">
                <li class="MsoNormal"><span style="font-size:15px ;font-family:Times New Roman serif;">Also add below code to <b>Decrypt</b> the attributes at your login side.</span></li>
            </ul>

            <div style="background-color :white;margin:0px 0px 30px 55px;padding:0px 0px 5px 10px;border:solid windowtext 1.0pt; height: 400px; width: 650px;"><p style=" height: 600px; width: 647px;font-size: 8.0pt; font-family: Consolas;">//Decrypt the paramters
               <br/><br/><br/> private string Decrypt(string ciphertext)
        {
            <br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; string EncryptionKey = ConfigurationManager.AppSettings["encrypt_key"];<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; byte[] cipherBytes = Convert.FromBase64String(ciphertext);
               using (Aes encryptor = Aes.Create())<br/>
            {
               <br/>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[]<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                <br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; encryptor.Key = pdb.GetBytes(32);
                <br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; encryptor.IV = pdb.GetBytes(16);
                <br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; using (MemoryStream ms = new MemoryStream())<br/>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {
                    <br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; using (CryptoStream cs = new CryptoStream<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (ms, encryptor.CreateDecryptor(), CryptoStreamMode.Write))<br/>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {
                        <br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cs.Write(cipherBytes, 0, cipherBytes.Length);
                        <br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cs.Close();

                    <br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }

                    <br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ciphertext= Encoding.Unicode.GetString(ms.ToArray());<br/>&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return ciphertext;
               &nbsp;
                   <br/> }<br/></p>
              </div>
          </div>
       </div>
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    </asp:Content>

