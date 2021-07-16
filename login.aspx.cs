using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Web.Security;
using System.Text;

public partial class login : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(ConfigurationManager.AppSettings["connection"]);
    SqlCommand cmd;
    SqlCommand com;
    protected void Page_Load(object sender, EventArgs e)
    {

       if(!(Page.IsPostBack))
        {
            FillCapctha();
        }
      

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Session["captcha"].ToString() != txtcapcha.Text)
        {
            lblerror.Text = "Invalid Captcha Code";
        }
        else
        {
            string s = "select * from register";
            SqlCommand com = new SqlCommand(s, cn);
            cn.Open();
            SqlDataReader dtr;
            dtr = com.ExecuteReader();
            while (dtr.Read())
            {
                if (dtr[2].ToString().Equals(txtusername.Value) && dtr[8].ToString().Equals(txtpasssword.Value))
                {
                    Session["uname"] = txtusername.Value;
                    Session["pwd"] = txtpasssword.Value;
                    FormsAuthentication.RedirectFromLoginPage(txtusername.Value, false);
                    Response.Redirect("Products.aspx");
                }
                else
                {
                    lblerror.Text = "Invalid Username and Password";
                }
            }
        }
           
       
        
    }

    public void FillCapctha()
    {
        try
        {
            Random random = new Random();
            string combination = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
            StringBuilder captcha = new StringBuilder();
            for (int i = 0; i < 6; i++)
            {
                captcha.Append(combination[random.Next(combination.Length)]);
                Session["captcha"] = captcha.ToString();
                imgCaptcha.ImageUrl = "GenerateCaptcha.aspx?" + DateTime.Now.Ticks.ToString();
            }
        }
        catch
        {
            throw;
        }
    
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Write(User.ToString());
    }
    protected void Button2_Click1(object sender, EventArgs e)
    {
        txtusername.Value = "";
        txtpasssword.Value = "";
        lblerror.Text = "";
       
    }

    protected void btnRefresh_Click(object sender, EventArgs e)
    {
        FillCapctha();
    }
}