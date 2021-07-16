using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;


public partial class Viewdetails : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(ConfigurationManager.AppSettings["connection"]);
    SqlCommand cmd;
    DataSet ds;
    SqlDataAdapter da;
    string id;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["uname"] == null)
        {
            Response.Redirect("login.aspx");
        }
        id = Request.QueryString["id"];
        if (!(Page.IsPostBack))
        {
            databind();
        }
        
    }
    public void databind()
    {
        cn.Open();
        cmd = new SqlCommand("proc_product", cn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@mode", SqlDbType.VarChar, 20));
        cmd.Parameters.Add("@Pid",id); 
        cmd.Parameters["@mode"].Value = "Details";
        da = new SqlDataAdapter(cmd);
        ds = new DataSet();
        da.Fill(ds, "Product");
        cmd.ExecuteNonQuery();
        DataList1.DataSource = ds.Tables["Product"].DefaultView;
        DataList1.DataBind();
        cn.Close();
    }

    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "addtocart")
        {
            
            Image img = (Image)e.Item.FindControl("Image1");
            ViewState["image"] = img.ImageUrl.ToString();
            string img1 = ViewState["image"].ToString();
            DropDownList ddl = (DropDownList)e.Item.FindControl("DropDownList1");

            string ddlvalue = ddl.SelectedItem.ToString();
            string User = Session["uname"].ToString();

            Label s = (Label)e.Item.FindControl("Label1");
            string Pname = s.Text;
            Label s1 = (Label)e.Item.FindControl("Label2");
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