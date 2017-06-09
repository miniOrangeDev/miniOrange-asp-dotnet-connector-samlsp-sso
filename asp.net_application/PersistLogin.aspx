<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PersistLogin.aspx.cs" Inherits="MiniApplication.PersistLogin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="LegendStatus" Style="font-size: 40px; margin-left: 600px; font-weight: 700; text-decoration: underline;" runat="server"
                EnableViewState="false" Text="">ASP.Net Application </asp:Label><br />
            <br />

            <strong style="background-color: red">Note:</strong>After completing the connector configuration then only this link will work.<br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

        <!--Here you will add code for the link-->

          <!--   <a href="<%=ConfigurationManager.AppSettings["connector_url"].Trim()%>">Login with IdP</a> <br /><br/> -->



        </div>
    </form>
</body>
</html>
