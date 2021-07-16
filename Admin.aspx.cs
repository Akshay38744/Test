using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using Microsoft.VisualBasic;
using System.Drawing;
using System.Text.RegularExpressions;
using System.IO;

public partial class Admin : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(ConfigurationManager.AppSettings["connection"]);
    SqlCommand cmd;
    string s;
    string s1;
    string image;
    string filename;
    protected void Page_Load(object sender, EventArgs e)
    {
        
       
       if (Session["uname"] == null)
        {
            Response.Redirect("login.aspx");
        }

        if (!(Page.IsPostBack))
        {
            Categoryadd.Visible = false;   
            grid.Visible = true;
            databind();
            btnproduct.Visible = false;
           
        }
    }

    public void dg_grid()
    {
        cn.Open();
        SqlCommand cmd = new SqlCommand("proc_product", cn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@mode", SqlDbType.NVarChar, 20));
        cmd.Parameters.Add("@categoryname", Session["Categoryname"].ToString());
        cmd.Parameters["@mode"].Value = "productlist";
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds, "Product");
        int cnt = Convert.ToInt32(cmd.ExecuteScalar());
        if(cnt > 0)
        {
            datagrid.DataSource = ds.Tables["Product"].DefaultView;
            datagrid.DataBind();
            datagrid.Visible = true;
            btnproduct.Visible = false;
        }
        else
        {
            datagrid.Visible = false;
            btnproduct.Visible = true;
        }
        if(cn.State == ConnectionState.Open)
        {
            cn.Close();
        }
       
    }
    protected void grid_SelectedIndexChanged(object sender, EventArgs e)
    {
        s = (grid.SelectedRow.FindControl("lblcname") as Label).Text;
        s1 = (grid.SelectedRow.FindControl("lblCid") as Label).Text;
        Session["Categoryname"] = s;
        Session["categoryid"] = s1;
        ProducAdd.Visible = false;
        lblhead.Text = s;
        dg_grid();
        lblmsg.Text = "";

    }
    protected void datagrid_ItemCommand(object source, DataGridCommandEventArgs e)
    {

            if (!(e.CommandName == "Page"))
            {
                
                string Cid = e.Item.Cells[1].Text;
                string Pid = e.Item.Cells[2].Text;
                string Cname = e.Item.Cells[4].Text;
                string Pname = e.Item.Cells[5].Text;
                string Price = e.Item.Cells[6].Text;
                string Desc = e.Item.Cells[7].Text;
                string active = e.Item.Cells[8].Text;
                Session["Productid"] = Pid;

                if (e.CommandName == "Add")
                {
                    clear();
                    btnadd.Text = "Add";
                    grid.Visible = false;
                    ProducAdd.Visible = true;
                    Categoryadd.Visible = false;
                    grid.Visible = false;
                    datagrid.Visible = false;
                }

                else if (e.CommandName == "Edit")
                {
                    txtPname.Text = Pname;
                    txtprice.Text = Price;
                    txtdesc.Text = Desc;
                    rdaactive.SelectedValue = active;
                    btnadd.Text = "Update";
                    ProducAdd.Visible = true;
                    Categoryadd.Visible = false;
                    grid.Visible = false;
                    datagrid.Visible = false;
                }
                else if (e.CommandName == "Delete")
                {
                    cn.Open();
                    cmd = new SqlCommand("proc_product", cn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@Mode", System.Data.SqlDbType.VarChar, 20));
                    cmd.Parameters.AddWithValue("@Pid", Pid);
                    cmd.Parameters["@Mode"].Value = "DelBrMkrById";
                    cmd.ExecuteNonQuery();
                    cn.Close();
                    lblmsg.Text = "Product deleted Sucessfully";
                    dg_grid();

                }

            }     
    }

    protected void Reset_Click(object sender, EventArgs e)
    {
        FileUpload1.Dispose();
        txtC_name.Text = "";
        rdacategory.SelectedValue = null;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string image = @"~\Images\Category\" + FileUpload1.FileName;
        if (image != null)
        {
            lblCmsg.Text = "Please Select a image";
        }
        else
        {
            FileUpload1.PostedFile.SaveAs(Server.MapPath(image));
        }
        if (lblCmsg == null)
        {
            cn.Open();
            SqlCommand cmd = new SqlCommand("proc_category", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@C_name", txtC_name.Text);
            cmd.Parameters.Add(new SqlParameter("@mode", SqlDbType.NVarChar, 20));
            if (btnadd.Text == "Add")
            {
                cmd.Parameters["@Mode"].Value = "Cdup1";
            }
            int cnt = Convert.ToInt32(cmd.ExecuteScalar());
            cn.Close();
            if (cnt > 0)
            {
                lblCmsg.Text = "Category is already Exist";
            }
            else
            {
                cn.Open();
                cmd.Parameters.Add("@img", image);
                cmd.Parameters.Add("@C_name", txtC_name.Text);
                cmd.Parameters.Add("@active", rdacategory.SelectedValue);
                cmd.Parameters["@mode"].Value = "addcategory";
                cmd.ExecuteNonQuery();
                cn.Close();
                lblCmsg.Text = "Category Added Sucessfully";
            }

        }
        else
        {
            if (cn.State == ConnectionState.Open)
            {
                cn.Close();
            }
        }

    }
    protected void datagrid_ItemDataBound(object sender, DataGridItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item | e.Item.ItemType == ListItemType.EditItem | e.Item.ItemType == ListItemType.SelectedItem | e.Item.ItemType == ListItemType.AlternatingItem)
        {
            string Pname;
            if (Information.IsDBNull(DataBinder.Eval(e.Item.DataItem, "P_name")) == false)
            {
                Pname = (string)DataBinder.Eval(e.Item.DataItem, "P_name");
            }
            else
            {
                Pname = "";
            }
            e.Item.Cells[3].Text = Pname;
            string active;
            if (Information.IsDBNull(DataBinder.Eval(e.Item.DataItem, "active")) == false)
            {
                active = (string)DataBinder.Eval(e.Item.DataItem, "active");
            }
            else
            {
                active = "N";
            }
            if (active == "Y")
            {
                e.Item.ForeColor = Color.Black;
                ((LinkButton)e.Item.Cells[3].FindControl("lnkedit")).Enabled = true;
                ((LinkButton)e.Item.Cells[3].FindControl("lnkedit")).ForeColor = Color.Blue;
                ((LinkButton)e.Item.Cells[3].FindControl("lnkdelete")).Enabled = true;
                ((LinkButton)e.Item.Cells[3].FindControl("lnkdelete")).ForeColor = Color.Blue;
            }
            else
            {
                e.Item.ForeColor = Color.Gray;
                ((LinkButton)e.Item.Cells[3].FindControl("lnkedit")).Enabled = true;
                ((LinkButton)e.Item.Cells[3].FindControl("lnkedit")).ForeColor = Color.Blue;
                ((LinkButton)e.Item.Cells[3].FindControl("lnkdelete")).Enabled = false;
                ((LinkButton)e.Item.Cells[3].FindControl("lnkdelete")).ForeColor = Color.Gray;
            }
        }
    }

    public bool validation()
    {
        if (string.IsNullOrEmpty(txtPname.Text.Trim()))
        {
            lblmsg.Text = "Please Enter a Product name";
            txtPname.Focus();
            return false;
        }
        else if (!string.IsNullOrEmpty(txtPname.Text.Trim()) && !Regex.IsMatch(txtPname.Text, "[^A-Za-z0-9]+"))
        {
            lblmsg.Text = "Invalid Product name, should contains the alphabets and space !!";
            txtPname.Focus();
            return false;
        }
        else if (!string.IsNullOrEmpty(txtPname.Text.Trim()) && txtPname.Text.Length < 6)
        {
            lblmsg.Text = "Product name should have at least 6 charactors !!";
            txtPname.Focus();
            return false;
        }

        else if (!string.IsNullOrEmpty(txtPname.Text.Trim()) && txtPname.Text.Length > 20)
        {
            lblmsg.Text = "Product name should be lesser than the 20 charactors !!";
            txtPname.Focus();
            return false;
        }
        else if (string.IsNullOrEmpty(txtprice.Text.Trim()))
        {
            lblmsg.Text = "Price should not be blank!";
            txtprice.Focus();
            return false;
        }
        else if (!string.IsNullOrEmpty(txtprice.Text) && !Regex.IsMatch(txtprice.Text, "^[0-9]+$"))
        {
            lblmsg.Text = "Invalid Price, should be digits !!";
            txtprice.Focus();
            return false;
        }
        else if (!string.IsNullOrEmpty(txtprice.Text) && txtprice.Text.Trim().Length < 3)
        {
            lblmsg.Text = "Price should contain 10 digits !!";
            txtprice.Focus();
            return false;
        }

        else if (!string.IsNullOrEmpty(txtprice.Text) && txtprice.Text.Trim().Length > 13)
        {
            lblmsg.Text = "Price should contain atleast one digits !!";
            txtprice.Focus();
            return false;
        }
        else if (string.IsNullOrEmpty(txtdesc.Text.Trim()))
        {
            lblmsg.Text = "Please Enter a Description";
            txtdesc.Focus();
            return false;
        }

        else if (!string.IsNullOrEmpty(txtdesc.Text.Trim()) && txtdesc.Text.Length < 6)
        {
            lblmsg.Text = "Description should have at least 6 charactors !!";
            txtdesc.Focus();
            return false;
        }

        else if (!string.IsNullOrEmpty(txtdesc.Text.Trim()) && txtdesc.Text.Length > 200)
        {
            lblmsg.Text = "Description should be lesser than the 100 charactors !!";
            txtdesc.Focus();
            return false;
        }
        else
        {
            return true;
        }
    }
    protected void btnadd_Click(object sender, EventArgs e)
    {

                cn.Open();
                SqlCommand cmd = new SqlCommand("proc_product", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@mode", SqlDbType.NVarChar, 20));

                if (btnadd.Text == "Add")
                {
                    cmd.Parameters.Add("@productname", txtPname.Text);
                    cmd.Parameters["@Mode"].Value = "Pdup1";
                }
                else if (btnadd.Text == "Update")
                {
                    cmd.Parameters.Add("@Pid", Session["Productid"].ToString());
                    cmd.Parameters["@Mode"].Value = "Pdup2";
                }
                int cnt1 = Convert.ToInt32(cmd.ExecuteScalar());
                cn.Close();
                if (cnt1 > 0)
                {
                    lblmsg.Text = "<Script>alert('Product is already exist');</Script>";
                }
               
                else
                {

                    if (validation() == true)
                    {
                        if (FileUpload2.FileName == "") 
                        {
                          
                        }
                        else
                        {
                            filename = Path.GetFileName(FileUpload2.PostedFile.FileName);
                            FileUpload2.SaveAs(Server.MapPath("~/Images/" + filename));
                        }
                        cn.Open();
                        cmd = new SqlCommand("proc_product", cn);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.Add(new SqlParameter("@mode", SqlDbType.NVarChar, 20));
                        cmd.Parameters.Add("@img", "/Images/" + filename);
                        cmd.Parameters.Add("@cid", Session["categoryid"].ToString());
                        cmd.Parameters.Add("@categoryname", Session["Categoryname"].ToString());
                        cmd.Parameters.Add("@productname", txtPname.Text);
                        cmd.Parameters.Add("@Pprice", txtprice.Text);
                        cmd.Parameters.Add("@Pdesc", txtdesc.Text);
                        cmd.Parameters.Add("@active", rdaactive.SelectedValue);
                        
                        if (btnadd.Text == "Add")
                        {
                            cmd.Parameters["@Mode"].Value = "AddProduct";
                        }
                        else if (btnadd.Text == "Update")
                        {
                            cmd.Parameters.Add("@Pid", Session["Productid"].ToString());

                            if (FileUpload2.FileName == "")
                            {
                                cmd.Parameters["@Mode"].Value = "UpdateProduct1";
                            }
                            else
                            {
                                cmd.Parameters["@Mode"].Value = "UpdateProduct";
                            }
                           
                        }
                        cmd.ExecuteNonQuery();
                        if (btnadd.Text == "Add")
                        {
                            lblmsg.Text = "Product Added Sucessfully";
                        }
                        else if (btnadd.Text == "Update")
                        {
                            lblmsg.Text = "Product Updated Sucessfully";
                        }
                    }
                  
               }


          if (cn.State == ConnectionState.Open)
            {
               cn.Close();
            }
            datagrid.Visible = true;
            dg_grid();
    }

    protected void lnkCadd_Click(object sender, EventArgs e)
    {
        ProducAdd.Visible = false;
        Categoryadd.Visible = true;
        clear();
    }
    protected void Button1_Click1(object sender, EventArgs e)
    {
        clear();
    }
    public void clear()
    {
        txtPname.Text = "";
        txtprice.Text = "";
        txtdesc.Text = "";

    }
    protected void btcancel_Click(object sender, EventArgs e)
    {
        clear();
        grid.Visible = true;
        ProducAdd.Visible = false;
        datagrid.CurrentPageIndex = 0;
        datagrid.Visible = true;
    }
    protected void btncancel_Click(object sender, EventArgs e)
    {
        txtC_name.Text = "";
        rdacategory.SelectedValue = null;
        Categoryadd.Visible = false;
    }

    protected void btncategory_Click(object sender, EventArgs e)
    {
        ProducAdd.Visible = false;
        Categoryadd.Visible = true;
    }
    protected void btnproduct_Click(object sender, EventArgs e)
    {
        ProducAdd.Visible = true;
        Categoryadd.Visible = false;

    }
    protected void grid_RowEditing(object sender, GridViewEditEventArgs e)
    {
        grid.EditIndex = e.NewEditIndex;
        databind();
    }
    public void databind()
    {
        cn.Open();
        cmd = new SqlCommand("[proc_category]", cn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@mode", SqlDbType.VarChar, 20));
        cmd.Parameters["@mode"].Value = "category";
        SqlDataAdapter da;
        DataSet ds;
        da = new SqlDataAdapter(cmd);
        ds = new DataSet();
        DataTable dt = new DataTable();
        da.Fill(dt);
        cmd.ExecuteNonQuery();
        int cnt = 0;
        cnt = Convert.ToInt32(cmd.ExecuteScalar());
        if (cnt > 0)
        {
            grid.DataSource = dt;
            grid.DataBind();
        }
        else
        {
            dt.Rows.Add(dt.NewRow());
            grid.DataSource = dt;
            grid.DataBind();
            grid.Rows[0].Cells.Clear();
            grid.Rows[0].Cells.Add(new TableCell());
            grid.Rows[0].Cells[0].ColumnSpan = dt.Columns.Count;
            grid.Rows[0].Cells[0].Text = "No Data Found ..!";
            grid.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
        }
    }
    protected void grid_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        grid.EditIndex = -1;
        databind();
    }
    protected void grid_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        cn.Open();
        cmd = new SqlCommand("proc_category", cn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@mode", SqlDbType.VarChar, 20));
        cmd.Parameters.Add("@C_id", Convert.ToInt32(grid.DataKeys[e.RowIndex].Value.ToString()));
        FileUpload fuPhoto = grid.Rows[e.RowIndex].FindControl("fuPhoto") as FileUpload;
        Guid FileName = Guid.NewGuid();
        fuPhoto.SaveAs(Server.MapPath("~/Images/" + FileName + ".jpg"));
        cmd.Parameters.Add("@img", "~/Images/" + FileName + ".jpg");
        cmd.Parameters.Add("@C_name", (grid.Rows[e.RowIndex].FindControl("txtCname") as TextBox).Text.Trim());
        cmd.Parameters.Add("@Active", (grid.Rows[e.RowIndex].FindControl("DropDownList1") as DropDownList).Text.Trim());
        if (fuPhoto.FileName == "")
        {
            cmd.Parameters["@mode"].Value = "Edit1";
        }
        else
        {
            cmd.Parameters["@mode"].Value = "Edit";
        }     
        cmd.ExecuteNonQuery();
        cn.Close();
        grid.EditIndex = -1;
        databind();



    }
    
    protected void grid_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Insert")
        {
            string category = (grid.FooterRow.FindControl("txtfootercname") as TextBox).Text.Trim();
             FileUpload C_image = grid.FooterRow.FindControl("fuNewPhoto") as FileUpload;
             if (string.IsNullOrEmpty(category.Trim()))
             {
                 string msg = "<script>alert('Please Enter Category Name')</script>";
                 Response.Write(msg);
                 
             }
             else if (!string.IsNullOrEmpty(category.Trim()) && !Regex.IsMatch(category, "^[a-z.A-Z ]+$"))
             {
                 string msg = "<script>alert('Category Name only Contain Character & digits')</script>";
                 Response.Write(msg);
                
             }
             else if (!string.IsNullOrEmpty(category.Trim()) && category.Length < 6)
             {
                 string msg = "<script>alert('Category Name should have at least 6 charactors')</script>";
                 Response.Write(msg);
                
             }

             else if (!string.IsNullOrEmpty(txtPname.Text.Trim()) && txtPname.Text.Length > 13)
             {
                 string msg = "<script>alert('category name should be lesser than the 13 charactors !!')</script>";
                 Response.Write(msg);
             }
             else if (C_image.FileName == "")
             {
                 string msg = "<script>alert('Please select Image')</script>";
                 Response.Write(msg);
             }

            else
            {
                cn.Open();
                SqlCommand cmd = new SqlCommand("proc_category", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@mode", SqlDbType.NVarChar, 20));
                cmd.Parameters.Add("@C_name", category);
                cmd.Parameters["@Mode"].Value = "Cdup1";
                int c = Convert.ToInt32(cmd.ExecuteScalar());
                cn.Close();
                if (c > 0)
                {
                    string msg = "<script>alert('Category name is already Exist')</script>";
                    Response.Write(msg);
                }            
                else
                {
                    grid.ShowFooter = true;
                    cn.Open();
                    cmd = new SqlCommand("proc_category", cn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@mode", SqlDbType.VarChar, 20));
                    FileUpload fuPhoto = grid.FooterRow.FindControl("fuNewPhoto") as FileUpload;
                    Guid FileName = Guid.NewGuid();
                    fuPhoto.SaveAs(Server.MapPath("~/Images/" + FileName + ".jpg"));
                    cmd.Parameters.Add("@img", "~/Images/" + FileName + ".jpg");
                    cmd.Parameters.Add("@C_name", (grid.FooterRow.FindControl("txtfootercname") as TextBox).Text.Trim());
                    cmd.Parameters.Add("@Active", (grid.FooterRow.FindControl("ddlfooter") as DropDownList).Text.Trim());
                    cmd.Parameters["@mode"].Value = "Insert";
                    cmd.ExecuteNonQuery();
                    grid.EditIndex = -1;
                    cn.Close();
                    databind();
                }
            }
        }
        
    }

    protected void grid_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        cn.Open();
        cmd = new SqlCommand("proc_category", cn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@mode", SqlDbType.VarChar, 20));
        cmd.Parameters.Add("@C_id", Convert.ToInt32(grid.DataKeys[e.RowIndex].Value.ToString()));
        cmd.Parameters["@mode"].Value = "Delete";
        cmd.ExecuteNonQuery();
        cn.Close();
        databind();
    }
   
    protected void grid_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grid.PageIndex = e.NewPageIndex;
        string x1 = grid.PageIndex.ToString();
        int currPage = Convert.ToInt32(x1) + 1;
        string x2 = grid.PageCount.ToString();
        databind();
    }
    protected void datagrid_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        datagrid.CurrentPageIndex = e.NewPageIndex;
        string x1 = datagrid.CurrentPageIndex.ToString();
        int currPage = Convert.ToInt32(x1) + 1;
        string x2 = datagrid.PageCount.ToString();
        dg_grid();
    }

   protected void btnlogout_Click1(object sender, EventArgs e)
    {
        Session["uname"] = null;
        Session["pwd"] = null;
    }
	
}   
