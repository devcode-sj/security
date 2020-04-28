<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMaster.master" AutoEventWireup="true" CodeFile="Approve_multilocation_request.aspx.cs" Inherits="admin_pl_Approve_multilocation_request" %>
 <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <%
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetExpires(DateTime.Now);
        Response.Buffer = true;

        Response.Expires = -1;
        Response.CacheControl = "no-cache";


    %>
    <script language="javascript">
        function noBack() { window.history.forward() }
        noBack();
        window.onload = noBack;
        window.onpageshow = function (evt) { if (evt.persisted) noBack() }
        window.onunload = function () { void (0) }
    </script>
    <script type="text/javascript" language="Javascript">
        history.go(1); // disable the browser's back button
    </script>
   
    <script language="Javascript" type="text/javascript" src="<%=ResolveUrl("~/scripts/md5.js")%>"></script>

    <script language="javascript" type="text/javascript">
        function showHideModule(ModuleCell, checkbox) {
            if (document.getElementById(checkbox).checked == true) {
                //alert(document.getElementById('v' + checkbox));
                //  alert(ModuleCell);

                //****for space before checkboxes****
                document.getElementById(ModuleCell).style.paddingLeft = "40";

                //*************for EDIT DELETE
                //document.getElementById('v' + checkbox).checked=true;
                //document.getElementById('e' + checkbox).checked=true;
                //************************************


                document.getElementById(ModuleCell).style.display = '';
            }
            else {
                //*************for EDIT DELETE

                //document.getElementById('v' + checkbox).checked=false;
                //document.getElementById('e' + checkbox).checked=false;
                //************************************


                document.getElementById(ModuleCell).style.display = 'none';
            }
        }
        history.go(1); // disable the browser's back button


        function md5auth(seed) {
            //debugger;

            var username = document.getElementById('_ctl0_ContentPlaceHolder1_txtUserId').value;

            var rexp = /^\w+$/;
            if (username.length < 5 || username.length > 15) {
                alert("Please enter valid username");
                document.getElementById('_ctl0_ContentPlaceHolder1_txtUserId').focus();
                return false;
            }
            if (username.search(rexp) == -1) {
                alert("Please enter valid username");
                document.getElementById('_ctl0_ContentPlaceHolder1_txtUserId').focus();
                return false;
            }


            var password = document.getElementById('_ctl0_ContentPlaceHolder1_txtPassword').value;




            if (password.length == 0 || password.length < 6 || password.length > 15) {
                alert("Please enter valid password");
                document.getElementById('_ctl0_ContentPlaceHolder1_txtPassword').focus();
                return false;
            }

            //check for alphanumericand spchar
            var flag_num = 0;
            var flag_alpha = 0;
            var flag_spchars = 0;


            for (i = 0; i < password.length; i++) {
                if ((password.charAt(i) >= '0') && (password.charAt(i) <= '9')) {
                    flag_num = flag_num + 1;
                }
                else if (((password.charAt(i) >= 'A') && (password.charAt(i) <= 'Z')) || ((password.charAt(i) >= 'a') && (password.charAt(i) <= 'z'))) {
                    flag_alpha = flag_alpha + 1;
                }
                else if ((password.charAt(i) == '$') || (password.charAt(i) == '#') || (password.charAt(i) == '@')) {
                    flag_spchars = flag_spchars + 1;
                }

            }

            if (flag_num == 0) {
                alert("Invalid password");
                document.getElementById('_ctl0_ContentPlaceHolder1_txtPassword').focus();
                return (false);
            }

            if (flag_alpha == 0) {
                alert("Invalid password");
                document.getElementById('_ctl0_ContentPlaceHolder1_txtPassword').focus();
                return (false);
            }

            if (flag_spchars == 0) {
                alert("Invalid password");
                document.getElementById('_ctl0_ContentPlaceHolder1_txtPassword').focus();
                return (false);
            }
            //check for alphanumeric


            //var rexp1 = /^\w+\W+^[-%=+]/;
            //var rexp1 = /^(a-zA-Z0-9!@#$^&()_)$/;


            //it will allow alpha numeric and some special chars,but special chars AT THE the beginning of pwd  ALSO
            //var rexp1 =/^(?=[\w$#_!@]{6,15})[\w$#_!@]{6,15}$/;
            var rexp1 = /(?=^.{5,20}$)(?=.*\d)((?=.*[A-Z])|(?=.*[a-z])).*$/;


            //it will allow alpha numeric and some special chars,but special chars NOT in the beginning of pwd
            //var rexp1 =/^(?=[\w]{6,15})[\w$#_!@]{6,15}$/;


            //alert(password.search(rexp1));

            if (password.search(rexp1) == -1) {
                alert("Please enter valid password");
                document.forms[0].txtPassword.focus();
                return false;
            }
            //alert(seed);
            var hash = seed + hex_md5(password);
            document.getElementById('_ctl0_ContentPlaceHolder1_txtPassword').value = hash;



            var cpassword = document.getElementById('_ctl0_ContentPlaceHolder1_txtPasswordConfirm').value;
            if (cpassword.length < 6 || cpassword.length > 15) {
                alert("Please enter valid confirm password");
                document.getElementById('_ctl0_ContentPlaceHolder1_txtPasswordConfirm').focus();
                return false;
            }


            var flag_numc = 0;
            var flag_alphac = 0;
            var flag_spcharsc = 0;


            for (i = 0; i < cpassword.length; i++) {
                if ((cpassword.charAt(i) >= '0') && (cpassword.charAt(i) <= '9')) {
                    flag_numc = flag_numc + 1;
                }
                else if (((cpassword.charAt(i) >= 'A') && (cpassword.charAt(i) <= 'Z')) || ((cpassword.charAt(i) >= 'a') && (cpassword.charAt(i) <= 'z'))) {
                    flag_alphac = flag_alphac + 1;
                }
                else if ((cpassword.charAt(i) == '$') || (cpassword.charAt(i) == '#') || (cpassword.charAt(i) == '@')) {
                    flag_spcharsc = flag_spcharsc + 1;
                }
            }

            if (flag_numc == 0) {
                alert("Invalid confirm password");
                document.getElementById('_ctl0_ContentPlaceHolder1_txtPasswordConfirm').focus();
                return (false);
            }

            if (flag_alphac == 0) {
                alert("Invalid confirm password");
                document.getElementById('_ctl0_ContentPlaceHolder1_txtPasswordConfirm').focus();
                return (false);
            }
            if (flag_spcharsc == 0) {
                alert("Invalid confirm password");
                document.getElementById('_ctl0_ContentPlaceHolder1_txtPasswordConfirm').focus();
                return (false);
            }


            if (cpassword.search(rexp1) == -1) {
                alert("Please enter valid password");
                document.getElementById('_ctl0_ContentPlaceHolder1_txtPasswordConfirm').focus();
                return false;
            }






            var chash = seed + hex_md5(cpassword);
            document.getElementById('_ctl0_ContentPlaceHolder1_txtPasswordConfirm').value = chash;


            return true;

        }




        function pasteclipboard() {
            //window.opener.SetDate(todayday+ "/" + aMonthDisplay[todayobj.getMonth()] + "/" + year,control);
            //	   document.form1.txtCitizenId.value=da;

            document.form1.txtCitizenID.focus();

            PastedText = document.form1.txtCitizenID.createTextRange();

            PastedText.execCommand("Paste");

            //window.open("AppShowCIDRDetail.aspx?cid=" + document.form1.txtCitizenID.value + "");

        }
    </script>
    <!-- Bootstrap core JavaScript-->
 <%--    <script src="/MLRPMR/Scripts/jquery.min.js"  type="text/javascript"></script>--%>
    <script src="../vendor/jquery/jquery.min.js"  type="text/javascript"></script>
    
    <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    
    <!-- Core plugin JavaScript-->
    <script src="../vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Page level plugin JavaScript-->
    <script src="../vendor/datatables/jquery.dataTables.js"></script>
    <script src="../vendor/datatables/dataTables.bootstrap4.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="../js/sb-admin.min.js"></script>

    <!-- Demo scripts for this page-->
    <script src="../js/demo/datatables-demo.js"></script>
     
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="content-wrapper">
        <asp:ScriptManager ID="scpt" runat="server"></asp:ScriptManager>
        <div class="container-fluid">

            <!-- Breadcrumbs-->
            <ol class="breadcrumb">
               
                       
                <li class="breadcrumb-item">
                    <a href="Approve_multilocation_request.aspx"> Approve Multiple location Request</a>
                </li>
                <li class="breadcrumb-item active">List</li>
                
            </ol>

            <!-- DataTables Example -->
            <div class="card mb-3">
                <div class="card-body" id="divuserDetails" runat="server" visible="false">
                    <div class="row">
                        <div class="table-responsive">
 <asp:GridView ID="grd_multi_details" runat="server" AutoGenerateColumns="true" BackColor="White"  class="table table-bordered" Width="100%" CellSpacing="0"
                                                                    BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
                                                                    <FooterStyle BackColor="White" ForeColor="#000066" />
                                                                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                                                                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                                                                    <RowStyle ForeColor="#000066" />
                                                                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                                                                </asp:GridView>
                        </div>
                        <div class="row" >
                            <div class="col-md-4">
                                 <strong>Registration Number:</strong>
                                 <asp:Label runat="server" ID="LblRegistrationNo"></asp:Label>
                            </div>
                               <div class="col-md-4">

                                    <strong>User Name:</strong>
                                      <asp:Label runat="server" ID="lblName"></asp:Label>

                            </div>
                               <div class="col-md-4">
                                    <strong>Requested Institute:</strong>
                                     <asp:Label runat="server" ID="lblRequestedInst"></asp:Label>
                                     <asp:Label runat="server" ID="lblID1" Visible="false"></asp:Label>
                            </div>
                          
                        </div>
                        <div class="row">
                             <div class="col-md-6">
                            <strong>Valid Upto:</strong>
                                  <asp:TextBox runat="server" ID="txtvalidUptoDate" CssClass="form-control" AutoComplete="off"></asp:TextBox>
                                    <cc1:CalendarExtender ID="CalendarExtender2" runat="server"  TargetControlID="txtvalidUptoDate" Format="dd/MM/yyyy">
                             </cc1:CalendarExtender>
                                 </div>
                             <div class="col-md-6">
                                    <asp:Button runat="server" ID="btnAccept" Text="Accept" CssClass="btn btn-primary "
                                                                    OnClick="btnAccept_Click" />
                                  <asp:Button runat="server" ID="btnReject" Text="Reject" CssClass="btn btn-primary "
                                                                    OnClick="btnReject_Click" OnClientClick="return confirm('Are you sure to Reject?');" />
                                 </div>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                           <asp:GridView runat="server" ID="grd_Approval" AutoGenerateColumns="False" class="table table-bordered" Width="100%" CellSpacing="0"
                                                    BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" OnRowCommand="grd_Approval_RowCommand">
                                                    <EmptyDataTemplate>
                                                        No Record Available</EmptyDataTemplate>
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="ID" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" ID="lblID" Text='<%# Bind("ID") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Sr No.">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" ID="lblSrno" Text='<%#Container.DataItemIndex+1 %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="User ID">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" ID="lblUserID" Text='<%# Bind("UserID") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="User Name">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" ID="lblUserName" Text='<%# Bind("UserName") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="State">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" ID="lblSName" Text='<%# Bind("SName") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="District">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" ID="lblDName" Text='<%# Bind("DName") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Requested Institute">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" ID="lblHealthInstituteName" Text='<%# Bind("HealthInstituteName") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Requested Date">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" ID="lblRequestSentDate" Text='<%# Bind("RequestSentDate") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Status of Request">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" ID="lblApproved" Text='<%# Bind("Approved") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Approval Date">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" ID="lblApprovalDate" Text='<%# Bind("ApprovalDate") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Valid Upto">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" ID="lblValidUptodate" Text='<%# Bind("ValidUptodate") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="User Reg No">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" ID="lblTransferRegNo" Text='<%# Bind("TransferRegNo") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Details">
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="lblDetails" runat="server" CommandArgument='<%#Bind("ID") %>'
                                                                    CommandName="Details_R">Details</asp:LinkButton>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <FooterStyle BackColor="White" ForeColor="#000066" />
                                                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                                                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                                                    <RowStyle ForeColor="#000066" />
                                                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                                                </asp:GridView>
                          
                    </div>
                </div>
               
            </div>



        </div>
        <!-- /.container-fluid -->
    </div>

</asp:Content>


