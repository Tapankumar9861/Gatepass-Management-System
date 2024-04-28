<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Gatepass_Item_Card.aspx.cs" Inherits="ERP_Login.Dashboard.Gatepass_Item_Card" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
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
            align-items: center;
            flex-direction: column;
        }

        #demo {
            text-align: center;
        }

        .one {
            background-color: palevioletred;
            text-align: center;
            width: 100%;
            border-top-left-radius: 15px;
            border-top-right-radius: 15px;
        }

        .box {
            padding: 2px 16px;
            width: 100%;
        }

        #lblTax {
            padding-left: 30px;
        }

        #btnPrint:hover, #btnQrcode:hover {
            background-color: #d742f5;
            color: white;
            cursor: pointer;
            transition-duration: 0.4s;
            transform: scale(1.1);
        }

        #btnPrint, #btnQrcode {
            height: 35px;
            width: 90px;
            background-color: coral;
            color: white;
            border-radius: 5px;
            margin-top: 15px;
        }

        .btn {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .two {
            font-size: 28px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        iframe {
            max-width: 100%;
        }

        @media screen and (max-width: 768px) {

            .container {
                width: 100%;
                border-radius: 0;
                border: none;
            }

            #btnPrint, #btnQrcode {
                width: 100%;
                margin-top: 10px;
            }
        }

        #qrcode {
            display: flex;
            justify-content: center;
            align-content: center;
            margin-right: 80px;
        }

            #qrcode iframe {
                border: none;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="one">
                <h2>Register Item</h2>
            </div>
            <div class="box">
                <p id="demo">
                    <table class="two">
                        <tr>
                            <td><b>Name:</b></td>
                            <td>
                                <asp:Label Style="" ID="lblName" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td><b>Id:</b></td>
                            <td>
                                <asp:Label Style="" ID="lblId" runat="server"></asp:Label></td>
                        </tr>

                        <tr>
                            <td><b>Vehicle No:</b></td>
                            <td>
                                <asp:Label ID="lblVehicle" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td><b>Contact:</b></td>
                            <td>
                                <asp:Label ID="lblContact" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td><b>Date:</b></td>
                            <td>
                                <asp:Label ID="lblDate" runat="server"></asp:Label></td>
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
                </p>

            </div>
        </div>
    </form>

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

</body>
</html>
