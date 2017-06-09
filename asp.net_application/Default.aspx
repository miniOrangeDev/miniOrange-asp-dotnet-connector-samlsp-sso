<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MiniApplication.Default" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Label">Hello you are logged in using connector</asp:Label>
            <br />
            <br />
            <asp:Label ID="LegendInfo" runat="server" Text="Label"></asp:Label>&nbsp;
        </div>
        <br />
        <asp:Button ID="log_out" runat="server" Text="Sign Out" OnClick="Logout" />
    </form>
</body>
</html>
