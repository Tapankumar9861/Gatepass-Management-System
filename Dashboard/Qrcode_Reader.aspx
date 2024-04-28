<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Qrcode_Reader.aspx.cs" Inherits="ERP_Login.Dashboard.Qrcode_Reader" %>



<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>QR Code Scanner</title>

    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
            background-color: #0cfad6;
        }

        .container {
            width: 100%;
            max-width: 600px;
        }

        .box {
            width: 100%;
            padding: 20px;
            background-color: #fafafa;
            border: 2px solid #333;
            border-radius: 10px;
            box-shadow: 0 4px 8px 0 rgba(2, 2, 1, 0.5);
            margin-top: 10px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        #scanner-container {
            position: relative;
            width: 100%;
            height: 0;
            padding-top: 100%;
            display: none;
        }

        #scanner {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
        }

        #qr-result {
            margin-left: 50px;
        }

        .buttons {
            width: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
            
        }

        .btn {
            margin-bottom: 10px;
        }

        .btn-group {
            margin-bottom: 10px;
        }

        .form-control {
            width: 100%;
        }


        #one {
            display: inline-block;
            margin-right: 10px;
        }

        #btnRefresh {
            margin-right: 5px;
        }

        .date {
            margin-bottom: 50px;
        }

        .radio-wrapper {
            display: flex;
            flex-direction: row;
            font-size:20px;
            justify-content:space-evenly;
            margin-top:15px;
            
        }

        input[type="radio"] {
            
            margin-right: 10px;
        }
        #one
        {
            display:flex;
            flex-direction:row;
        }
    </style>
</head>
<body>

    <form id="form1" runat="server">
        <div class="date">
        </div>
        <div class="container">
            <span id="basic-addon1">Date:</span>
            <asp:Label runat="server" ID="digitalClocklbl" aria-describedby="basic-addon1"></asp:Label>
            <div class="box">
                <div id="scanner-container">
                    <video id="scanner" width="400" height="400" runat="server"></video>
                    <div id="qr-result" ></div>
                    <img id="success-image" src="tick.png" alt="Success" style="display: none;" />
                </div>
            </div>
            <div class="radio-wrapper">
                <p><asp:RadioButton ID="RadioButton1" Text="IN"  GroupName="Pass" runat="server" Checked="true"  /></p>
                <p><asp:RadioButton ID="RadioButton2" Text="OUT"  GroupName="Pass" runat="server" /></p>
            </div>
            <div class="buttons">
                <div class="btn-group" role="group" aria-label="Camera Controls" style="margin-left: 5px;">
                    <asp:Button ID="btnOpenCamera" runat="server" CssClass="btn btn-primary" Text="Open Camera" OnClientClick="openCameraScanner(); return false;" />
                    <asp:Button ID="btnStopCamera" runat="server" CssClass="btn btn-danger" Text="Stop Camera" OnClientClick="stopCamera(); return false;" />
                </div>
                <asp:Button ID="btnUploadQR" runat="server" CssClass="btn btn-primary" Text="Upload QR Code" OnClientClick="openFileScanner(); return false;" />
                <div id="one">
                    <asp:Button ID="btnRefresh" runat="server" CssClass="btn btn-secondary" Text="Refresh" OnClientClick="refresh(); return false;" OnClick="btnRefresh_Click" />
                    <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary" Text="Save" OnClick="btnSave_Click" />
                </div>
                <br />
                <asp:TextBox ID="txtResult" runat="server" CssClass="form-control" placeholder="QR Code Data"></asp:TextBox>
                <br />
            </div>
        </div>
    </form>
    <script>
        let scanner = null;

        function openCameraScanner() {
            document.getElementById('scanner-container').style.display = 'block';
            scanner = new Instascan.Scanner({ video: document.getElementById('scanner') });
            scanner.addListener('scan', function (content) {
                document.getElementById('qr-result').innerText = content;
                document.getElementById('<%= txtResult.ClientID %>').value = content;
                scanner.stop();
            });
            Instascan.Camera.getCameras().then(function (cameras) {
                if (cameras.length > 0) {
                    scanner.start(cameras[0]);
                } else {
                    console.error('No cameras found.');
                }
            }).catch(function (e) {
                console.error(e);
            });
        }

        function openFileScanner() {
            document.getElementById('file-input').click();
        }

        function handleFile(event) {
            const file = event.target.files[0];
            const reader = new FileReader();
            reader.onload = function (event) {
                const img = new Image();
                img.src = event.target.result;
                img.onload = function () {
                    const canvas = document.createElement('canvas');
                    const context = canvas.getContext('2d');
                    canvas.width = img.width;
                    canvas.height = img.height;
                    context.drawImage(img, 0, 0);
                    const imageData = context.getImageData(0, 0, canvas.width, canvas.height);
                    const code = jsQR(imageData.data, imageData.width, imageData.height);
                    if (code) {
                        document.getElementById('qr-result').innerText = code.data;
                        document.getElementById('<%= txtResult.ClientID %>').value = code.data;
            } else {
                alert('No QR code found.');
            }
        };
    };
    reader.readAsDataURL(file);
}


        function stopCamera() {
            if (scanner) {
                scanner.stop();
                document.getElementById('scanner-container').style.display = 'none';
            }
        }
    </script>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://rawgit.com/schmich/instascan-builds/master/instascan.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jsqr"></script>
    <script>
        function updateDigitalClock() {
            var now = new Date();
            var currentDate = now.toLocaleDateString('en-US');


            var hours = now.getHours().toString().padStart(2, '0');
            var minutes = now.getMinutes().toString().padStart(2, '0');
            var seconds = now.getSeconds().toString().padStart(2, '0');

            var digitalClock = document.getElementById('digitalClocklbl');
            digitalClock.textContent = currentDate + ' ' + hours + ':' + minutes + ':' + seconds;
            setTimeout(updateDigitalClock, 1000);
        }
        updateDigitalClock();

    </script>
</body>
</html>
