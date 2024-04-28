<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="ERP_Login.Login" %>

<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="style.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<title>Login</title>

    <style>
        * {
            box-sizing: border-box;
        }
        
        body {
            background: #f3e0e2;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            font-family: 'Montserrat', sans-serif;
            height: 100vh;
            margin: -20px 0 50px;
        }
        
        h1 {
            font-weight: bold;
            margin: 0;
        }
        
        p {
            font-size: 14px;
            font-weight: 100;
            line-height: 20px;
            letter-spacing: 0.5px;
            margin: 20px 0 30px;
        }
        
        span {
            font-size: 12px;
        }
        
        a {
            color: #333;
            font-size: 14px;
            text-decoration: none;
            margin: 15px 0;
        }
        
        button {
            border-radius: 20px;
            border: 1px solid #FF4B2B;
            background-color: #FF4B2B;
            color: #FFFFFF;
            font-size: 12px;
            font-weight: bold;
            padding: 12px 45px;
            letter-spacing: 1px;
            text-transform: uppercase;
            transition: transform 80ms ease-in;
        }
        
        form {
            background-color: #FFFFFF;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            padding: 0 50px;
            height: 100%;
            text-align: center;
        }
        
        input {
            background-color: #eee;
            border: none;
            padding: 12px 15px;
            margin: 8px 0;
            width: 100%;
        }
        
        .container {
            background-color: #fff;
            border-radius: 10px;
              box-shadow: 0 14px 28px rgba(0,0,0,0.25), 0 10px 10px rgba(0,0,0,0.22);
            position: relative;
            overflow: hidden;
            width: 768px;
            height:auto;
            max-width: 100%;
            min-height: 480px;
        }
        
        .form-container {
            position: absolute;
            top: 0px;
            height: 100%;
        }
        
        .log-in-container {
            left: 0;
            width: 50%;
            z-index: 2;
        }
        
        
        .overlay-container {
            position: absolute;
            top: 0;
            left: 50%;
            width: 50%;
            height: 100%;
        }
        
        
        .overlay {
            background: #FF416C;
            background: -webkit-linear-gradient(to right, #FF4B2B, #FF416C);
            background: linear-gradient(to right, #FF4B2B, #FF416C);
            background-repeat: no-repeat;
            background-size: cover;
            background-position: 0 0;
            color: #FFFFFF;
            position: relative;
            left: -100%;
            height: 100%;
            width: 200%;
        }
        
        .overlay-panel {
            position: absolute;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            padding: 0 40px;
            text-align: center;
            top: 0;
            height: 100%;
            width: 50%;
        }
        
        
        .overlay-right {
            right: 0;
        }
        
        
        .social-container {
            margin: 60px 0px 30px 0px;
        }
        
        .social-container a {
            border: 1px solid #DDDDDD;
            border-radius: 50%;
            display: inline-flex;
            justify-content: center;
            align-items: center;
            margin: 0 5px;
            height: 40px;
            width: 40px;
        }
         
           .login-btn {
            background-color: #FF4B2B; /* Background color */
            color: #FFFFFF; /* Text color */
            font-size: 14px;
            font-weight: bold;
            padding: 12px 45px;
            letter-spacing: 1px;
            text-transform: uppercase;
            transition: transform 80ms ease-in;
            border: none; /* Remove border */
            cursor: pointer; /* Show pointer cursor on hover */
            margin-top: 10px; /* Add some space between elements */
            border-radius:5px;
            width:auto; 
        }

        /* Hover effect for the login button */
        .login-btn:hover {
            background-color: #FF416C; /* Change background color on hover */
        }

        
        #BackButton:active{
            background-color:#E6E6EA;
        }
        form h1{
            position:absolute;
            top:10px;
        }
    </style>
</head>
<body>
	<div class="container" id="container">
		<div class="form-container log-in-container">
			<form runat="server">
				<h1>Login</h1>
				<div class="social-container">
					<a href="#" class="social"><i class="fa fa-facebook fa-2x"></i></a>
					<a href="#" class="social"><i class="fab fa fa-twitter fa-2x"></i></a>
				</div>
				<span>or use your account</span>
				<asp:TextBox ID="txtEmail" type="email" placeholder="Email" runat="server"></asp:TextBox>
				<asp:TextBox ID="txtPassword" type="password" placeholder="Password"  runat="server"></asp:TextBox>

                <asp:LinkButton ID="fPassword" runat="server" OnClick="fPassword_Click">Forgot your password?</asp:LinkButton>
				
				<asp:Button ID="lgnbtn" class="login-btn" runat="server" Text="Login" OnClick="lgnbtn_Click" />
                <a href="Register.aspx">New Registration</a><asp:LinkButton ID="BackButton" runat="server" OnClick="BackButton_Click">Go Back</asp:LinkButton>
			</form>
		</div>
		<div class="overlay-container">
			<div class="overlay">
				<div class="overlay-panel overlay-right">
					<h1>AHTS</h1>
					<p>ATHUENTIC HIRE TECHNOLOGY SOLUTION.</p>
                    <p>GATEPASS MS</p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
