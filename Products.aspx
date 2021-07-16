    <%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage2.master" CodeFile="Products.aspx.cs" Inherits="Products" %>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

  
       <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
   
      <form id="form1" runat="server">
        <div class="text-right">
        <asp:Button ID="btnlogout" runat="server" CssClass="btn btn-warning" Text="Logout" OnClick="btnlogout_Click" />
        <div class="col-9">
        </div>
        <div class="text-right">
        <div class="text-right">

         <div class="text-center">
        &nbsp;&nbsp;&nbsp;
             <div class="text-center">
        <asp:DataList ID="DataList1" runat="server" RepeatDirection="Horizontal" OnItemCommand="DataList1_ItemCommand" CellSpacing="2" BorderStyle="None" BackColor="#DEBA84" Height="16px" BorderColor="#DEBA84" BorderWidth="1px" CellPadding="3" GridLines="Both" Width="16px">
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <ItemStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <ItemTemplate>
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style3">                       
                            <asp:ImageButton ID="imgbtn" runat="server" Height="100px" Width="100px" CssClass="border border-info" ImageUrl='<%# Eval("img")%>' CommandArgument='<%# Eval("C_name") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" Text='<%# Eval("C_name") %>' CommandArgument='<%# Eval("C_name") %>' />
                        </td>
                    </tr>
                </table>
             
            </ItemTemplate>
            <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
        </asp:DataList>
             </div>
    </div>
  <br />

        <div id="datagrid">
            <asp:DataList ID="DataList2" runat="server" BackColor="White" BorderColor="White" BorderStyle="None" BorderWidth="2px" CellPadding="3" RepeatDirection="Horizontal" CellSpacing="3" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" Height="211px" HorizontalAlign="Justify" RepeatColumns="5" style="text-align: center" TabIndex="3" OnItemCommand="DataList2_ItemCommand">
                <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                <ItemStyle BackColor="#DEDFDE" ForeColor="Black" />
                    <ItemTemplate>
                    <table class="auto-style7">
                        <tr>
                            <td style="width: 228px">
                                <asp:Image ID="Image1" Height="200px" CssClass="border border-primary" Width="200px" ImageUrl=<%#Eval("img")%> runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style8" style="width: 228px">
                                <asp:Label ID="Label2" runat="server" Text=<%#Eval("P_name") %>></asp:Label>
                            </td>
                        </tr>
                        
                        <tr>
                            <td style="width: 228px">
                                <asp:Label ID="Label4" runat="server" Text=<%#Eval("Price")%>></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 228px">
                                Quantity :- <strong>&nbsp;</strong><asp:DropDownList ID="DropDownList1" runat="server">
                                    <asp:ListItem>1</asp:ListItem>
                                    <asp:ListItem Value="2"></asp:ListItem>
                                    <asp:ListItem Value="3"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 228px">
                                <asp:Button ID="Button2" runat="server" Text="View Details"  CssClass="btn btn-outline-primary" CommandArgument='<%# Eval("P_id")%>' CommandName="viewdetails" />
                                <asp:Button ID="Button3" runat="server" Text="Add to Cart"  CssClass="btn btn-outline-primary" CommandArgument='<%# Eval("P_id")+","+ Eval("Price")%>' CommandName="addtocart" />
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
                <SelectedItemStyle BackColor="Blue" Font-Bold="True" ForeColor="White" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" />
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:TestsiteConnectionString %>" SelectCommand="SELECT * FROM [Product]"></asp:SqlDataSource>
            <div style="height: 288px"></div>
        </div>

  
   
    </form>
    </asp:Content>