using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class addtocart : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(ConfigurationManager.AppSettings["connection"]);
    SqlCommand cmd;
    SqlDataAdapter da;
    DataSet ds;
    decimal grandTotal = 0;
    decimal rowTotal;
    string Productid;

  
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["uname"] == null)
        {
            Response.Redirect("login.aspx");
        }
        if(!(Page.IsPostBack))
        {
            databind();
           
        }
    }
    public void databind()
    {
         string user = Session["Uname"].ToString();
        cn.Open();
        cmd = new SqlCommand("proc_cart", cn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@mode", SqlDbType.VarChar, 20));
        cmd.Parameters.Add("@Username",user);
        cmd.Parameters["@mode"].Value = "P_details";
        da = new SqlDataAdapter(cmd);
        ds = new DataSet();
        da.Fill(ds, "cart");
        int cnt=0;
        cnt = Convert.ToInt32(cmd.ExecuteScalar());
        GridView1.DataSource = ds.Tables["cart"].DefaultView;
        GridView1.DataBind();
        cn.Close();
        if(cnt == 0)
        {
            total.Visible = false;
            TextBox1.Text = "";
        }
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            rowTotal = Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "price")) * Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "quantity"));
            grandTotal = grandTotal + rowTotal;

            TextBox1.Text = grandTotal.ToString();
        }
       
    }
 
 
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        cn.Open();
        cmd = new SqlCommand("proc_cart", cn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@mode", SqlDbType.VarChar, 20));
        cmd.Parameters.Add("@Pid",Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()));
        cmd.Parameters["@mode"].Value = "P_delete";
        cmd.ExecuteNonQuery();
        cn.Close();
        databind();
    }
   
  protected void btnlogout_Click(object sender, EventArgs e)
    {

        Session["uname"] = null;
        Session["pwd"] = null;
    }
}