<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Gatepass_Item.aspx.cs" Inherits="ERP_Login.Dashboard.Gatepass_Item" %>

<!DOCTYPE html>

<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <style>
        * {
            margin: 0px;
            padding: 0px;
        }

        body {
            background-color: rgb(248, 116, 208);
        }

        #Con {
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .main {
            flex-basis: 70%;
            max-width: 900px;
            height: auto;
            background-color: white;
            border-radius: 20px;
            padding: 20px;
            box-shadow: 0px 0px 10px 2px;
        }

            .main h3 {
                font-size: 28px;
                text-align: center;
            }

            .main p {
                font-size: 15px;
                margin-bottom: 20px;
            }

            .main form {
                padding: 0px;
            }

        .form-outer {
            margin-bottom: 20px;
        }

            .form-outer label {
                display: block;
                font-size: 20px;
                font-weight: 600;
                padding-bottom: 5px;
            }

            .form-outer input,
            .form-outer select {
                width: 100%;
                height: 30px;
            }

        .main button {
            padding: 10px 0px;
            width: 100px;
            background-color: RGBA(38, 38, 59, 1);
            color: white;
            border: 1px solid;
            border-radius: 10px;
            margin: 0 auto;
        }

        .button-container {
            display: flex;
        }


        #btnSubmit {
            margin-top: 20px;
            display: flex;
            justify-content: space-between;
            padding: 10px 0px;
            width: 100px;
            background-color: RGBA(38, 38, 59, 1);
            color: white;
            border: 1px solid;
            border-radius: 10px;
            margin: 0 auto;
            display: inline-block;
        }

            #btnSubmit:hover {
                background-color: blueviolet;
                transition-duration: 2s;
                transform: scale(1.1);
                transition-duration: 2s;
            }

        #btnBack {
            margin-top: 20px;
            display: flex;
            justify-content: space-between;
            padding: 10px 0px;
            width: 100px;
            background-color: RGBA(38, 38, 59, 1);
            color: white;
            border: 1px solid;
            border-radius: 10px;
            display: inline-block;
            margin: 0 auto;
        }

            #btnBack:hover {
                background-color: blueviolet;
                transition-duration: 2s;
                transform: scale(1.1);
                transition-duration: 2s;
            }

        @media screen and (min-width: 768px) {
            .main {
                flex-basis: 50%;
            }
        }

        @media screen and (min-width: 1024px) {
            .main {
                flex-basis: 30%;
            }
        }
    </style>
</head>
<body>
        <form id="form1" runat="server">
            <div id="Con">
                <div class="main">
                    <h3>Item Entery Gate Pass Register!</h3>
                    <br />
                    <p><b>If You are Not Register ? Register Here</b></p>
                    <asp:Panel ID="pnlForm" runat="server">
                        <div class="form-outer">
                            <label>Name:</label>
                            <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-outer">
                            <label>Contact No:</label>
                            <asp:TextBox ID="txtContact" runat="server" TextMode="Number"></asp:TextBox>
                        </div>
                        <div class="form-outer">
                            <label>Vechile No:</label>
                            <asp:TextBox ID="txtVehicleNo" runat="server" ></asp:TextBox>
                        </div>
                        <div class="form-outer">
                            <label>Date:</label>
                            <asp:TextBox ID="txtDate" runat="server" TextMode="DateTimeLocal"></asp:TextBox>
                        </div>
                        <div class="form-outer">
                            <label>Reason:</label>
                            <asp:DropDownList ID="ddlReason" runat="server">
                                <asp:ListItem Value="Default">Default</asp:ListItem>
                                <asp:ListItem Value="Guest Faculty">Bike Parking</asp:ListItem>
                                <asp:ListItem Value="Parents">Car Parking</asp:ListItem>
                                <asp:ListItem Value="Food">Cycle Parking </asp:ListItem>
                                <asp:ListItem Value="Technician">Scooty Parking</asp:ListItem>
                                <asp:ListItem Value="Technician">Other</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="form-outer">
                            <label>Description:</label>
                            <asp:TextBox ID="txtDescription" runat="server"></asp:TextBox>
                        </div>
                        <div class="button-container">
                            <asp:Button ID="btnBack" runat="server" Text="Back" OnClick="btnBack_Click"/>
                            <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click1"/>

                        </div>
                    </asp:Panel>
                </div>
            </div>
        </form>
</body>
</html>
