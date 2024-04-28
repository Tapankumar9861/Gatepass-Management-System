<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Gatepass_Card.aspx.cs" Inherits="ERP_Login.Dashboard.Gatepass_Card" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Visitor's Gatepass</title>
    <style>
        body {
            background-color: #1abc9c;
        }

        .card {
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
            transition: 0.3s;
            width: 50%;
            align-items: center;
            border: 1px solid black;
            border-radius: 20px;
            background-color: #fff;
            height: 590px;
           margin-top:100px;
        }

        h2 {
            padding: 30px;
            background-color: #1abc9c
        }

        .card:hover {
            box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
        }

        .container {
            padding: 2px 16px;
        }

        #btnQrcode {
            height: 30px;
            width: 80px;
            background-color: forestgreen;
            color: white;
            border-radius: 5px;
        }

            #btnQrcode:hover {
                background-color: #d742f5;
                color: white;
                cursor: pointer;
                transition-duration: 4s;
            }

        #btnPrint {
            height: 30px;
            width: 50px;
            background-color: forestgreen;
            color: white;
            border-radius: 5px;
            margin-right: 10px;
        }

            #btnPrint:hover {
                background-color: #d742f5;
                color: white;
                cursor: pointer;
                transition-duration: 4s;
            }

        #qrcode {
            margin-right: 15%;
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
            <div class="card">
                <h2 style="background-color: lightskyblue;">Permanent Gatepass</h2>
                <asp:Image ID="Image1" runat="server" Height="100px" src="download.png" />
                
                <div class="container">
                    <table>

                        <tr>
                            <td>Name:</td>
                            <td>
                                <asp:Label runat="server" ID="lblName"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>Contact:</td>
                            <td>
                                <asp:Label runat="server" ID="lblContact"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>Id:</td>
                            <td>
                                <asp:Label runat="server" ID="lblId"></asp:Label>
                            </td>
                        </tr>

                        <tr>
                            <td>Email:</td>
                            <td>
                                <asp:Label runat="server" ID="lblEmail"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>Date:</td>
                            <td>
                                <asp:Label runat="server" ID="lblDate"></asp:Label>
                            </td>
                        </tr>

                        <tr>
                            <th>
                                <td id="qrcode"></td>
                            </th>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Button ID="btnQrcode" runat="server" Text="Qr Code" OnClientClick="qrcode(); return false;" />
                            </td>
                            <td colspan="2">
                                <button type="button" id="btnPrint" class="btn btn-primary" onclick="GetPrint()">Print</button>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>

        </form>
    </center>
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

