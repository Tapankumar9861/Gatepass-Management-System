<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Dashboard_Gatepass_MS.aspx.cs" Inherits="ERP_Login.Dashboard.Dashboard_Gatepass_MS" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard Design</title>
    <link href="assets/style2.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    <style>
        
    </style>
</head>
<body>
    <div class="sidebar">
        <div class="logo">
            <ul class="menu">
                <li class="active">
                    <a href="#">
                        <i class="fas fa-tachometer-alt"></i>
                        <span>Dashboard</span>
                    </a>
                </li>
                <li>
                    <a href="../index.html">
                        <img src="assets/image/home.png" style="height: 20px; width: 20px" />
                        <span>Home</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a class="sidebar-link has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false" onclick="toggleSubMenu('submenu1')">
                        <img src="assets/image/press-pass.png" style="height: 23px; width: 23px" />
                        <span class="hide-menu">Permanent Pass</span>
                        <i class="fa fa-angle-right" aria-hidden="true"></i>
                    </a>
                    <ul class="submenu" id="submenu1" style="display: none;">
                        <li><a href="Gatepass_Reg.aspx">Registration</a></li>
                        <li><a href="Gatepass_Card.aspx">Card Print</a></li>
                        <li><a href="Gatepass_Reg_GridView.aspx">GridView</a></li>
                        <li><a href="Gatepass_Reg_Report.aspx">Report</a></li>
                    </ul>
                </li>
                <li class="sidebar-item">
                    <a class="sidebar-link has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false" onclick="toggleSubMenu('submenu3')">
                        <img src="assets/image/press-card.png" style="height: 23px; width: 23px" />
                        <span class="hide-menu">Everyday Gatepass</span>
                        <i class="fa fa-angle-right" aria-hidden="true"></i>
                    </a>
                    <ul class="submenu" id="submenu3" style="display: none;">
                        <li><a href="Everyday_Gatepass.aspx">Registration</a></li>
                        <li><a href="Everyday_Gatepass_Card.aspx">Card Print</a></li>
                        <li><a href="Everyday_Gatepass_GridView.aspx">GridView</a></li>
                        <li><a href="Everyday_Gatepass_Report.aspx">Report</a></li>
                    </ul>
                </li>
                <li class="sidebar-item">
                    <a class="sidebar-link has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false" onclick="toggleSubMenu('submenu2')">
                        <img src="assets/image/id-card.png" style="height: 25px; width: 25px" />
                        <span class="hide-menu">Item Gatepass</span>
                        <i class="fa fa-angle-right" aria-hidden="true"></i>
                    </a>
                    <ul class="submenu" id="submenu2" style="display: none;">
                        <li><a href="Gatepass_Item.aspx">Registration</a></li>
                        <li><a href="Gatepass_Item_Card.aspx">Card Print</a></li>
                        <li><a href="Gatepass_Item_GridView.aspx">GridView</a></li>
                        <li><a href="Gatepass_Item_Report.aspx">Report</a></li>
                    </ul>
                </li>



                <li>
                    <a href="Qrcode_Reader.aspx">
                        <img src="assets/image/loupe.png" style="height: 25px; width: 25px" />
                        <span>Qr Code Scanner</span>
                    </a>
                </li>



                <li>
                    <a href="#">
                        <img src="assets/image/settings.png" style="height: 20px; width: 20px" />
                        <span>Settings</span>
                    </a>
                </li>
                <li>
                    <a href="../index.html">
                        <i class="fas fa-sign-out-alt"></i>
                        <span>Logout</span>
                    </a>
                </li>
            </ul>
        </div>
    </div>

    <div class="main--content">
        <div class="header--wrapper">
            <div class="header--title">
                <span>Gatepass</span>
                <h2>Dashboard</h2>
            </div>
            <div class="user--info">
                <div class="search--box">
                    <i class="fa-solid fa-search"></i>
                    <input type="text" placeholder="search" />
                </div>
            </div>
        </div>
        <div class="card-container">
            <div class="card--wrapper">
                <a href="Gatepass_Reg.aspx" style="text-decoration: none">
                <div class="payment--card light-red ">
                    <div class="card--header">
                        <div class="amount">                            
                                <span class="title">Permanent Pass</span>                            
                        </div>
                        <img src="assets/image/press-pass.png" style="height: 50px; width: 50px" />
                    </div>
                </div>
            </a>

                <a href="Everyday_Gatepass.aspx" style="text-decoration: none">
                    <div class="payment--card light-purple">
                        <div class="card--header">
                            <div class="amount">
                                <span class="title">Everyday Pass</span>
                            </div>
                            <img src="assets/image/press-card.png" style="height: 50px; width: 50px" />
                        </div>
                    </div>
                </a>

                <a href="Gatepass_Item.aspx" style="text-decoration: none">
                    <div class="payment--card light-green">
                        <div class="card--header">
                            <div class="amount">
                                <span class="title">Item Pass</span>
                            </div>
                            <img src="assets/image/id-card.png" style="height: 50px; width: 50px" />
                        </div>
                    </div>
                </a>
            </div>
        </div>

    </div>

    <script>
        function toggleSubMenu(submenuId) {
            var submenus = document.querySelectorAll('.submenu');
            submenus.forEach(function (submenu) {
                if (submenu.id !== submenuId) {
                    submenu.style.display = 'none';
                }
            });

            var submenu = document.getElementById(submenuId);
            if (submenu.style.display === 'none' || submenu.style.display === '') {
                submenu.style.display = 'block';
            } else {
                submenu.style.display = 'none';
            }
        }


    </script>
</body>
</html>

