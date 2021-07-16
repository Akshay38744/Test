<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Homepage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">   
    <form id="fm" runat="server">
        <div style="text-align: right">
    <asp:Button ID="Button1" runat="server" Text="Login" CssClass="btn btn-success" PostBackUrl="~/login.aspx" />
            <asp:Button ID="Button2" runat="server" Text="Register" CssClass="btn btn-success" PostBackUrl="~/Register.aspx" />
        </div>
        </form>
    <div id="body" class="home">
			<div class="header">
				<img src="IMG/shopping.jpg" alt="">
				<div>
					<a href="products.aspx">Freeze Delight</a>
				</div>
			</div>
			<div class="body">
				<div>
					<div>
						<h1>NEW PRODUCT</h1>
						<h2>The Twist of Healthy Yogurt</h2>
						<p>This website template has been designed by freewebsitetemplates.com for you, for free. You can replace all this text with your own text.</p>
					</div>
					<img src="IMG/images (1).jpg" alt="">
				</div>
			</div>
	
		</div>
</asp:Content>

