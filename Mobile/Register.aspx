<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Mobile.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
    <style>
      /* Reset */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: "Poppins", sans-serif;
}

/* Gradient Background with Floating Animation */
body {
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    background: linear-gradient(135deg, #1f1c2c, #928DAB);
    background-size: 300% 300%;
    animation: bgMove 10s ease infinite;
}

@keyframes bgMove {
    0% { background-position: 0% 50%; }
    50% { background-position: 100% 50%; }
    100% { background-position: 0% 50%; }
}

/* Register Card */
.form-container {
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

@keyframes fadeSlide {
    from { opacity: 0; transform: translateY(-20px); }
    to { opacity: 1; transform: translateY(0); }
}

/* Heading */
.form-container h2 {
    text-align: center;
    margin-bottom: 1.5rem;
    font-size: 2rem;
    font-weight: 600;
    color: #ffde59;
    text-shadow: 0 2px 8px rgba(0,0,0,0.6);
}

/* Input fields */
.input-field {
    margin-bottom: 1.2rem;
    display: flex;
    flex-direction: column;
}

.input-field label {
    margin-bottom: 0.4rem;
    font-size: 0.9rem;
    color: #f1f1f1;
}

.input-field input {
    padding: 0.7rem;
    border: 1px solid rgba(255,255,255,0.4);
    border-radius: 10px;
    outline: none;
    background: rgba(0, 0, 0, 0.3);
    color: #fff;
    font-size: 1rem;
    transition: 0.3s ease;
}

.input-field input:focus {
    border-color: #ffde59;
    box-shadow: 0 0 8px #ffde59;
}

/* Register button */
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

/* Login link */
#lnkLogin {
    display: inline-block;
    margin-top: 0.8rem;
    font-size: 0.9rem;
    color: #ffde59;
    text-decoration: none;
    transition: color 0.3s ease;
}

#lnkLogin:hover {
    color: #fff;
}

    </style>
<body>
    <form id="form1" runat="server">
        
             <div class="form-container">
            <h2>Register</h2>

            <div class="input-field">
                <label for="txtName">Full Name</label>
                <asp:TextBox ID="txtName" runat="server" placeholder="Enter your name"></asp:TextBox>
            </div>

            <div class="input-field">
                <label for="txtEmail">Email</label>
                <asp:TextBox ID="txtEmail" runat="server" placeholder="Enter email"></asp:TextBox>
            </div>

            <div class="input-field">
                <label for="txtMobile">Mobile</label>
                <asp:TextBox ID="txtMobile" runat="server" placeholder="Enter mobile number"></asp:TextBox>
            </div>

            <div class="input-field">
                <label for="txtPassword">Password</label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Enter password"></asp:TextBox>
            </div>

            <div class="input-field">
                <label for="txtConfirm">Confirm Password</label>
                <asp:TextBox ID="txtConfirm" runat="server" TextMode="Password" placeholder="Re-enter password"></asp:TextBox>
                <asp:HyperLink ID="lnkLogin" runat="server" NavigateUrl="Login.aspx">Login</asp:HyperLink>

            </div>
                 
            <asp:Button ID="btnRegister" runat="server" CssClass="btn" Text="Register" OnClick="btnRegister_Click" />
        </div>
    </form>
</body>
</html>
