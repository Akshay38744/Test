<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     
    <style type="text/css">
       
        .auto-style1 {
            width: 57%;
        }
        .auto-style2 {
            width: 129px;
        }
        .auto-style3 {
            width: 129px;
            height: 20px;
        }
        .auto-style4 {
            height: 20px;
            width: 366px;
        }
        .auto-style5 {
            width: 366px;
        }
        .auto-style6 {
            width: 203px;
        }
        .auto-style1, th , td  {
  border: 1px solid grey;
  border-collapse: collapse;
  padding: 5px;
}
.auto-style1 tr:nth-child(odd) {
  background-color: #f1f1f1;
}
 .auto-style1 tr:nth-child(even) {
     background-color: #ffffff;
 }

        .button {
            background-color: #4CAF50; /* Green */
            border: none;
            color: white;
            padding: 12px 11px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
            
        }

.btn    {
    background-color: #4CAF50;
    border: none;
    color: white;
    padding: 8px 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
   
            }



        .auto-style7 {
            height: 30px;
        }

#Button1
{
    margin-left:1240px;
}




    </style>
</head>
<body>
    
 

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js" type="text/javascript">    
</script>    

   <script type="text/javascript">
       function validate_form() {

           if (document.getElementById('<%=txtPname.ClientID%>').value == "") {
               alert('Please enter your Product Name');
               document.getElementById('<%=txtPname.ClientID%>').focus();
               return false;
           }
           if (document.getElementById('<%=txtPname.ClientID%>').value != "") {
               var regex = /[^A-Za-z0-9]+/;
               if (!document.getElementById('<%=txtPname.ClientID%>').value.match(regex)) {

                   alert('Please enter only alphabets in Product name');
                   document.getElementById('<%=txtPname.ClientID%>').focus();
                   return false;
               }
           }

           if (document.getElementById('<%=txtPname.ClientID%>').value != "") {
               str = document.getElementById('<%=txtPname.ClientID%>').value
               if (str.length > 20) {
                   alert('Product Name can contain maximum 20 characters')
                   document.getElementById('<%=txtPname.ClientID%>').focus();
                   return false;
               }
           }


           if (document.getElementById('<%=txtPname.ClientID%>').value != "") {
               str = document.getElementById('<%=txtPname.ClientID%>').value
               if (str.length < 6) {
                   alert('Product Name should be more than 6 charators');
                   document.getElementById('<%=txtPname.ClientID%>').focus();
                   return false;
               }
           }

           if (document.getElementById('<%=txtprice.ClientID%>').value == "") {
               alert('Please enter Price');
               document.getElementById('<%=txtprice.ClientID%>').focus();
               return false;
           }

           if (document.getElementById('<%=txtprice.ClientID%>').value != "") {
               var expr = /^[0-9]+$/;
               if (!document.getElementById('<%=txtprice.ClientID%>').value.match(expr)) {
                           alert('Please enter price only digits');
                           document.getElementById('<%=txtprice.ClientID%>').focus();
                       return false;
                   }
               }
               if (document.getElementById('<%=txtprice.ClientID%>').value != "") {
               str = document.getElementById('<%=txtprice.ClientID%>').value
                if (str.length < 3) {
                    alert('Price should contain min 1 digits')
                    document.getElementById('<%=txtprice.ClientID%>').focus();
                 return false
             }
         }
         if (document.getElementById('<%=txtprice.ClientID%>').value != "") {
               str = document.getElementById('<%=txtprice.ClientID%>').value
             if (str.length > 12) {
                 alert('Price should contain max 12 digits')
                 document.getElementById('<%=txtprice.ClientID%>').focus();
                 return false
             }
         }

         if (document.getElementById('<%=txtdesc.ClientID%>').value == "") {
               alert('Please enter Description');
               document.getElementById('<%=txtdesc.ClientID%>').focus();
                       return false;
                   }

                   if (document.getElementById('<%=txtdesc.ClientID%>').value != "") {
               str = document.getElementById('<%=txtdesc.ClientID%>').value
                if (str.length < 6) {
                    alert('Description Contain minimum 6 characters');
                    document.getElementById('<%=txtdesc.ClientID%>').focus();
                 return false;
             }
         }
         if (document.getElementById('<%=txtdesc.ClientID%>').value != "") {
               str = document.getElementById('<%=txtdesc.ClientID%>').value
             if (str.length > 200) {
                 alert('Description can contain maximum 200 characters')
                 document.getElementById('<%=txtdesc.ClientID%>').focus();
                 return false;
             }
         }
          
       }

       </script>



    <link href="Style.css" rel="stylesheet" />
    <form id="form1" runat="server">
      <div class="auto-style8">
          <asp:Button ID="Button3" runat="server" CssClass="btn btn-warning" Text="Homepage" PostBackUrl="~/Home.aspx" />
        <asp:Button ID="btnlogout" runat="server" CssClass="btn btn-warning" Text="Logout" style="z-index: 1; position: absolute; top: 9px; left: 1255px" OnClick="btnlogout_Click1" />      
         <div class="auto-style8">
        <div>
 <asp:GridView ID="grid"  runat="server" ShowFooter="true" AutoGenerateColumns="False" OnSelectedIndexChanged="grid_SelectedIndexChanged" CellPadding="3" ForeColor="#333333" GridLines="None" OnRowCommand="grid_RowCommand" DataKeyNames="C_id" OnRowEditing="grid_RowEditing" OnRowDeleting="grid_RowDeleting" OnRowCancelingEdit="grid_RowCancelingEdit" AllowSorting="True" OnRowUpdating="grid_RowUpdating" PageSize="2" AllowPaging="True" OnPageIndexChanging="grid_PageIndexChanging" CellSpacing="3">
               <AlternatingRowStyle BackColor="White" />
               <Columns>
               <asp:TemplateField Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="lblCid" runat="server" Text='<%#Eval("C_id") %>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>
             <asp:TemplateField ItemStyle-Width="100px">
            <HeaderTemplate>Image</HeaderTemplate>  
            <ItemTemplate>
            <asp:Image ID="imgPhoto" Width="110px" Height="110px" runat="server" ImageUrl='<%#Bind("img") %>' />
            </ItemTemplate>
            <EditItemTemplate>
            <asp:FileUpload ID="fuPhoto" runat="server" ToolTip="select Category Photo"/>
            <asp:RegularExpressionValidator ID="revfuPhoto" runat="server" Text="Please select image file only" ToolTip="Image formate only" ControlToValidate="fuPhoto" ValidationExpression="[a-zA-Z0_9].*\b(.jpeg|.JPEG|.jpg|.JPG|.jpe|.JPE|.png|.PNG|.mpp|.MPP|.gif|.GIF)\b"></asp:RegularExpressionValidator>
            </EditItemTemplate>
            <FooterTemplate>
            <asp:FileUpload ID="fuNewPhoto" runat="server" ToolTip="select Category Photo"/>
                        
                 <asp:RegularExpressionValidator ID="revfuNewPhoto" runat="server" Text="Please select image file only" ToolTip="Image formate only" ControlToValidate="fuNewPhoto" ValidationExpression="[a-zA-Z0_9].*\b(.jpeg|.JPEG|.jpg|.JPG|.jpe|.JPE|.png|.PNG|.mpp|.MPP|.gif|.GIF)\b"></asp:RegularExpressionValidator>
            </FooterTemplate>
                        </asp:TemplateField>
        <asp:TemplateField ItemStyle-Width="100px">
            <HeaderTemplate>Category</HeaderTemplate>
                       <ItemTemplate>
                       <asp:Label ID="lblcname" Text='<%#Eval("C_name") %>' runat="server"></asp:Label>
                   </ItemTemplate>
                   <EditItemTemplate>
                       <asp:TextBox ID="txtCname" Text='<%#Eval("C_name") %>' runat="server"></asp:TextBox>
                   </EditItemTemplate>
                   <FooterTemplate>
                       <asp:TextBox ID="txtfootercname" runat="server"></asp:TextBox>
             
           
                   </FooterTemplate>
                    </asp:TemplateField>


                   <asp:TemplateField>
                       <HeaderTemplate>Active</HeaderTemplate>
                       <ItemTemplate>
                           <asp:Label Text='<%#Eval("Active") %>' runat="server"></asp:Label>
                       </ItemTemplate>
                       <EditItemTemplate>
                 <asp:DropDownList ID="DropDownList1" runat="server">
                <asp:ListItem Value="Y">Yes</asp:ListItem>
                <asp:ListItem Value="N">No</asp:ListItem>
                     </asp:DropDownList>
                       </EditItemTemplate>
                       <FooterTemplate>
                   <asp:DropDownList ID="ddlfooter" runat="server">
                <asp:ListItem Value="Y">Yes</asp:ListItem>
                <asp:ListItem Value="N">No</asp:ListItem>
                         </asp:DropDownList>
                       </FooterTemplate>
                   </asp:TemplateField>

                    <asp:TemplateField>
                        <HeaderTemplate>Action</HeaderTemplate>
                   <ItemTemplate>
                       <asp:ImageButton ImageUrl="~/Images/edit.png" Height="20px" Width="20px" runat="server" CommandName ="Edit" />
                       <asp:ImageButton ImageUrl="~/Images/delete.png" Height="20px" Width="20px" runat="server" CommandName ="Delete" />
                   </ItemTemplate>
                   <EditItemTemplate>
                        <asp:ImageButton ImageUrl="~/Images/save.png" Height="20px" Width="20px" runat="server" ToolTip="update" CommandName ="Update" />
                       <asp:ImageButton ImageUrl="~/Images/cancel.png" Height="20px" Width="20px" runat="server" CommandName ="Cancel" />
                   </EditItemTemplate>
                   <FooterTemplate>
                        <asp:ImageButton ImageUrl="~/Images/addnew.png" Height="20px" Width="20px" runat="server" CommandName ="Insert" />
                   </FooterTemplate>
               </asp:TemplateField>
                     <asp:ButtonField Text="View Product list" CommandName="Select" ItemStyle-Width="150" >
                  
