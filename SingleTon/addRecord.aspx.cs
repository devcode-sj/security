using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class pl_ApplicationMaster_addRecord : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

         //SESSION MANAGEMENT
        eDISHAutil  eSessionMgmt = new eDISHAutil();
        eSessionMgmt.checkreferer();
        //SESSION MANAGEMENT


 //*********to Disable cache for IE as well as FIREFOX browser****
        Response.Cache.SetAllowResponseInBrowserHistory(false);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetNoStore();
            Response.Expires = 0;

            Response.Buffer = true;
            Response.ExpiresAbsolute = DateTime.Now.AddDays(-1D);
            Response.Expires = -1500;
            Response.CacheControl = "no-cache";
            Response.Cache.SetNoStore();

            string browser = Request.Browser.Browser;
            if (browser == "IE") 
        {
                Response.CacheControl = "No-Cache";
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
        }
            else
        {
                Response.Cache.SetAllowResponseInBrowserHistory(false);
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.Expires = 0;
                Response.Cache.SetNoStore();
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
            }

            Response.Cache.SetNoStore();
            Response.Cache.SetCacheability(HttpCacheability.NoCache);

            //*********to Disable cache for IE as well as FIREFOX browser****







string uid;
uid = (string)Session["UserId"];
if (uid == "")
{
    Response.Redirect("~/adminlogin.aspx", true);

}

if ((string)Session["ForcePwdChange"] != "y")
{
    Response.Redirect("~/changepwd.aspx", true);
}

  // if NOT Admin
if ((string)Session["UserType"] != "A")
{
    Response.Redirect("~/adminlogin.aspx", true);
}



//Start--TRACKING SESSION FIXATION
if ((Request.Cookies["APSF"].Value) != (string)(Session["APSF"]))
{
    Response.Redirect("~/admin/pl/Errpage_sessionexp_A.aspx", true);
}
//End---TRACKING SESSION FIXATION


//***********Prevent Session Hijacking*********************
eDISHAutil e2 = new eDISHAutil();
if ((Request.Cookies["Ck1"].Value) != (string)(e2.encrypt(Request.ServerVariables["REMOTE_ADDR"])))
{
    Response.Redirect("~/adminlogin.aspx", true);
}      
//***********Prevent Session Hijacking*********************

if (!IsPostBack)
{
    int valueencrypt1 = 0;
    Random randomclassencypt1 = new Random();
    valueencrypt1 = randomclassencypt1.Next(1111, 8888);
    string viewstatevalue = Convert.ToString(valueencrypt1);
    ViewState.Add(viewstatevalue, 0);
}


           //SESSION MANAGEMENT
        eSessionMgmt.AntiFixationInit();
        eSessionMgmt.AntiHijackInit();
        //SESSION MANAGEMENT







    }
   
    
    protected void btnAddNewRec_ServerClick(object sender, EventArgs e)
    {
        if ((Page.IsValid)==true) 
        {

        string ApplicationCode="";
        string ApplicationName="";
        string ApplicationURL="";
        string CreateUser="";
        string language = "";
        string AppType = "";
        DateTime Createdate = DateTime.Today;
        /*
        Initializing parameters
         * */
        ApplicationCode = getMaxAppCode();
        ApplicationName = tbHTMLAppName.Value;
        ApplicationURL = tbHTMLAppURL.Value;
        CreateUser = (string)Session["UserId"];
        language = rblLanguage.SelectedItem.Value;
        AppType = ddlPlatform.SelectedItem.Value;

       
      
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "pedishaTblApplicationMasterAdd";
        cmd.Parameters.AddWithValue("@p_ApplicationCode",ApplicationCode);
        cmd.Parameters.AddWithValue("@p_ApplicationName",ApplicationName);
        cmd.Parameters.AddWithValue("@p_ApplicationURL",ApplicationURL);
       
         cmd.Parameters.AddWithValue("@p_CreateUser",CreateUser);
         cmd.Parameters.AddWithValue("@p_CreateDate",Createdate);
      
         cmd.Parameters.AddWithValue("@p_Language",language);
          cmd.Parameters.AddWithValue("@p_ApplicationType",AppType);
          SQLHelper hlp = new SQLHelper();


          int result = hlp.InsertData(cmd);
          if (result == 1)
          {
              Response.Redirect("index.aspx", true);
          }
          else
          {
              Alert("Error! ");
          }
        
    }
    }

    protected string getMaxAppCode()
    {
        SQLHelper hlp = new SQLHelper();
        return (hlp.getScalarData("select max(convert(int,ApplicationCode))+1 from tblApplicationMaster"));
    }
    protected void Alert(string alertMsg)
    {

        String strScript = "";
        strScript = "<script language=JavaScript> alert('" + alertMsg + "') </script>";
        this.ClientScript.RegisterStartupScript(this.GetType(), "alertKey", strScript);
    }

    public void Page_Error(object sender, System.EventArgs e)
    {

        Response.Redirect("~/admin/pl/errorpage.aspx");


    }



}
