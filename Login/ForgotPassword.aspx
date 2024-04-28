<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ForgotPassword.aspx.cs" Inherits="ERP_Login.Login.ForgotPassword" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Otp-Verification</title>
    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    />
    <link rel="stylesheet" type="text/css" href="style1.css" />
</head>
<body>
    <form id="form1" runat="server">
            <div class="d-flex justify-content-center align-items-center continer" id="in">
      <div class="card py-5 px-3">
        <h3 class="m-0" id="h5">Forget Password</h3>
        <br>
        <span class="email-text"
          ><b>Enter your email address , We send otp for reset password.</b><br>
          <b class="text-color"></b>
        </span>
       
        <div class="d-flex flex-row mt-4">
            <asp:TextBox ID="EmailTextBox" class="form-control" runat="server"></asp:TextBox>
        </div>
          <asp:Label ID="LabelError" runat="server" Text=""></asp:Label>
        <center>
        <div class="verify mt-2">
          
            <asp:Button ID="SendOtpButton" CssClass="btn btn-success" runat="server" Text="Send OTP" OnClick="SendOtpButton_Click" />
        </div></center>
        
        <div class="re">
        <p>
            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Back to Login</asp:LinkButton></p>
        <p>
            <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">Register</asp:LinkButton></p> 
        </div>
      </div>
    </div>
    </form>
</body>
</html>