using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CreateNewUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnCreateAccount_Click(object sender, EventArgs e)
    {
        try
        {
            //to check username is exist or not
            string strcmd = "SELECT        UserID "+
                            " FROM Users "+
                            " WHERE (UserName ='"+ txtUserName.Text +"')";
            DataTable dt = new DataTable();
            dt = SqlHelper.FillData(strcmd);
            if(dt.Rows.Count>0)
            {
                //username is already exist
                lblMsg.Text = "username is not available !!!";
            }
            else
            {
                SaveUser();
            }
        }
        catch (Exception ex)
        {

            throw ex;
        }
    }

    private void SaveUser()
    {
        try
        {
            //create user
            string strCmd = "INSERT INTO Users" +
                     "(UserName, UPassword, RoleID, FullName, SecQue, SecAns, Dated, Active) " +
                     " VALUES(";
            strCmd += "'" + txtUserName.Text + "',";
            strCmd += "'" + txtPassword.Text + "',";
            strCmd += "2,";
            strCmd += "'" + txtFullName.Text + "',";
            strCmd += "'" + ddlSecQue.Text + "',";
            strCmd += "'" + txtSecAns.Text + "',";
            strCmd += "'" + DateTime.Now.ToString("MM-dd-yyyy") + "',";
            strCmd += "1)";
            SqlHelper.ExecuteNonQuery(strCmd);
            MultiView1.ActiveViewIndex = 1;
        }
        catch (Exception ex)
        {

            throw ex;
        }
    }
}