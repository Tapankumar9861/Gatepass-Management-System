<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OtpVerification.aspx.cs" Inherits="ERP_Login.Login.OtpVerification" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="style.css" />
    <title>Otp-Verification</title>
  </head>
<body>
    <form id="form1" runat="server">
        <div class="d-flex justify-content-center align-items-center continer" id="in">
        <div class="card py-5 px-3">
        <h3 class="m-0" id="h5">Otp verification</h3>
        <br>
        <span class="email-text"> <b>Enter the code we just sent on your Email</b><br>
          <b class="text-color">
              <asp:Label ID="EmailLabel" runat="server" Text=""></asp:Label></b>
        </span>
        <div class="d-flex flex-row mt-5">

          
            <asp:TextBox ID="box1" class="form-control" style="text-align: center;" maxlength="1" runat="server" onkeyup="moveToNext(this, 'box2', null)"></asp:TextBox>

            <asp:TextBox ID="box2" class="form-control" style="text-align: center;" maxlength="1" runat="server" onkeyup="moveToNext(this, 'box3','box1')" ></asp:TextBox>

            <asp:TextBox ID="box3" class="form-control" style="text-align: center;" maxlength="1" runat="server" onkeyup="moveToNext(this, 'box4','box2')"></asp:TextBox>

            <asp:TextBox ID="box4" class="form-control" style="text-align: center;" maxlength="1" runat="server" onkeyup="moveToNext(this, null ,'box3')"></asp:TextBox>
        </div>
            <asp:Label ID="LabelError" runat="server" Text=""></asp:Label>
        <center>
        <div class="verify">
            <asp:Button ID="VerifyButton" runat="server" class="btn btn-success" Text="Verify" OnClick="VerifyButton_Click" />
        </div></center>
        <div class="text-center mt-5">
          <span class="d-block mobile-text" id="countdown"></span>
            <asp:Button ID="resend" runat="server" class="d-block mobile-text" Text="Resend" OnClick="resend_Click" Visible="false" />
        </div>
      </div>
    </div>
    <script src="main.js"></script>

    </form>
</body>
</html>
