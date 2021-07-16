<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="addtocart.aspx.cs" Inherits="addtocart" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form runat="server">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">   
<div style="margin-left: 40px" class="text-right">
           
            <asp:Button ID="btnlogout" CssClass="btn btn-warning" runat="server" Text="Logout" OnClick="btnlogout_Click" />
        </div>
        <div class="text-right">
        <div class="text-center">
        <table style="width: 100%">
            <tr>
                <td style="height: 244px; width: 343px; background-color: #999966;">&nbsp;</td>  
                <td style="height: 244px; " class="text-center">
                                  
                    <div style="margin-top: 95px; margin-bottom: 0px" class="text-center">
                            
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="Pid" OnRowDataBound="GridView1_RowDataBound" OnRowDeleting="GridView1_RowDeleting" PageSize="100" style="margin-left: 202px">
                            <Columns>
                                <asp:BoundField DataField="Pid" HeaderText="Id" Visible="false" />
                                <asp:TemplateField HeaderText="img" SortExpression="img">
                                    <ItemTemplate>
                                        <asp:Image ID="Image1" runat="server" Height="300px" ImageUrl='<%# Bind("img")  %>' Width="250px" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Pname" HeaderText="Name" />
                                <asp:BoundField DataField="Price" HeaderText="Cost" />
                                <asp:BoundField DataField="quantity" HeaderText="quantity" />
                                <asp:CommandField ShowDeleteButton="True" />
                            </Columns>
                            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#FFF1D4" />
                            <SortedAscendingHeaderStyle BackColor="#B95C30" />
                            <SortedDescendingCellStyle BackColor="#F1E5CE" />
                            <SortedDescendingHeaderStyle BackColor="#93451F" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:testsiteConnectionString3 %>" SelectCommand="SELECT * FROM [cart] WHERE ([Username] = @Username)">
                            <SelectParameters>
                                <asp:SessionParameter Name="Username" SessionField="uname" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                </td>
            </tr>
            <tr>
                <td style="width: 343px; height: 17px;"></td>
                <td id="total" runat="server" style="height: 17px" class="text-center">
                    <strong>
                    <asp:Label ID="Label1" runat="server" Text="Total :"></asp:Label>
                    </strong>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    <asp:Button ID="Button1" class="btn btn-outline-primary" runat="server"  Text="Paynow" PostBackUrl="https://pay.google.com/intl/en_in/about/?gclid=EAIaIQobChMIq867nYCT7AIVV3ZgCh1B_wHEEAAYASAAEgIXR_D_BwE" />
                </td>
            </tr>
            <tr>
                <td style="width: 343px">&nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>

        
        </form>
</asp:Content>