<ItemStyle Width="150px"></ItemStyle>
                                </asp:ButtonField>

                 </Columns>
               <EditRowStyle BackColor="#2461BF" />
               <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
               <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
               <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
               <RowStyle BackColor="#EFF3FB" />
               <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
               <SortedAscendingCellStyle BackColor="#F5F7FB" />
               <SortedAscendingHeaderStyle BackColor="#6D95E1" />
               <SortedDescendingCellStyle BackColor="#E9EBEF" />
               <SortedDescendingHeaderStyle BackColor="#4870BE" />
           </asp:GridView>
                
    </div>
        <div>
<asp:Button ID="btnproduct" CssClass="btn" runat="server" Text="Add Product" OnClick="btnproduct_Click"/>
            <br />        
            <asp:DataGrid ID="datagrid" runat="server" AutoGenerateColumns="False" OnItemCommand="datagrid_ItemCommand" OnItemDataBound="datagrid_ItemDataBound" CellPadding="0" ForeColor="#333333" GridLines="None" PageSize="4" AllowPaging="True" OnPageIndexChanged="datagrid_PageIndexChanged" Width="1000">
                  <AlternatingItemStyle BackColor="White" />
                  <Columns>
                      <asp:TemplateColumn>
                          <HeaderTemplate>Image</HeaderTemplate>
                        <ItemTemplate>
            <asp:Image ID="imgPhoto" Width="100px" Height="100px" runat="server" ImageUrl='<%#Bind("img") %>' />
            </ItemTemplate>
                          </asp:TemplateColumn>
                      
                       <asp:BoundColumn DataField="C_id" Visible="false"></asp:BoundColumn>
                       <asp:BoundColumn DataField="P_id" Visible="false"></asp:BoundColumn>
                      <asp:TemplateColumn Visible="false">
                          <ItemTemplate>
                              <asp:Label ID="labelc" runat="server" Text='<%#Eval("C_name") %>' Visible="false"></asp:Label>
                          </ItemTemplate>
                      </asp:TemplateColumn>
                     
                <asp:BoundColumn DataField="C_name" HeaderText="Category" Visible="true"></asp:BoundColumn>
                <asp:BoundColumn DataField="P_name" HeaderText="Product" Visible="true"></asp:BoundColumn>
                <asp:BoundColumn DataField="price" HeaderText="price" Visible="true"></asp:BoundColumn>
                <asp:BoundColumn DataField="Description" HeaderText="Description" Visible="true"></asp:BoundColumn>
                <asp:BoundColumn DataField="active" HeaderText="active" Visible="false"></asp:BoundColumn>
                      <asp:TemplateColumn>
                          <HeaderTemplate><center>Action</center></HeaderTemplate>
                          <ItemTemplate>
                              <asp:LinkButton ID="lnkadd" runat="server" CommandName="Add">Add</asp:LinkButton>
                              <asp:LinkButton ID="lnkedit" runat="server" CommandName="Edit">Edit</asp:LinkButton>
                              <asp:LinkButton ID="lnkdelete" runat="server" CommandName="Delete">Delete</asp:LinkButton>
                          </ItemTemplate>
                      </asp:TemplateColumn>
                  </Columns>
                  <EditItemStyle BackColor="#2461BF" />
                  <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                  <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                  <ItemStyle BackColor="#EFF3FB" />
                  <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" Mode="NumericPages" />
                  <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
              </asp:DataGrid>
        </div>
        <div id="ProducAdd" runat="server" visible="false">
            <table class="auto-style1" style="table-layout: auto; border-style: double; height: 224px;">
                <tr>
                    <td align="center" colspan="6" valign="middle" bgcolor="#CCCC00" class="auto-style7">
                <asp:Label ID="lblhead" runat="server" CssClass="header" Text="Add City"></asp:Label>
            </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="lblerror" runat="server"></asp:Label>
                    &nbsp;
                        <asp:Label ID="lblmsg" runat="server"></asp:Label>
                    </td>
                    <td class="auto-style4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        
                    </td>
                </tr>
                 <tr>
                    <td class="auto-style6" id="Td1">
                        <asp:Label ID="Label2" runat="server" Text="Image"></asp:Label>
                    </td>
                    <td><asp:FileUpload ID="FileUpload2" runat="server" />
                           <asp:RegularExpressionValidator ID="revfuNewPhoto" runat="server" Text="Please select image file only" ToolTip="Image formate only" ControlToValidate="FileUpload2" ValidationExpression="[a-zA-Z0_9].*\b(.jpeg|.JPEG|.jpg|.JPG|.jpe|.JPE|.png|.PNG|.mpp|.MPP|.gif|.GIF)\b"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lblpname" runat="server" Text="P_name"></asp:Label>
                    </td>
                    <td class="auto-style5">
                        <asp:TextBox ID="txtPname" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lblprice" runat="server" Text="price"></asp:Label>
                    </td>
                    <td class="auto-style5">
                        <asp:TextBox ID="txtprice" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lbldesc" runat="server" Text="Desc"></asp:Label>
                    </td>
                    <td class="auto-style5">
                        <asp:TextBox ID="txtdesc" runat="server" Height="106px" Width="336px" TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lblactive" runat="server" Text="active"></asp:Label>
                    </td>
                    <td class="auto-style5">
                        <asp:RadioButtonList ID="rdaactive" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Value="Y" Selected="True">Yes</asp:ListItem>
                            <asp:ListItem Value="N">No</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">    
                        <asp:Button ID="btnadd" CssClass="button" runat="server" Text="Add" OnClientClick ="return validate_form()" OnClick="btnadd_Click" />
                    </td>
                    <td class="auto-style5">
                        &nbsp;&nbsp;
                        <asp:Button ID="btnreset" CssClass="button" runat="server" Text="Reset" OnClick="Button1_Click1" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btcancel" CssClass="button" runat="server" OnClick="btcancel_Click" Text="Cancel" />
                    </td>
                </tr>
            </table>

        </div>
 <div id="Categoryadd" runat="server" visible="true">

            <table class="auto-style1">
               <tbody><tr><td align="center" colspan="6" valign="middle" bgcolor="#CCCC00">
                <span id="lblAddMainHead" class="header">Add Category</span>
            </td>
                <tr>
                    <td class="auto-style6" id="lblCmsg">
                        <asp:Label ID="lblCmsg" runat="server"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style6" id="Td1">
                        <asp:Label ID="lblimage" runat="server" Text="Image"></asp:Label>
                    </td>
                    <td><asp:FileUpload ID="FileUpload1" runat="server" /></td>
                </tr>
                <tr>
                    <td class="auto-style6">
                        <asp:Label ID="lblname" runat="server" Text="Category Name"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtC_name" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6">
                        <asp:Label ID="Label1" runat="server" Text="Active"></asp:Label>
                    </td>
                    <td>
                        <asp:RadioButtonList ID="rdacategory" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Selected="True">Yes</asp:ListItem>
                            <asp:ListItem>No</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6">
                        <asp:Button ID="Button2" CssClass="button" runat="server" OnClick="Button1_Click" Text="Add" />
                    </td>
                    <td>
                        <asp:Button ID="Reset" CssClass="button" runat="server" Text="Reset" OnClick="Reset_Click" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btncancel" CssClass="button" runat="server" OnClick="btncancel_Click" Text="Cancel" />
                    </td>
                </tr>
            </table>

        </div>
   
    </form>
</body>
</html>
