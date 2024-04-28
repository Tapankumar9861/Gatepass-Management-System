<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="ERP_Login.Login.Register" %>

<!DOCTYPE html>

<html>
  <head>
    <meta charset="utf-8">
    <title>Form</title>
    <link href="css/style.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
    *{
        padding: 0;
        margin: 0;
    }
    body{
      background: url(http://wrbbradio.org/wp-content/uploads/2016/10/grey-background-07.jpg) no-repeat center fixed;
      background-size: cover;
    }
    
    .container{
        background: #2d3e3f;
        width: 350px;
        height: 400px;
        padding-bottom: 20px;
        position: absolute;
        top:50%;
        left: 50%;
        transform: translate(-50%, -50%);
        margin: auto;
      padding: 70px 50px 20px 50px;
    }
    
    
    .fl{
        float: left;
      width: 110px;
      line-height: 35px;
    }
    
    .fontLabel{
      color: white;
    }
    
    .fr{
        float: right;
    }
    
    .clr{
        clear: both;
    }
    
    .box{
        width: 360px;
        height: 35px;
        margin-top: 10px;
        font-family: verdana;
        font-size: 12px;
    }
    
    .textBox{
        height: 35px;
        width: 190px;
        border: none;
      padding-left: 20px;
    }
    
    .new{
      float: left;
    }
    
    .iconBox{
        height: 35px;
        width: 40px;
        line-height: 38px;
        text-align: center;
      background: #ff6600;
    }
    
    .radio{
        color: white;
        background: #2d3e3f;
        line-height: 38px;
    }
    
    .terms{
        line-height: 35px;
        text-align: center;
        background: #2d3e3f;
        color: white;
    }
    
    .submit{
        float: right;
        border: none;
        color: white;
        width: 110px;
        height: 35px;
        background: #ff6600;
        text-transform: uppercase;
      cursor: pointer;
    }
     
    
</style>
</head>
  <body>

    <!-- Body of Form starts -->
  	<div class="container">
      <form method="post" autocomplete="on" runat="server">
          <!--First name-->
    		<div class="box">
                <label for="firstName" class="fl fontLabel"> First Name: </label>
    	        <div class="fl iconBox">
                    <i class="fa fa-user" aria-hidden="true"></i>
                </div>
    			<div class="fr">
                    <asp:TextBox ID="txtFname" class="textBox" runat="server" placeholder="First Name"></asp:TextBox>
    			</div>
    		</div>
    		<!--First name-->


        <!--Second name-->
    		<div class="box">
          <label for="lastName" class="fl fontLabel"> Last Name: </label>
    			<div class="fl iconBox"><i class="fa fa-user" aria-hidden="true"></i></div>
    			<div class="fr">
    					<asp:TextBox ID="txtLname" class="textBox" placeholder="Last Name" runat="server"></asp:TextBox>
    			</div>
    			<div class="clr"></div>
    		</div>
    		<!--Second name-->


    		<!---Phone No.------>
    		<div class="box">
          <label for="phone" class="fl fontLabel"> Phone No.: </label>
    			<div class="fl iconBox"><i class="fa fa-phone-square" aria-hidden="true"></i></div>
    			<div class="fr">
    					<asp:TextBox ID="textphone"  class="textBox" maxlength="10" placeholder="Phone No." runat="server"></asp:TextBox>
    			</div>
    			<div class="clr"></div>
    		</div>
    		<!---Phone No.---->


    		<!---Email ID---->
    		<div class="box">
          <label for="email" class="fl fontLabel"> Email ID: </label>
    			<div class="fl iconBox"><i class="fa fa-envelope" aria-hidden="true"></i></div>
    			<div class="fr">
    					<asp:TextBox ID="textEmail" placeholder="Email Id" class="textBox" runat="server"></asp:TextBox>
    			</div>
    			<div class="clr"></div>
    		</div>
    		<!--Email ID----->


    		<!---Password------>
    		<div class="box">
          <label for="password" class="fl fontLabel"> Password </label>
    			<div class="fl iconBox"><i class="fa fa-key" aria-hidden="true"></i></div>
    			<div class="fr">
    				<asp:TextBox ID="txtPasword" type="Password" placeholder="Password" class="textBox" runat="server"></asp:TextBox>
    			</div>
    			<div class="clr"></div>
    		</div>
    		<!---Password---->

    		<!---Gender----->
    		<div class="box radio">
          <label for="gender" class="fl fontLabel"> Gender: </label>
    				<asp:RadioButton groupName="gender" ID="RadioButton1" runat="server" OnCheckedChanged="RadioButton1_CheckedChanged1" />Male &nbsp; &nbsp; &nbsp; &nbsp;
    				<asp:RadioButton groupName="gender" ID="RadioButton2" runat="server" OnCheckedChanged="RadioButton2_CheckedChanged1" /> Female &nbsp; &nbsp; &nbsp; &nbsp;
    		</div>
    		<!---Gender--->


    		
    		<!--Terms and Conditions------>
                <div class="box terms">
 				                <asp:CheckBox ID="AgreeCheckBox"  class="box terms" runat="server" /> &nbsp; I accept the terms and conditions
                </div>
    		<!--Terms and Conditions------>



    		<!---Submit Button------>
    		<div class="box" style="background: #2d3e3f">
    				<asp:Button ID="btnRegister" class="submit" runat="server" Text="Register" OnClick="btnRegister_Click" />
    		</div>
    		<!---Submit Button----->
            <asp:Button ID="BackButton" class="btn btn-info" runat="server" Text="Back" OnClick="BackButton_Click"/>
            
      </form>
  </div>
  <!--Body of Form ends--->
  </body>
</html>