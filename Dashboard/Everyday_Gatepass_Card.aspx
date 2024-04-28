<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Everyday_Gatepass_Card.aspx.cs" Inherits="ERP_Login.Dashboard.Everyday_Gatepass_Card" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body {
            background-color: #1abc9c;
            padding-top: 10%;
            height: 100vh;
        }

        .one {
            background-color: #1abc9c;
            text-align: center;
            width: 100%;
            color: white;
            border-top-left-radius: 10px;
            border-top-right-radius: 15px;
        }

        .box {
        }

        input {
            width: 180px;
        }

        label {
            width: 70px;
            display: inline-block;
            margin-top: 10px;
        }

        .container {
            width: 90%;
            max-width: 600px;
            margin: 0 auto;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
            font-size: 20px;
            border: 2px solid black;
            border-radius: 15px;
            padding-bottom: 10px;
            display: flex;
            justify-content: center;
            background-color: #fff;
            align-items: center;
            flex-direction: column;
        }

        .btn {
            background-color: green;
            color: white;
            font-size: 15px;
        }

        #btnPrint {
            height: 35px;
            width: 90px;
            background-color: #10;
            color: white;
            border-radius: 5px;
            margin-top: 40px;
        }

            #btnPrint:hover {
                background-color: #d742f5;
                color: white;
                cursor: pointer;
                transition-duration: 4s;
            }

        #btnQrcode {
            height: 35px;
            width: 90px;
            background-color: green;
            color: white;
            border-radius: 5px;
            margin-top: 40px;
        }

            #btnQrcode:hover {
                background-color: #d742f5;
                color: white;
                cursor: pointer;
                transition-duration: 4s;
            }

        #id {
            margin-top: 10px;
        }

        @media screen and (max-width: 800px) {
            .left, .main, .right {
                width: 100%;
            }
        }

        #qrcode iframe {
            border: none;
        }

        .two {
            font-size: 28px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        #qrcode iframe {
            border: none;
        }

        @media print {
            #btnPrint, #btnQrcode {
                display: none;
            }
        }
    </style>
</head>
<body>
    <center>
        <form id="form1" runat="server">

            <div class="container">
                <div class="one">
                    <h2>Everyday Gatepass Card</h2>
                </div>
                <div class="box">
                    <center>
                        <table id="two">
                            <td>Gate pass No:</td>
                            <td>
                                <asp:Label ID="lblId" Style="padding-left: 50px;" runat="server"></asp:Label>
                            </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>Name :</label></td>
                                <td>
                                    <asp:Label ID="lblName" Style="padding-left: 50px;" runat="server"></asp:Label></td>
                            </tr>
                            <tr>

                                <tr>
                                    <td>
                                        <label>Contact:</label></td>
                                    <td>
                                        <asp:Label ID="lblContact" Style="padding-left: 50px;" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>Date:</label></td>
                                    <td>
                                        <asp:Label ID="lblDate" Style="padding-left: 50px;" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>Reason:</label></td>
                                    <td>
                                        <asp:Label ID="lblReason" Style="padding-left: 50px;" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>Description:</label></td>
                                    <td>
                                        <asp:Label ID="lblDescription" Style="padding-left: 50px;" runat="server"></asp:Label></td>
                                </tr>

                                <th>
                                    <td id="qrcode" runat="server"></td>
                                </th>
                                <tr>
                                    <td colspan="2">
                                        <asp:Button ID="btnQrcode" runat="server" Text="Qr Code" OnClientClick="qrcode(); return false;" />
                                    </td>
                                    <td colspan="2">
                                        <button type="button" id="btnPrint" class="btn btn-primary" onclick="GetPrint()">Print</button>
                                    </td>
                                </tr>
                        </table>
                    </center>
                </div>
            </div>
             <script>
                 function GetPrint() {
                     window.print();
                 }

                 function qrcode() {
                     let id = document.getElementById("lblId");
                     let Id = id.innerText;
                     console.log(Id);
                     let qrCodeUrl = `https://api.qrserver.com/v1/create-qr-code/?data=${Id}&size=200x200`;
                     let qrCodeIframe = `<iframe src="${qrCodeUrl}" height="200" width="200"></iframe>`;
                     document.getElementById('qrcode').innerHTML = qrCodeIframe;
                 }
             </script>
        </form>
    </center>
</body>
</html>

