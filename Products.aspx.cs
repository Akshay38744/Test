using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Products : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(ConfigurationManager.AppSettings["connection"]);
    SqlCommand cmd;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["uname"] == null)
        {
            Response.Redirect("login.aspx");
        }
        
        if(!(Page.IsPostBack))
        {
            bindcategory();
            datagrid();
        }
       
       
    }
    public void datagrid()
    {
        try
        {
            cn.Open();
            SqlCommand cmd = new SqlCommand("proc_product", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@mode", SqlDbType.NVarChar, 20));
            cmd.Parameters.Add("@categoryname", Session["Cname"]);
            cmd.Parameters["@mode"].Value = "productlist1";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "category");
            DataList2.DataSource = ds.Tables["category"].DefaultView;
            DataList2.DataBind();
          
        }
        catch
        {

        }
        finally
        {
            cn.Close();
        }
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

            Image img = (Image)e.Item.FindControl("Image1");
            ViewState["image"] = img.ImageUrl.ToString();
            string img1 = ViewState["image"].ToString();
            DropDownList ddl = (DropDownList)e.Item.FindControl("DropDownList1");

            string ddlvalue = ddl.SelectedItem.ToString();
            string User = Session["uname"].ToString();
            Label s = (Label)e.Item.FindControl("Label2");
            string Pname = s.Text;
            Label s1 = (Label)e.Item.FindControl("Label4");
            string price = s1.Text;
            cn.Open();
            string cart = "insert into cart(Username,img,Pname,price,quantity)values('" + User + "','" + img1 + "','" + Pname + "','" + price + "','" + ddlvalue + "')";
            cmd = new SqlCommand(cart, cn);
            cmd.ExecuteNonQuery();
            cn.Close();
            Response.Redirect("AddtoCart.aspx?id=" + e.CommandArgument.ToString() + "&quantity=" + ddl.SelectedItem.ToString());
        }
    }
     protected void btnlogout_Click(object sender, EventArgs e)
    {

        Session["uname"] = null;
        Session["pwd"] = null;
    }
}