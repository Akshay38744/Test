using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Default2 : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(ConfigurationManager.AppSettings["connection"]);
    SqlCommand cmd;
    SqlDataAdapter da;
    DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            cn.Open();
            cmd = new SqlCommand("Proc_user", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@mode", SqlDbType.VarChar, 20));
            cmd.Parameters.Add("@Name", Name.Value);
            cmd.Parameters.Add("@Username", Username.Value);
            cmd.Parameters.Add("@Email", Email.Value);
            cmd.Parameters.Add("@Add1", Add1.Value);
            cmd.Parameters.Add("@Add2", Add2.Value);
            cmd.Parameters.Add("@Mobile", Mobile.Value);
            cmd.Parameters.Add("@Gender", RadioButtonList1.SelectedValue);
            cmd.Parameters.Add("@Password", Password.Value);
            cmd.Parameters.Add("@retypepwd", Conformpwd.Value);
            cmd.Parameters["@mode"].Value = "Add";
            cmd.ExecuteNonQuery();
            string msg = "<script>alert('Registered Sucessfully')</script>";
            Response.Write(msg);
         
        }
        catch
        {

        }
        finally
        {
            cn.Close();
        }
    }
     protected void Button2_Click(object sender, EventArgs e)
    {
        Name.Value = "";
        Username.Value = "";
        Email.Value = "";
        Add1.Value = "";
        Add2.Value ="";
        Mobile.Value = "";
        RadioButtonList1.SelectedIndex = 0;
        Password.Value = "";
        Conformpwd.Value = "";

    }
}

