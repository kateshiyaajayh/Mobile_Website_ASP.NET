<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="Mobile.AdminLogin" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
    <style>
        body {
            height: 100vh;
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #74ABE2, #5563DE);
            display: flex;
            justify-content: center;
            align-items: center;
        }
        form#form1 {
            background: #ffffffee;
            padding: 40px 50px;
            border-radius: 18px;
            box-shadow:
                8px 8px 24px #a1a1a1,
                -8px -8px 24px #ffffff;
            width: 320px;
            box-sizing: border-box;
        }
        h2 {
            text-align: center;
            color: #2a2a72;
            margin-bottom: 24px;
            font-weight: 700;
        }
        label {
            color: #333;
            font-weight: 600;
            display: block;
            margin-bottom: 6px;
            font-size: 1rem;
        }
        asp\:TextBox, input[type="text"], input[type="password"] {
            width: 100%;
            padding: 12px 15px;
            border-radius: 14px;
            border: none;
            box-shadow:
                inset 5px 5px 10px #b5b8c0,
                inset -5px -5px 10px #ffffff;
            font-size: 1rem;
            outline: none;
            transition: box-shadow 0.3s ease;
            margin-bottom: 20px;
        }
        asp\:TextBox:focus, input[type="text"]:focus, input[type="password"]:focus {
            box-shadow:
                inset 2px 2px 5px #8f94a0,
                inset -2px -2px 5px #ffffff;
        }
        asp\:Button, button {
            width: 100%;
            padding: 12px;
            border-radius: 20px;
            border: none;
            background: #4a57d6;
            color: white;
            font-size: 1.1rem;
            font-weight: 700;
            cursor: pointer;
            box-shadow:
                5px 5px 15px #3b45b1,
                -5px -5px 15px #5c67ee;
            transition: background 0.3s ease;
        }
        asp\:Button:hover, button:hover {
            background: #3b45b1;
        }
        div {
            display: flex;
            flex-direction: column;
        }
      

    </style>
</head>
<body>
    <!-- Must have one server-side form -->
    <form id="form1" runat="server">
        <div>
            <h2>Login</h2>
            <asp:Label ID="lblUsername" runat="server" Text="Username:"></asp:Label>
            <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
            <asp:Label ID="lblPassword" runat="server" Text="Password:"></asp:Label>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
            <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" Width="127px" />
        </div>
    </form>
</body>
</html>
