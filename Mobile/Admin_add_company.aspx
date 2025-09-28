<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_add_company.aspx.cs" Inherits="Mobile.Admin_add_company" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Company</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #abcdef, #5680e9);
            height: 100vh;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        form#form1 {
            background: #ffffffcc;
            border-radius: 16px;
            padding: 40px 50px;
            box-shadow:
                8px 8px 30px #a0a0a0,
                -8px -8px 30px #ffffff;
            width: 350px;
        }
        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0 1rem;
        }
        td:first-child {
            font-weight: bold;
            font-size: 1.1rem;
            color: #333;
            padding-right: 20px;
            vertical-align: middle;
        }
        asp\:TextBox, input[type="text"] {
            padding: 10px 15px;
            border-radius: 15px;
            border: none;
            outline: none;
            box-shadow:
                inset 5px 5px 10px #babecc,
                inset -5px -5px 10px #ffffff;
            font-size: 1rem;
            width: 100%;
            transition: box-shadow 0.3s ease;
        }
        asp\:TextBox:focus, input[type="text"]:focus {
            box-shadow:
                inset 2px 2px 5px #8a9cb8,
                inset -2px -2px 5px #ffffff;
        }
        asp\:Button, button {
            display: block;
            width: 100%;
            padding: 12px;
            margin-top: 1.5rem;
            font-size: 1.1rem;
            font-weight: 600;
            color: #fff;
            background: #5680e9;
            border-radius: 20px;
            border: none;
            cursor: pointer;
            box-shadow:
                5px 5px 15px #4461b2,
                -5px -5px 15px #6897ff;
            transition: background 0.3s ease;
        }
        asp\:Button:hover, button:hover {
            background: #4461b2;
        }
        center {
            display: block;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <center>
                <table>
                    <tr>
                        <td>Addcompany:</td>
                        <td>
                            <asp:TextBox ID="txtcom" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Button ID="Button1" runat="server" Text="Add" OnClick="Button1_Click" Height="24px" Width="140px" />
                        </td>
                    </tr>
                </table>
            </center>
        </div>
    </form>
</body>
</html>
