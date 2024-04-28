<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="ERP_Login.Login.Dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dashboard</title>
    <style>
        .main {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            text-align: center;
        }

        @media only screen and (max-width: 600px) {
            .main {
                width: 80%; /* Adjust the width for small screens */
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="main">
            <h1 style="color:red;">You are Under Review...</h1>
            <h3>Please contact <a href="http://www.ahtscarrier.com">www.ahtscarrier.com</a><br />
            (or)<br />
            E-mail: <a href="mailto:connectahts@gmail.com">connectahts@gmail.com</a><br />
            (or)<br />
            Mobile No: +91 8847875548 / +91 9937535345 </h3>
        </div>
    </form>
</body>
</html>
