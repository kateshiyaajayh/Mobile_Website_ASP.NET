<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Mobile.WebForm2" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <style>
        * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: "Poppins", sans-serif;
}

        /* Background: soft gradient with blur */
        body {
             height: 100vh;
 display: flex;
 justify-content: center;
 align-items: center;
 background: linear-gradient(135deg, #1f1c2c, #928DAB);
 background-size: 300% 300%;
 animation: bgMove 10s ease infinite;
             }

        /* Glassmorphic card */
        .login-card {
            background: rgba(255, 255, 255, 0.1);
  border: 2px solid rgba(255, 255, 255, 0.2);
  padding: 2rem;
  border-radius: 16px;
  width: 360px;
  color: #fff;
  backdrop-filter: blur(12px);
  box-shadow: 0 6px 25px rgba(0, 0, 0, 0.5);
  animation: fadeSlide 1s ease-in-out;
        }

        .login-card h2 {
             text-align: center;
  margin-bottom: 1.5rem;
  font-size: 2rem;
  font-weight: 600;
  color: #ffde59;
  text-shadow: 0 2px 8px rgba(0,0,0,0.6);
        }

        /* Input fields */
        .input-field {
            margin-bottom: 15px;
            text-align: left;
        }

        .input-field label {
            font-size: 0.9rem;
            font-weight: 500;
            color: #eee;
        }

        .input-field input,
        asp\:TextBox {
            width: 100%;
            padding: 12px;
            border-radius: 12px;
            border: none;
            outline: none;
            margin-top: 6px;
            font-size: 1rem;
            background: rgba(255, 255, 255, 0.2);
            color: #fff;
        }

        .input-field input:focus {
            background: rgba(255, 255, 255, 0.3);
            box-shadow: 0 0 8px rgba(255, 255, 255, 0.4);
        }

        /* Buttons */
        .btn {
               width: 100%;
    padding: 0.85rem;
    border: none;
    border-radius: 12px;
    background: linear-gradient(135deg, #ff512f, #f09819);
    color: #fff;
    font-size: 1rem;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s ease;
}

        .btn:hover {
            background: linear-gradient(135deg, #f09819, #ff512f);
 transform: translateY(-2px);
 box-shadow: 0 6px 20px rgba(0,0,0,0.4);
        }

        .register-link {
            display: inline-block;
 margin-top: 0.8rem;
 font-size: 0.9rem;
 color: #ffde59;
 text-decoration: none;
 transition: color 0.3s ease;
        }

        .register-link:hover {
            text-decoration: underline;
        }

        .error-label {
            color: #ff4d4d;
            font-size: 0.9rem;
            margin-top: 10px;
            display: block;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-card">
            <h2>Login</h2>

            <div class="input-field">
                <label>Email</label>
                <asp:TextBox ID="txtEmail" runat="server" />
            </div>

            <div class="input-field">
                <label>Password</label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" />
            </div>

            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn" OnClick="btnLogin_Click" />

            <asp:HyperLink ID="lnkLogin" runat="server" NavigateUrl="Register.aspx" CssClass="register-link">
                New user? Register here
            </asp:HyperLink>

            <asp:Label ID="lblMsg" runat="server" CssClass="error-label"></asp:Label>
        </div>
    </form>
</body>
</html>
