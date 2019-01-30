<%@ Page Language="C#" %>
<%@ Import Namespace="System" %>

<script language="C#" runat="server">
	
	
	protected void Page_Load(object sender, EventArgs e){
          
	  
		 
	  var userName = HttpContext.Current.Session["username"];
	  var email = HttpContext.Current.Session["email"];
	  var firstName = HttpContext.Current.Session["firstname"];
	  var lastName = HttpContext.Current.Session["lastname"];
	  
	  
	  Response.Write(userName);
	  
	  // User attributes above to start session


	  
	  
	}
	
</script>