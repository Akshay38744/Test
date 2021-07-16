<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="Contact-us.aspx.cs" Inherits="Contact_us" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">   
    <style type="text/css">
        .lblmsg
        {
           color:green;

        }
    </style>
      <script type="text/javascript">
          function validation() {

              if (document.getElementById('<%=Name.ClientID%>').value == "") {
                  alert('Please enter your name');
                  document.getElementById('<%=Name.ClientID%>').focus();
                  return false;
              }

              if (document.getElementById('<%=Name.ClientID%>').value != "") {
                  var regex = /^[a-zA-Z ]*$/;
                  if (!document.getElementById('<%=Name.ClientID%>').value.match(regex)) {

                      alert('Please enter only alphabets in name');
                      document.getElementById('<%=Name.ClientID%>').focus();
                      return false;
                  }
              }
              if (document.getElementById('<%=Name.ClientID%>').value != "") {
                  str = document.getElementById('<%=Name.ClientID%>').value
                  if (str.length < 3) {
                      alert('Please enter your full name');
                      document.getElementById('<%=Name.ClientID%>').focus();
                      return false;
                  }
              }
              if (document.getElementById('<%=Name.ClientID%>').value != "") {
                  str = document.getElementById('<%=Name.ClientID%>').value
                  if (str.length > 50) {
                      alert('Name can contain maximum 50 characters')
                      document.getElementById('<%=Name.ClientID%>').focus();
                      return false;
                  }
              }

              ///////////////////////Email////////////////////////////////////////

              if (document.getElementById('<%=Email.ClientID%>').value == "") {
                  alert('Email Id cannot be Blank')
                  document.getElementById('<%=Email.ClientID%>').focus();
                  return false;
              }

              email1 = document.getElementById('<%=Email.ClientID%>').value
              var regex1 = /^[a-zA-Z0-9@._]*$/;
              if (!email1.match(regex1)) {
                  alert("Your email address is not in correct format!!!")
                  document.getElementById('<%=Email.ClientID%>').focus();
                  return false;
              }

              if (!email1.match(/^([a-zA-Z0-9])+([.a-zA-Z0-9_-])*@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-]+)+/)) {
                  alert("Your email address is not in correct format")
                  document.getElementById('<%=Email.ClientID%>').focus();
                  return false;
              }

              if (document.getElementById('<%=Email.ClientID%>').value != "") {
                  str = document.getElementById('<%=Email.ClientID%>').value
                  if (str.length > 50) {
                      alert('Email contain maximum 50 character')
                      document.getElementById('<%=Email.ClientID%>').focus();
                      return false
                  }
              }

              ///////////////////////////////////Message/////////////////////////////////////


              if (document.getElementById('<%=Message.ClientID%>').value == "") {
                  alert('Please enter your message');
                  document.getElementById('<%=Message.ClientID%>').focus();
                  return false;
              }
 
              if (document.getElementById('<%=Message.ClientID%>').value != "") {
                  str = document.getElementById('<%=Message.ClientID%>').value
                  if (str.length < 3) {
                      alert('Please enter your full name');
                      document.getElementById('<%=Message.ClientID%>').focus();
                      return false;
                  }
              }
              if (document.getElementById('<%=Message.ClientID%>').value != "") {
                  str = document.getElementById('<%=Message.ClientID%>').value
                  if (str.length > 3000) {
                      alert('Name can contain maximum 50 characters')
                      document.getElementById('<%=Message.ClientID%>').focus();
                      return false;
                  }
              }
          }

             </script>
              
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">   

    <form class="fcf-form-class" runat="server" method="post" action="#" novalidate="novalidate">
                <div style="text-align: center; height: 609px;">
                <h1><span style="font-style: normal; font-weight: 400;">Contact Form</span></h1>
                <div class="field">
                    <label for="Name" class="label has-text-weight-normal">Your name</label>
                    <div class="control">
                        <input type="text" runat="server" name="Name" id="Name" class="input is-full-width">
                    </div>
                </div>
                <div class="field">
                    <label for="Email" class="label has-text-weight-normal">Your email address</label>
                    <div class="control">
                        <input type="email" runat="server" name="Email" id="Email" class="input is-full-width">
                    </div>
                </div>
                <div class="field">
                    <label for="Message" runat="server" class="label has-text-weight-normal">Your message</label>
                    <div class="control">
                        <textarea name="Message" id="Message" runat="server" class="textarea" rows="5"></textarea>
                    </div>
                </div>
                <div id="fcf-status" class="fcf-status"></div>
                <div class="field">
                    <div class="buttons">
                        <asp:Button ID="Button1" runat="server" OnClientClick="return validation()" CssClass="btn btn-primary" Text="Submit" OnClick="Button1_Click" />
                        &nbsp;
                        <asp:Button ID="Button2" CssClass="btn btn-primary" runat="server" Text="Cancel" OnClick="Button2_Click" />
                    </div>
                    <asp:Label ID="lblmsg" runat="server"></asp:Label>
                </div>
                </div>
            </form>
</asp:Content>

