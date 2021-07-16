using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage2 : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Admin.Visible = false;
        if (Session["uname"] != null && Session["uname"].ToString() == "Admin" && Session["pwd"].ToString() == "Admin123")
        {
            Admin.Visible = true;
           
        }
    }
}
