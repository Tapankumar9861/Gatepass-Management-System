<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CameraPhoto.aspx.cs" Inherits="ERP_Login.Dashboard.CameraPhoto" %>

<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
    <form id="form1" runat="server" class="box">
        <div id="Con">
            <div class="main">
                <h3>Every Day Register!</h3>
                <br />
                <p><b>If You are Not Register ? Register Here</b></p>
                <asp:Panel ID="pnlForm" runat="server">
                    <div class="form-outer">
                        <label>Name:</label>
                        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-outer">
                        <label>Contact No:</label>
                        <asp:TextBox ID="txtContactNo" runat="server" TextMode="Number"></asp:TextBox>
                    </div>
                    <div class="form-outer">
                        <label>Email:</label>
                        <asp:TextBox ID="txtEmail" runat="server" ></asp:TextBox>
                    </div>
                    <div class="form-outer">
                        <label>Date:</label>
                        <asp:TextBox ID="txtDate" runat="server" TextMode="DateTimeLocal"></asp:TextBox>
                    </div>
                    <div class="form-outer">
                        <label>Photo:</label>
                         <asp:FileUpload ID="FileUpload" runat="server" />
                         <button type="button" id="btnTakePhoto">Take Photo</button> <!-- Button to trigger camera capture -->
                    </div>
                    <div class="button-container">
                        <asp:Button ID="btnBack" runat="server" Text="Back" />
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit"/>
                    </div>
                </asp:Panel>
            </div>
        </div>
    </form>

    <script>
        document.getElementById('btnTakePhoto').addEventListener('click', function() {
            // Check if the browser supports mediaDevices and getUserMedia
            if (navigator.mediaDevices && navigator.mediaDevices.getUserMedia) {
                // Request access to the user's camera
                navigator.mediaDevices.getUserMedia({ video: true })
                .then(function(stream) {
                    // Display the stream from the camera in a video element
                    var video = document.createElement('video');
                    video.setAttribute('id', 'videoElement');
                    video.setAttribute('autoplay', '');
                    video.setAttribute('playsinline', ''); // Required to work on iOS
                    document.body.appendChild(video);
                    video.srcObject = stream;
                    // Add a button to capture the image
                    var captureButton = document.createElement('button');
                    captureButton.innerText = 'Capture';
                    captureButton.addEventListener('click', function() {
                        // Create a canvas element to draw the captured image
                        var canvas = document.createElement('canvas');
                        canvas.setAttribute('id', 'canvasElement');
                        var context = canvas.getContext('2d');
                        // Set the canvas dimensions to match the video stream
                        canvas.width = video.videoWidth;
                        canvas.height = video.videoHeight;
                        // Draw the current frame of the video onto the canvas
                        context.drawImage(video, 0, 0, canvas.width, canvas.height);
                        // Convert the canvas content to a data URL representing a PNG image
                        var dataURL = canvas.toDataURL('image/png');
                        // Set the data URL as the value of the FileUpload control
                        document.getElementById('<%= FileUpload.ClientID %>').value = dataURL;
                        // Remove the video and canvas elements
                        video.remove();
                        canvas.remove();
                    });
                    document.body.appendChild(captureButton);
                })
                .catch(function(error) {
                    console.error('Error accessing the camera: ', error);
                });
            } else {
                alert('Your browser does not support accessing the camera.');
            }
        });
    </script>
</body>
</html>

