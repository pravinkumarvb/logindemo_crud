using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PasswordRecovery : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnNextToSecQue_Click(object sender, EventArgs e)
    {
        //to check username is exist or not
        try
        {
            string strcmd = "SELECT        UserID, SecQue, Active "+
                            " FROM Users "+
                            " WHERE (UserName ='"+ txtUserName.Text +"')";
            DataTable dt = new DataTable();
            dt = SqlHelper.FillData(strcmd);
            if(dt.Rows.Count>0)
            {
                bool isActive = Convert.ToBoolean(dt.Rows[0]["Active"]);
                if(isActive)
                {
                    lblMsg.Text = "";
                    hdfUserID.Value = dt.Rows[0]["UserID"].ToString();
                    lblSecQue.Text = dt.Rows[0]["SecQue"].ToString();
                    MultiView1.ActiveViewIndex = 1;
                }
                else
                {
                    lblMsg.Text = "Account is disabled by Administrator";
                }
            }
            else
            {
                lblMsg.Text = "Invalid Username !!!";
            }
        }
        catch (Exception ex)
        {

            throw ex;
        }
    }

    protected void btnNextToPassword_Click(object sender, EventArgs e)
    {
        try
        {
            //to check security answer
            string strcmd = "SELECT       UPassword " +
                            " FROM Users " +
                            " WHERE (UserID =" + hdfUserID.Value + ") and SecAns='" + txtSecAns.Text + "'";
            DataTable dt = new DataTable();
            dt = SqlHelper.FillData(strcmd);
            if(dt.Rows.Count>0)
            {
                lblMsg.Text = "";
                lblPassword.Text ="Your Password is "+ dt.Rows[0]["UPassword"].ToString();
                MultiView1.ActiveViewIndex = 2;
            }
            else
            {
                lblMsg.Text = "Invalid Security Answer !!!";
            }
        }
        catch (Exception ex)
        {

            throw ex;
        }
    }
}