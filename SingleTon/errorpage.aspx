<%@ Page Language="C#" AutoEventWireup="true" ValidateRequest="false" Trace="false" EnableViewStateMac="true" CodeFile="errorpage.aspx.cs" Inherits="admin_pl_errorpage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
    Response.Cache.SetCacheability(HttpCacheability
    Response.Cache.SetExpires(DateTime.Now);
    Response.Buffer = true;
    
    Response.Expires = -1;
    Response.CacheControl = "no-cache";
    
 
 %>
 <script language="javascript">
		function noBack(){window.history.forward()}
		noBack();
		window.onload=noBack;
		window.onpageshow=function(evt){if(evt.persisted)noBack()}
		window.onunload=function(){void(0)}
		</script>
  <script type="text/javascript" language="Javascript">
		history.go(1); 
</script>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Error Page</title>
  
<script language="Javascript" type="text/javascript" src="<%=ResolveUrl("~/scripts/WinCloseScript.js")%>"></script>

</head>
<body onunload="exitSession()" onKeyDown="getKeyCode()" onMouseDown= "getMouseButton()" style="left: 0px; position: absolute; top: 0px; margin-top: 0px; margin-left: 0px; text-align: center;">
    <form id="form1" runat="server" autocomplete="off">
     
      <table style="width: 100%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td style="width: 60%; background-image: url(<%=ResolveUrl("~/Images/headbg.JPG")%>);" align="left">
                    <img alt="MLRPMR" src="<%=ResolveUrl("~/Images/head1_new.jpg")%>" />
                    </td>
                    <td style="width: 40%; background-image: url(<%=ResolveUrl("~/Images/headbg.JPG")%>);" align="right">
                       <img alt="MLRPMR" src="<%=ResolveUrl("~/Images/head2.jpg")%>" /></td>
                </tr>
            </table>
     
     
     
        &nbsp; &nbsp; &nbsp;
        <table style="width: 100%; height: 225px">
            <tr>
                <td style="text-align: center;">
			<asp:ImageButton id="ImageButton1" runat="server" ImageUrl="~\Images\error1.jpg"></asp:ImageButton></td>
            </tr>
            <tr>
                <td style="text-align: center;">
    
    <asp:label id="Label1" runat="server"
				Width="297px" Font-Bold="True" ForeColor="Maroon" Font-Names="Arial" Height="24px">There is some error in this page !!!!</asp:label></td>
            </tr>
           <tr>
                <td style="text-align: center;">
                    &nbsp;<asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Click here to login again</asp:LinkButton></td>
            </tr>
        </table>
      
   
    
    </form>
</body>
</html>
