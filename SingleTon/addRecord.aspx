<%@ Page Language="C#" AutoEventWireup="true" CodeFile="addRecord.aspx.cs" ValidateRequest="false" Trace="false" EnableViewStateMac="true" Inherits="pl_ApplicationMaster_addRecord" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<%
    Response.Cache.SetCacheability(HttpCacheability.NoCache);
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
		history.go(1); // disable the browser's back button
</script>



<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Application Master</title>
    <link href="~/CSS/cssEdisha1.css" rel="stylesheet" type="text/css" />
<!-- Include WinCloseScript.js file which contains functions that are called from Body onunload event-->
<script language="Javascript" type="text/javascript" src="<%=ResolveUrl("~/scripts/WinCloseScript.js")%>"></script>

</head>
<body onunload="exitSession();" onKeyDown="getKeyCode();" onMouseDown= "getMouseButton();">
    <form id="form1" runat="server" autocomplete="off">
    <div>
     <table border="0" cellpadding="0" cellspacing="0" style="width: 98%">
            <tr>
                <td colspan="2">
                    <edishaUC:header1 ID="Header1" runat="server" />
                </td>
            </tr>
            <tr>
                <td style="width: 17%" align="left" valign="top">
                    <edishaUC:leftMenu ID="LeftMenu1" runat="server" />
                </td>
                <td valign="top">
                    <div style="text-align: left">
                        <table style="width: 100%">
                            <tr>
                                <td class="R2">
                                    Application Master: Add New</td>
                            </tr>
                            <tr>
                                <td>
                                    <table width="80%">
                                        <tr>
                                            <td style="width: 30%; height: 21px;">
                                            </td>
                                            <td style="width: 30%; height: 21px;">
                                            </td>
                                            <td style="width: 30%; height: 21px;">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 30%">
                                                Application Name</td>
                                            <td style="width: 30%">
                                                <input id="tbHTMLAppName" class="textbox" type="text" runat="server" maxlength="50" style="width: 183px" /></td>
                                            <td style="width: 30%">
                                            
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbHTMLAppName"
                                                    CssClass="Alert" Display="Dynamic" ErrorMessage="Enter Application name"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tbHTMLAppName"
                                                    CssClass="Alert" Display="Dynamic" ErrorMessage="Invalid Application name" ValidationExpression="^[A-Za-z\s]{1,50}$"></asp:RegularExpressionValidator>
                                            
                                            
                                            
                                            
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 30%">
                                                Application URL</td>
                                            <td style="width: 30%">
                                                <input id="tbHTMLAppURL" class="textbox" type="text" runat="server" /></td>
                                            <td style="width: 30%">
                                            
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbHTMLAppURL"
                                                    CssClass="Alert" Display="Dynamic" ErrorMessage="Enter Application URL"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="tbHTMLAppURL"
                                                    CssClass="Alert" Display="Dynamic" ErrorMessage="Invalid Application URL" ValidationExpression="^[A-Za-z\s\/._]{1,50}$"></asp:RegularExpressionValidator>
                                            
                                           
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 30%" valign="top">
                                                Language</td>
                                            <td style="width: 30%">
                                                <asp:RadioButtonList ID="rblLanguage" runat="server" CssClass="textbox" RepeatDirection="Horizontal">
                                                    <asp:ListItem Selected="True" Value="E">English</asp:ListItem>
                                                    <asp:ListItem Value="H">Hindi</asp:ListItem>
                                                </asp:RadioButtonList></td>
                                            <td style="width: 30%">
                                             
                                           
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="rblLanguage"
                                                    CssClass="Alert" Display="Dynamic" ErrorMessage="Invalid Language" ValidationExpression="^[EH]{1,1}$"></asp:RegularExpressionValidator>
                                            
                                           
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 30%">
                                                Platform</td>
                                            <td style="width: 30%">
                                                <asp:DropDownList ID="ddlPlatform" runat="server" CssClass="textbox">
                                                    <asp:ListItem Selected="True">[Select One]</asp:ListItem>
                                                    <asp:ListItem Value="A">ASP</asp:ListItem>
                                                    <asp:ListItem Value="J">JSP</asp:ListItem>
                                                    <asp:ListItem Value="W">Windows</asp:ListItem>
                                                    <asp:ListItem Value="N">ASP.Net</asp:ListItem>
                                                </asp:DropDownList></td>
                                            <td style="width: 30%">
                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlPlatform"
                                                    CssClass="Alert" Display="Dynamic" ErrorMessage="Select Platform"></asp:RequiredFieldValidator>
                                      
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="ddlPlatform"
                                                    CssClass="Alert" Display="Dynamic" ErrorMessage="Invalid Platform" ValidationExpression="^[AJWN]{1,1}$"></asp:RegularExpressionValidator>      
                               
                                            
                                            
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" style="width: 30%">
                                            </td>
                                            <td style="width: 30%">
                                            
                                      
                                            </td>
                                            <td style="width: 30%">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" style="width: 30%">
                                            </td>
                                            <td style="width: 30%">
                                            </td>
                                            <td style="width: 30%">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 30%" align="right"><a href="index.aspx" class="button" style="width:50px" onclick="return confirm('Are you sure to cancel?');" >Cancel</a>
                                            </td>
                                                <td style="width: 30%">
                                                <input id="btnAddNewRec" type="button" value="Add Record" class="button" runat="server" onserverclick="btnAddNewRec_ServerClick"  /></td>
                                            <td style="width: 30%">
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                      
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="height: 47px">
                    <edishaUC:bottom ID="Bottom1" runat="server" />
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>