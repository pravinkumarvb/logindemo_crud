using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        try
        {
            string strcmd = "SELECT Users.UserID, Users.UPassword, Users.RoleID," +
                            " Roles.RoleName, Users.FullName, Users.Active " +
                            " FROM Roles INNER JOIN " +
                            " Users ON Roles.RoleID = Users.RoleID " +
                            " WHERE (Users.UserName ='" + txtUserName.Text + "')";
            DataTable dt = new DataTable();
            dt = SqlHelper.FillData(strcmd);
            if (dt.Rows.Count > 0)
            {
                bool isActive = Convert.ToBoolean(dt.Rows[0]["Active"]);
                if (isActive)
                {
                    string strPassword = dt.Rows[0]["UPassword"].ToString();
                    if (txtPassword.Text == strPassword)
                    {
                        Session["UserID"] = dt.Rows[0]["UserID"].ToString();
                        Session["FullName"] = dt.Rows[0]["FullName"].ToString();
                        Session["RoleID"] = dt.Rows[0]["RoleID"].ToString();
                        Session["RoleName"] = dt.Rows[0]["RoleName"].ToString();
                        /*
                         * Roles:
                         * 1:Admin
                         * 2:User
                         */
                        if (Session["RoleID"].ToString() == "1")
                        {
                            Response.Redirect("~/Admin/Default.aspx");
                        }
                        else
                        {
                            Response.Redirect("~/User/Default.aspx");
                        }
                    }
                    else
                    {
                        lblMsg.Text = "Invalid Password !!!";
                    }
                }
                else
                {
                    lblMsg.Text = "Account is disabled by Administrator";
                }
            }
            else
            {
                //invalid username
                lblMsg.Text = "Invalid Username !!!";
            }
        }
        catch (Exception ex)
        {

            throw ex;
        }
    }
}