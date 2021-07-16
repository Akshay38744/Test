<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">   
   <script type="text/javascript">
       function validate_form()
       {
           if (document.getElementById('<%=txtusername.ClientID%>').value == "") {
               alert('Please enter your Username');
               document.getElementById('<%=txtusername.ClientID%>').focus();
                return false;
            }

            if (document.getElementById('<%=txtusername.ClientID%>').value != "") {
               str = document.getElementById('<%=txtusername.ClientID%>').value
                if (str.length < 3) {
                    alert('Please enter your full Username');
                    document.getElementById('<%=txtusername.ClientID%>').focus();
                    return false;
                }
            }
            if (document.getElementById('<%=txtusername.ClientID%>').value != "") {
               str = document.getElementById('<%=txtusername.ClientID%>').value
                if (str.length > 50) {
                    alert('Username can contain maximum 50 characters')
                    document.getElementById('<%=txtusername.ClientID%>').focus();
                    return false;
                }
            }

           ///////////////////////////////////// Password ////////////////////////////////////

           if (document.getElementById('<%=txtpasssword.ClientID%>').value == "") {
               alert('Please Enter a password !')
               document.getElementById('<%=txtpasssword.ClientID%>').focus();
                return false;
            }

            a = document.getElementById('<%=txtpasssword.ClientID%>').value
           var regex1 =/^(?=.*[0-9]+.*)(?=.*[a-zA-Z]+.*)[0-9a-zA-Z]{6,}$/
           
           if (!a.match(regex1)) {
               alert("Password Should be Atleast one Charactor and number!")
               document.getElementById('<%=txtpasssword.ClientID%>').focus();
                return false;
            }

            if (document.getElementById('<%=txtpasssword.ClientID%>').value != "") {
               str = document.getElementById('<%=txtpasssword.ClientID%>').value
                if (str.length > 50) {
                    alert('Email contain maximum 50 character')
                    document.getElementById('<%=txtpasssword.ClientID%>').focus();
                    return false
                }
            }

           ///////////////////////////////////// Captcha Code ////////////////////////////////////


           if (document.getElementById('<%=txtcapcha.ClientID%>').value == "") {
               alert('Please enter your Captcha Code');
               document.getElementById('<%=txtcapcha.ClientID%>').focus();
                return false;
           }

       }
   </script>
        


    <div style="height: 416px; margin-top: 0px;">
        
         <form id="form" runat="server" style="width: 646px; height: 138px; margin-left: 352px">
              
       <asp:ScriptManager ID="SM1" runat="server">  
    </asp:ScriptManager>
             <br />
      <div class="form-group form-row">
             <asp:Label ID="lblerror" runat="server" ForeColor="#336600"></asp:Label>
      </div>
               <div class="form-group row">
 
                   
    <label for="Name">Username</label>
                   
        <input type="text" id="txtusername" runat="server" class="form-control" />
    </div>

  <div class="form-group row">
    <label for="Name">Password</label>
        <input type="text" id="txtpasssword" runat="server" class="form-control" />
    </div>

         <div class="form-group row">

             <asp:UpdatePanel ID="UP1" runat="server">  
                    <ContentTemplate>  
                        <table>  
                            <tr>  
                                <td style="height: 50px; width: 100px;">  
                                    <asp:Image ID="imgCaptcha" runat="server" />  
                                </td>  
                                <td valign="middle">  
                                    <asp:Button ID="btnRefresh" runat="server" Text="Refresh" OnClick="btnRefresh_Click"/>  
                                </td>  
                            </tr>  
                        </table>  
                    </ContentTemplate>  
                </asp:UpdatePanel>  

    <label for="Name"></label>
             <asp:TextBox ID="txtcapcha"  class="form-control" runat="server"></asp:TextBox>
        
    </div>


          <div>
              <asp:Button ID="Button1" runat="server" Text="Sign in" CssClass="btn btn-primary" OnClientClick="return  validate_form()" OnClick="Button1_Click" />
 <asp:Button ID="Button2" runat="server" Text="Reset" CssClass="btn btn-primary" OnClick="Button2_Click1" />
  
          </div>
    </form>

    
    </div>
</asp:Content>

