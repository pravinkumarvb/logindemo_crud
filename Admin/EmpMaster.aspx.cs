using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_EmpMaster : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!Page.IsPostBack)
        {
            btnUpdate.Enabled = false;
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            string strcmd = "SELECT        EmpID "+
                            " FROM Emp "+
                            " WHERE (EmpName ='"+ txtFullName.Text +"')";
            DataTable dt = new DataTable();
            dt = SqlHelper.FillData(strcmd);
            if(dt.Rows.Count>0)
            {
                lblMsg.Text = "Employee is already exist !!!";
            }
            else
            {
                SaveEmp();
            }
        }
        catch (Exception ex)
        {

            throw ex;
        }
        
    }

    private void SaveEmp()
    {
        try
        {
            string strcmd = "INSERT INTO Emp" +
                         " (EmpName, DesID, EmpSalary) " +
                        " VALUES(";
            strcmd += "'" + txtFullName.Text + "',";
            strcmd += ddlDes.SelectedValue + ",";
            strcmd += txtSalary.Text + ")";
            SqlHelper.ExecuteNonQuery(strcmd);
            lblMsg.Text = "Employee saved successfully";
            Clears();
        }
        catch (Exception ex)
        {

            throw ex;
        }
    }

    private void Clears()
    {
        GridView1.DataBind();
        txtFullName.Text = "";
        txtSalary.Text = "";
        hdfEmpID.Value = "";
        btnSave.Enabled = true;
        btnUpdate.Enabled = false;
        txtFullName.Focus();
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if(e.CommandName=="Ed")
        {
            int index = Convert.ToInt32(e.CommandArgument);
            hdfEmpID.Value = GridView1.Rows[index].Cells[0].Text;
            txtFullName.Text = GridView1.Rows[index].Cells[1].Text;
            ddlDes.SelectedValue = ddlDes.Items.FindByText(GridView1.Rows[index].Cells[2].Text).Value;
            txtSalary.Text = GridView1.Rows[index].Cells[3].Text;
            btnSave.Enabled = false;
            btnUpdate.Enabled = true;
        }
        else
        {
            int index = Convert.ToInt32(e.CommandArgument);
            string strEmpID= GridView1.Rows[index].Cells[0].Text;
            try
            {
                string strcmd = "delete from Emp where EmpID=" + strEmpID;
                SqlHelper.ExecuteNonQuery(strcmd);
                lblMsg.Text = "Employee deleted successfully";
                GridView1.DataBind();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            string strcmd = "UPDATE       Emp " +
                            " SET ";
            strcmd += " EmpName ='" + txtFullName.Text + "',";
            strcmd += " DesID =" + ddlDes.SelectedValue + ",";
            strcmd += " EmpSalary =" + txtSalary.Text;
            strcmd +=" WHERE (EmpID ="+ hdfEmpID.Value +")";
            SqlHelper.ExecuteNonQuery(strcmd);
            lblMsg.Text = "Employee updated successfully";
            Clears();
        }
        catch (Exception ex)
        {

            throw ex;
        }
    }
}