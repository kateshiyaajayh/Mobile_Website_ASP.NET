<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewReport.aspx.cs" Inherits="Mobile.ViewReport" %>
<%@ Register Assembly="CrystalDecisions.Web" Namespace="CrystalDecisions.Web" TagPrefix="cr" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Checkout, Order & Payment Report</title>
    <style>
        body {
            font-family: Arial;
            background-color: #f5f5f5;
        }
        .container {
            width: 95%;
            margin: 20px auto;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            padding: 20px;
        }
        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Checkout + Order Details + Payment Report</h2>

            <!-- Crystal Report Viewer -->
            <cr:CrystalReportViewer 
                ID="crViewer" 
                runat="server" 
                AutoDataBind="true"
                ToolPanelView="None"
                DisplayGroupTree="False"
                EnableDatabaseLogonPrompt="False"
                Width="100%"
                Height="900px"
                BorderStyle="Solid"
                BorderColor="#ccc"
                BorderWidth="1px" />
        </div>
    </form>
</body>
</html>
