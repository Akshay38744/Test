<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
   
        <tr>
    <td>        <div id="search">

            <table class="auto-style6" style="background-color: #C0C0C0" align="right">
                <tr>
                    <td class="auto-style5">
                        <asp:Label ID="Label1" runat="server" Text="Search "></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="auto-style4" Height="23px" Width="134px"></asp:TextBox>
                    </td>
                </tr>
                <tr>     
                  <td class="auto-style5"></td>           
               <td class="auto-style6">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnsearch" runat="server" Text="Search" OnClick="btnsearch_Click" />&nbsp;</td>
                </tr>
            </table>

        </div>
    <div>
        &nbsp;&nbsp;&nbsp;
        <div class="text-center">
        <asp:DataList ID="DataList1" runat="server" RepeatDirection="Horizontal" OnItemCommand="DataList1_ItemCommand" CellSpacing="2" BorderStyle="None" BackColor="#DEBA84" Height="36px" BorderColor="#DEBA84" BorderWidth="1px" CellPadding="3" GridLines="Both" Width="16px">
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <ItemStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <ItemTemplate>
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style3">
                           
                            <asp:ImageButton ID="imgbtn" runat="server" Height="100px" Width="100px" ImageUrl='<%# Eval("img")%>' CommandArgument='<%# Eval("C_name") %>' />
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


        <div id="datagrid">

            <asp:DataList ID="DataList2" runat="server" BackColor="White" BorderColor="White" BorderStyle="None" BorderWidth="2px" CellPadding="3" RepeatDirection="Horizontal" CellSpacing="3" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" Height="211px" HorizontalAlign="Justify" RepeatColumns="4" style="text-align: center" TabIndex="3" OnItemCommand="DataList2_ItemCommand">
                <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                <ItemStyle BackColor="#DEDFDE" ForeColor="Black" />
                <ItemTemplate>

                    <table class="auto-style7" border="1">
                        <tr>
                            <td>
                                <asp:Image ID="Image1" Height="200px" Width="200px" ImageUrl=<%#Eval("img")%> runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style8">
                                <asp:Label ID="Label2" runat="server" Text=<%#Eval("P_name") %>></asp:Label>
                            </td>
                        </tr> 
                        <tr>
                            <td>
                                <asp:Label ID="Label4" runat="server" Text=<%#Eval("Price")%>></asp:Label>
                            </td>
                        </tr>
                         <tr>
                            <td>
                                <asp:Button ID="Button2" CssClass="btn btn-outline-primary" runat="server" Text="View Details" CommandArgument='<%# Eval("P_id")%>' CommandName="viewdetails" />
                                <asp:Button ID="Button3" CssClass="btn btn-outline-primary" runat="server" Text="Add to Cart" CommandArgument='<%# Eval("P_id")%>' CommandName="addtocart" />
                            </td>
                        </tr>
                    </table>

                </ItemTemplate>
                <SelectedItemStyle BackColor="Blue" Font-Bold="True" ForeColor="White" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" />
               
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:TestsiteConnectionString %>" SelectCommand="SELECT * FROM [Product]"></asp:SqlDataSource>
        </div>

    </td>
</tr>
        </form>
</asp:Content>

