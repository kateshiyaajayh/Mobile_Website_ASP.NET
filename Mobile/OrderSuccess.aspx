<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderSuccess.aspx.cs" Inherits="Mobile.OrderSuccess" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Order Success - Mobile Junction</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: #f5f5f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .success-container {
            background: white;
            padding: 50px;
            border-radius: 15px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
            text-align: center;
        }
        .success-container h1 {
            color: #28a745;
            font-size: 3rem;
            margin-bottom: 20px;
        }
        .success-container p {
            font-size: 1.2rem;
            margin-bottom: 30px;
        }
        .success-container a {
            text-decoration: none;
            color: white;
            background: #3a86ff;
            padding: 12px 25px;
            border-radius: 50px;
            font-weight: 500;
            transition: 0.3s;
        }
        .success-container a:hover {
            background: #8338ec;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="success-container">
            <h1>Order Placed!</h1>
            <p>Thank you for shopping with Mobile Junction. Your order has been successfully placed.</p>
            <a href="home.aspx">Go to Home</a>
        </div>
    </form>
</body>
</html>