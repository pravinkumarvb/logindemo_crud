using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(string.IsNullOrEmpty(Session["RoleID"] as string))
        {
            Response.Redirect("~/Default.aspx");
        }
        if(Session["RoleID"].ToString()!="1")
        {
            Response.Redirect("~/Default.aspx");
        }
        lblFullName.Text = Session["FullName"].ToString();
        lblRoleName.Text = Session["RoleName"].ToString();
    }



    protected void lnkLogout_Click(object sender, EventArgs e)
    {
        Session["UserID"] = "";
        Session["FullName"] = "";
        Session["RoleID"] = "";
        Session["RoleName"] = "";
        Response.Redirect("~/Default.aspx");
    }
}
