using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;


public partial class _Default : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(ConfigurationManager.AppSettings["connection"]);
    SqlCommand cmd;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!(Page.IsPostBack))
        {
            bindcategory();
            datagrid();
        }
    }
      public void datagrid()
    {
        cn.Open();
        SqlCommand cmd = new SqlCommand("proc_product", cn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@mode", SqlDbType.NVarChar, 20));
        cmd.Parameters.Add("@categoryname",Session["Cname"]);
        if (TextBox1.Text == "")
        {
            cmd.Parameters["@mode"].Value = "productlist1"; 
        }
        else
        {
            cmd.Parameters.Add("@keyword", TextBox1.Text);
            cmd.Parameters["@mode"].Value = "Search"; 
        }
        
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds, "category");
        DataList2.DataSource = ds.Tables["category"].DefaultView;
        DataList2.DataBind();
        cn.Close();
      

    }
    public void bindcategory()
    {
        cn.Open();
        SqlCommand cmd = new SqlCommand("proc_category", cn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@mode", SqlDbType.NVarChar, 20));
        cmd.Parameters["@mode"].Value = "Category1";
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds, "category");
        DataList1.DataSource = ds.Tables["category"].DefaultView;
        DataList1.DataBind();
        cn.Close();
    }


    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
          string cname = e.CommandArgument.ToString();
        Session["Cname"] = cname;
        TextBox1.Text = "";
        datagrid();

    }
    protected void btnsearch_Click(object sender, EventArgs e)
    {
        datagrid();
    }
    protected void DataList2_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "viewdetails")
        {
            Response.Redirect("Viewdetails.aspx?id=" + e.CommandArgument.ToString());
        }
        else if (e.CommandName == "addtocart")
        {
            Response.Redirect("AddtoCart.aspx?id=" + e.CommandArgument.ToString());
        }
    }
   
}