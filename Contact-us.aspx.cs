using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;


public partial class Contact_us : System.Web.UI.Page
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
        cn.Open();
        cmd = new SqlCommand("proc_contactus", cn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@mode", SqlDbType.VarChar, 20));
        cmd.Parameters.Add("@Name", Name.Value);
        cmd.Parameters.Add("@Email", Email.Value);
        cmd.Parameters.Add("@msg", Message.Value);
        cmd.Parameters["@mode"].Value = "Add";
        cmd.ExecuteNonQuery();
        lblmsg.Text = "Form Submitted Sucessfully";
        clear();
    }
    public void clear()
    {
        Name.Value = "";
        Email.Value = "";
        Message.Value = "";
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        clear();
        lblmsg.Text = "";
    }
}