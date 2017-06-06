<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ACS.aspx.cs" Inherits="miniOrange.ACS" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head2" runat="server">
    <title></title>
    <script language="C#" runat="server">
       
    </script>
</head>
<body>
    <form id="form1" runat="server">
            
       <div style="color: #3c763d;background-color: #dff0d8; padding:2%;margin-bottom:20px;text-align:center; border:1px solid #AEDB9A; font-size:18pt;"><b>TEST SUCCESSFUL</b></div>
            <div style="font-family:Calibri;padding:0 3%;">
      <table style="border-collapse:collapse;border-spacing:0; display:table;width:100%; font-size:14pt;background-color:#EDEDED;" >
          <tr style="text-align:center;">
          <td style="font-weight:bold;border:2px solid #949090;padding:2%;">ATTRIBUTE NAME</td>
          <td style="font-weight:bold;padding:2%;border:2px solid #949090; word-wrap:break-word;">ATTRIBUTE VALUE</td></tr>
               <tr>
               <td runat="server" id="attri" style='font-weight:bold;border:2px solid #949090;padding:2%;'></td>
               <td runat="server" id="val" style='padding:2%;border:2px solid #949090; word-wrap:break-word;'></td>
               </tr>
              <asp:Label ID="Label1" runat="server" Width="250px"></asp:Label>
           </table>
                </div>
<div style="background-color:#EDEDED;margin:3%;display:block;text-align:center;">
     <asp:Button runat="server" OnClick="Test_Done" Style="padding:1%;width:100px;background: #0091CD none repeat scroll 0% 0%;cursor: pointer;font-size:15px;border-width: 1px;border-style: solid;border-radius: 3px;white-space: nowrap;box-sizing: border-box;border-color: #0073AA;box-shadow: 0px 1px 0px rgba(120, 200, 230, 0.6) inset;color: #FFF;" ID="Submit" Class="button" Text="Done" Width="135px" />
</div>
    </form>
  </body>
</html>


