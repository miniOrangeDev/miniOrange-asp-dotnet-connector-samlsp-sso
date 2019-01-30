<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ACS.aspx.cs" Inherits="WebApplication1.ACS" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head2" runat="server">
    <title></title>
    <script language="C#" runat="server">
        public void Submit_Ok(Object sender, EventArgs args)
        {
            //perform validation for the username and password
          //  Response.Redirect("Index.aspx");
            
        }
    </script>
</head>
<body>
    <form id="form1" runat="server" defaultbutton="Submit">
            
      <div style="font-family:Calibri;padding:0 3%;">
          <div style="color: #3c763d;background-color: #dff0d8; text-align:center; border:1px solid #AEDB9A;">
                                
           
            <h2>TEST <%= test_result %></h2>
           </div>
     <%if (test_result == "SUCCESSFUL")
         { %>
              
          <div style="display:block;text-align:center;margin-bottom:1%;margin-top:1%"><img style="width:5%;" src="image/right.png" /></div>
               <p style="font-weight:bold;font-size:14pt;margin-left:1%;">ATTRIBUTES RECEIVED:</p>
          <table style="border-collapse:collapse;border-spacing:0; display:table;width:100%; font-size:14pt;background-color:#EDEDED;">
          <tbody>
              <tr style="text-align:center;">
                  <td style="font-weight:bold;border:2px solid #949090;padding:2%;">ATTRIBUTE NAME</td>
                  <td style="font-weight:bold;padding:2%;border:2px solid #949090; word-wrap:break-word;">ATTRIBUTE VALUE</td>
             </tr>

              <tr>
                  <td style="border:2px solid #949090;padding:2%; text-align:center;"><asp:Label ID="Label2"  runat="server" Width="320px" Height="20px"></asp:Label></td>
                  <td style="padding:2%; border:2px solid #949090; word-wrap:break-word;text-align:center;"><asp:Label ID="Label3" runat="server" Width="320px"></asp:Label></td>
             </tr>
              <asp:Label ID="Label1"   runat="server" Width="250px"></asp:Label>
              </tbody></table>
                 <%}
     if (test_result == "FAILED")
    { %>
          <div style="display:block;text-align:center;margin-bottom:1%;margin-top:1%;"><img style="width:5%;" src="image/wrong.png" /></div>
              <table style=" border:2px; display:table;width:60%;background-color:#EDEDED;margin-left:20%;">
                  <tbody>
                      <tr style='font-weight:bold;font-size:20px;'><td style="border:2px solid #949090;padding:1%;column-span:all;text-align:center;"><%= response_error %></td></tr>
                  <tr></tr></tbody></table>
                <%} %></div>
          <div style="margin:2%;display:block;text-align:center;">
              <asp:Button runat="server" OnClick="Test_Done" style="padding:1%;width:100px;background: #0091CD none repeat scroll 0% 0%;cursor: pointer;
                                font-size:15px;border-width: 1px;border-style: solid;border-radius: 3px;
                                    box-sizing: border-box;border-color: #0073AA;box-shadow: 0px 1px 0px rgba(120, 200, 230, 0.6) inset;
                                    color: #FFF;" ID="Submit" Text="Done" Width="135px" /></div>
                    
    </form>
  </body>
</html>
