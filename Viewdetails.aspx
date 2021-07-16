<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="Viewdetails.aspx.cs" Inherits="Viewdetails" %>


 

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
           <form runat="server" style="height: 900px">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
            <div class="row">
  <div class="col-9">
      <asp:Image ID="Image3" runat="server" Height="294px" ImageUrl="~/IMG/fashion.jpg" Width="1351px" />
<asp:Button ID="btnlogout" runat="server" CssClass="btn btn-warning" Text="Logout" OnClick="btnlogout_Click" style="z-index: 1; position: absolute; top: 296px; left: 1292px" /></div>
  <div class="col-4"><asp:Image ID="Image2" runat="server" Height="600px" ImageUrl="~/IMG/images.jpg" Width="428px" /></div>
  <div class="col-6">
      
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <br />
      <br />
      <br />
      
      <asp:DataList ID="DataList1" runat="server" CellPadding="4" RepeatDirection="Horizontal" ForeColor="#333333" OnItemCommand="DataList1_ItemCommand">
            <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
        <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <ItemStyle BackColor="#F7F6F3" ForeColor="#333333" />
     <ItemTemplate>

                    <table class="w-100">
                        <tr>
                            <td style="width: 331px">
                                <asp:Image ID="Image1" runat="server" height="420" ImageUrl='<%#Eval("img") %>' width="327" />
                            </td>
                            <td>
                                <table class="w-100" style="height: 152px">
                                    <tr>
                                       <td>
                                            <p class="text-center">
                                                <b>Product id : </b><%#Eval("P_id") %>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                         <td style="height: 40px">
                                            <h1 id="Name0" runat="server"><strong>Name :</strong> <%# Eval("P_name") %></h1>
                                            <p runat="server">
                                                &nbsp;</p>
                                        </td>
                                        
                                    </tr>
                                    <tr>
                                        <td class="text-center">
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("P_name") %>' Visible="false"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="text-center">
                                            <asp:Label ID="Label2" runat="server" Text='<%#Eval("Price") %>' Visible="false"></asp:Label>
                                        </td>
                                    </tr>
                                    
                                    <tr>
                                        <td class="text-center">
                                            <strong>Quantity :&nbsp;&nbsp; </strong>&nbsp;<asp:DropDownList ID="DropDownList1" runat="server">
                                                <asp:ListItem Value="1"></asp:ListItem>
                                                <asp:ListItem Value="2"></asp:ListItem>
                                                <asp:ListItem Value="3"></asp:ListItem>
                                            </asp:DropDownList>
                                            <br />
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <strong>Description :
                                            <br />
                                            </strong> <p class="text-break"><%#Eval("Description") %></p>
                                            <p class="text-break">
                                                &nbsp;</p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="text-center">
                                              <asp:Button ID="Button1" runat="server" CommandArgument='<%# Eval("P_id")%>' CommandName="addtocart" Text="Add To Cart" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 331px">
                                <p class="text-center">
                                    <span><b>Price : </b><%#Eval("Price") %></span>Rupees</p>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
        <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />

    </asp:DataList></div>
</div>
    <div class="text-center" style="margin-left: 448px">
 </br> 
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
            <br />
        </form>
    </asp:Content>

