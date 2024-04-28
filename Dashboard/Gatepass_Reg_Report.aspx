<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Gatepass_Reg_Report.aspx.cs" Inherits="ERP_Login.Dashboard.Gatepass_Reg_Report" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body {
            background-color: #927dfc;
            height: 100vh;
        }

        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .card {
            width: 90%;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: white;
            border-radius: 8px;
        }

        .card-header {
            text-align: center;
        }

        .even {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .btn-print {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 15px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 5px;
            display: inline-block;
        }

            .btn-print:hover {
                background-color: #0056b3;
            }

        #btn {
            display: flex;
            position: absolute;
            right: 160px;
        }


        #GridView1 {
            width: 100%;
            margin-top: 30px;
        }

        #txtSearch {
            padding: 8px;
            margin-right: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        #btnSearch {
            background-color: #4CAF50;
            color: white;
            padding: 8px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

            #btnSearch:hover {
                background-color: #45a049;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="card">
                <div class="card-header">
                    <h2>Everyday Gatepass Report</h2>
                    <div class="even">
                        <div>
                            <img src="assets/image/img14.jpg" style="width: 200px;"/>
                        </div>
                        <div>
                            <h3>Ahts</h3>
                            <p>
                                Plot no-1117/3315/4728 ,<br>
                                Makundaprasad, By pass Chow,<br>
                                post office -P.N college ,Pin-752057<br>
                                +91 8847875548 / 9776796852<br>
                                connectahts@gmail.com
                            </p>
                        </div>
                    </div>
                </div>
                <div id="btn">
                    <asp:Button ID="btnPrint" class="btn btn-print" runat="server" Style="margin-right: 20px" Text="Print" OnClick="btnPrint_Click" />
                    <asp:Button ID="btnRefresh" runat="server" class="btn btn-print" Text="Refresh" OnClick="btnRefresh_Click" />
                    <asp:Button ID="btnBack" runat="server" class="btn btn-print" Style="margin-left: 20px" Text="Back" OnClick="btnBack_Click" />
                </div>
                <div>
                    <label for="txtSearch">Search:</label>
                    <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary" OnClick="btnSearch_Click" />
                </div>
                <hr>
                <div>
                    <asp:GridView ID="GridView1" runat="server" DataKeyNames="Id" OnRowDeleting="GridView1_RowDeleting">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ButtonType="Button">
                                <ControlStyle BackColor="#FF3300"></ControlStyle>
                            </asp:CommandField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>

    </form>
</body>
</html>
