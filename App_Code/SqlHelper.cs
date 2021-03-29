using System;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

/// <summary>
/// Summary description for SqlHelper
/// </summary>
public class SqlHelper
{
    public static SqlConnection GetConnectionString()
    {
        string strConnectionString = ConfigurationManager.ConnectionStrings["MyCon"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnectionString);
        return con;
    }
    public static bool ExecuteNonQuery(string strcmd)
    {
        try
        {
            using (SqlConnection con = GetConnectionString())
            {
                SqlCommand cmd = new SqlCommand(strcmd, con);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                return true;
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    public static DataTable FillData(string SQL)
    {
        try
        {
            SqlConnection con;
            con = GetConnectionString();
            con.Open();
            string strcmd = SQL; //Get Table Details
            SqlCommand cmd = new SqlCommand(strcmd, con);
            cmd.CommandTimeout = 0;
            SqlDataAdapter dtadp = new SqlDataAdapter();
            dtadp.SelectCommand = cmd;
            DataTable dt = new DataTable();
            dtadp.Fill(dt);
            con.Close();
            return dt;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
}