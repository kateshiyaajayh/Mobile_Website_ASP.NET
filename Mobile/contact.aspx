<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="Mobile.contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content5" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Mobile Junction - Header & Footer</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Poppins', sans-serif;
            }

            :root {
                --primary: #3a86ff;
                --secondary: #ff006e;
                --accent: #8338ec;
                --light: #f8f9fa;
                --dark: #212529;
                --success: #28a745;
                --warning: #ffc107;
                --gray: #6c757d;
                --light-gray: #e9ecef;
            }

            body {
                background-color: #f5f7fb;
                color: var(--dark);
                min-height: 100vh;
                display: flex;
                flex-direction: column;
            }

            /* Header Styles */
            header {
                background: linear-gradient(135deg, var(--primary), var(--accent));
                color: white;
                padding: 15px 5%;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
                position: sticky;
                top: 0;
                z-index: 1000;
            }

            .nav-container {
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .logo {
                display: flex;
                align-items: center;
                font-size: 24px;
                font-weight: 700;
                margin-right: 30px;
            }

                .logo i {
                    margin-right: 10px;
                    color: var(--warning);
                }

            .nav-main {
                display: flex;
                align-items: center;
                flex: 1;
            }

            .nav-links {
                display: flex;
                list-style: none;
                gap: 25px;
                margin-right: auto;
            }

                .nav-links li a {
                    color: white;
                    text-decoration: none;
                    font-weight: 500;
                    transition: all 0.3s ease;
                    display: flex;
                    align-items: center;
                    gap: 5px;
                }

                    .nav-links li a:hover {
                        color: var(--warning);
                    }

            .nav-right {
                display: flex;
                align-items: center;
                gap: 20px;
            }

            .search-bar {
                display: flex;
                background: rgba(255, 255, 255, 0.2);
                border-radius: 50px;
                padding: 8px 15px;
                align-items: center;
            }

                .search-bar input {
                    background: transparent;
                    border: none;
                    color: white;
                    width: 180px;
                    outline: none;
                    padding: 0 10px;
                }

                    .search-bar input::placeholder {
                        color: rgba(255, 255, 255, 0.7);
                    }

            .auth-buttons {
                display: flex;
                gap: 10px;
            }

            .btn {
                padding: 8px 16px;
                border-radius: 50px;
                border: none;
                cursor: pointer;
                font-weight: 500;
                transition: all 0.3s ease;
            }

            .btn-login {
                background: white;
                color: var(--primary);
            }

            .btn-register {
                background: var(--secondary);
                color: white;
            }

            .btn:hover {
                transform: translateY(-2px);
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            }

            .cart-icon {
                position: relative;
                color: white;
                font-size: 20px;
                cursor: pointer;
            }

            .cart-count {
                position: absolute;
                top: -8px;
                right: -8px;
                background: var(--secondary);
                color: white;
                font-size: 12px;
                width: 18px;
                height: 18px;
                border-radius: 50%;
                display: flex;
                justify-content: center;
                align-items: center;
            }

            /* Main Content */
            main {
                flex: 1;
                padding: 30px 5%;
                text-align: center;
            }

            .content-placeholder {
                max-width: 800px;
                margin: 0 auto;
                background: white;
                padding: 40px;
                border-radius: 15px;
                box-shadow: 0 5px 20px rgba(0, 0, 0, 0.05);
            }

                .content-placeholder h1 {
                    color: var(--primary);
                    margin-bottom: 20px;
                    font-size: 2.5rem;
                }

                .content-placeholder p {
                    color: var(--gray);
                    line-height: 1.6;
                    margin-bottom: 25px;
                    font-size: 1.1rem;
                }

            /* Footer */
            footer {
                background: var(--dark);
                color: white;
                padding: 50px 5% 20px;
            }

            .footer-content {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
                gap: 30px;
                margin-bottom: 40px;
            }

            .footer-column h3 {
                font-size: 1.3rem;
                margin-bottom: 20px;
                color: var(--warning);
            }

            .footer-column p, .footer-column a {
                color: var(--light-gray);
                margin-bottom: 12px;
                display: block;
                text-decoration: none;
                transition: color 0.3s ease;
            }

                .footer-column a:hover {
                    color: var(--warning);
                }

            .social-icons {
                display: flex;
                gap: 15px;
                margin-top: 15px;
            }

                .social-icons a {
                    display: inline-flex;
                    align-items: center;
                    justify-content: center;
                    width: 40px;
                    height: 40px;
                    background: rgba(255, 255, 255, 0.1);
                    border-radius: 50%;
                    transition: all 0.3s ease;
                }

                    .social-icons a:hover {
                        background: var(--primary);
                        transform: translateY(-3px);
                    }

            .newsletter input {
                width: 100%;
                padding: 12px 15px;
                border-radius: 50px;
                border: none;
                margin-bottom: 10px;
                background: rgba(255, 255, 255, 0.1);
                color: white;
            }

            .btn-subscribe {
                background: var(--primary);
                color: white;
                width: 100%;
                padding: 12px;
                border-radius: 50px;
                border: none;
                cursor: pointer;
                font-weight: 500;
                transition: all 0.3s ease;
            }

                .btn-subscribe:hover {
                    background: var(--accent);
                }

            .footer-bottom {
                text-align: center;
                padding-top: 20px;
                border-top: 1px solid rgba(255, 255, 255, 0.1);
            }

            /* Responsive Design */
            @media (max-width: 992px) {
                .nav-container {
                    flex-direction: column;
                    gap: 15px;
                }

                .nav-main {
                    width: 100%;
                    justify-content: space-between;
                }

                .nav-links {
                    margin-right: 20px;
                }

                .search-bar input {
                    width: 150px;
                }
            }

            @media (max-width: 768px) {
                .nav-main {
                    flex-wrap: wrap;
                }

                .nav-links {
                    order: 3;
                    margin-top: 15px;
                    width: 100%;
                    justify-content: center;
                }
            }

            @media (max-width: 576px) {
                .nav-right {
                    flex-wrap: wrap;
                    justify-content: center;
                    gap: 10px;
                }

                .search-bar {
                    order: 2;
                    width: 100%;
                    margin-top: 10px;
                }

                    .search-bar input {
                        width: 100%;
                    }

                .auth-buttons {
                    order: 1;
                }

                .footer-content {
                    grid-template-columns: 1fr;
                    text-align: center;
                }

                .social-icons {
                    justify-content: center;
                }
            }

            /* Mobile Menu */
            .mobile-menu-btn {
                display: none;
                background: none;
                border: none;
                color: white;
                font-size: 24px;
                cursor: pointer;
            }

            @media (max-width: 768px) {
                .mobile-menu-btn {
                    display: block;
                }

                .nav-links {
                    display: none;
                    flex-direction: column;
                    width: 100%;
                    text-align: center;
                    gap: 15px;
                    padding: 15px 0;
                }

                    .nav-links.active {
                        display: flex;
                    }
            }
        </style>
    </head>
</asp:Content>
<asp:Content ID="Content6" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <body>
        <!-- Header -->
        <header>
            <div class="nav-container">
                <div class="nav-main">
                    <div class="logo">
                        <i class="fas fa-mobile-alt"></i><span>Mobile Junction</span>
                    </div>
                    <button class="mobile-menu-btn">
                        <i class="fas fa-bars"></i>
                    </button>
                    <ul class="nav-links">
                        <li><a href="home.aspx"><i class="fas fa-home"></i>Home</a></li>
                        <li><a href="about.aspx"><i class="fas fa-info-circle"></i>About</a></li>
                        <li><a href="shop.aspx"><i class="fas fa-store"></i>Shop</a></li>
                        <li><a href="cart.aspx"><i class="fas fa-shopping-cart"></i>Cart</a></li>
                        <li><a href="contact.aspx"><i class="fas fa-phone"></i>Contact</a></li>
                    </ul>
                </div>
                <div class="nav-right">
                    <div class="search-bar">
                        <i class="fas fa-search"></i>
                        <input type="text" placeholder="Search products...">
                    </div>
                    <div class="auth-buttons">
                        <a href="login.aspx" class="btn btn-register">Login</a> <a href="Register.aspx" class="btn btn-register">Register</a>
                    </div>
                    <div class="cart-icon">
                        <a href="cart.html"><i class="fas fa-shopping-cart"></i><span class="cart-count">3</span> </a>
                    </div>
                </div>
        </header>

       <asp:GridView ID="gvCart" runat="server" AutoGenerateColumns="False" OnRowUpdating="gvCart_RowUpdating" OnRowDeleting="gvCart_RowDeleting" OnSelectedIndexChanged="gvCart_SelectedIndexChanged">
    <Columns>
        <asp:BoundField DataField="Brand" HeaderText="Brand" ReadOnly="True" />
        <asp:BoundField DataField="ModelName" HeaderText="Model" ReadOnly="True" />
        <asp:BoundField DataField="Price" HeaderText="Price" ReadOnly="True" DataFormatString="{0:C}" />
        <asp:TemplateField HeaderText="Quantity">
            <ItemTemplate>
                <asp:TextBox ID="txtQty" runat="server" Text='<%# Bind("Quantity") %>' />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
    </Columns>
</asp:GridView>

<asp:Label ID="lblTotal" runat="server" Text=""></asp:Label>

        <br />
        <br />
        <br />
        <!-- Main Content -->
        <div id="form1">
            <div class="form-container">
                <h2>Contact Us</h2>

                <div class="input-field">
                    <label for="txtName">Full Name</label>
                    <asp:TextBox ID="txtName" runat="server" placeholder="Enter your name"></asp:TextBox>
                </div>

                <div class="input-field">
                    <label for="txtEmail">Email</label>
                    <asp:TextBox ID="txtEmail" runat="server" placeholder="Enter your email"></asp:TextBox>
                </div>

                <div class="input-field">
                    <label for="txtSubject">Subject</label>
                    <asp:TextBox ID="txtSubject" runat="server" placeholder="Enter subject"></asp:TextBox>
                </div>

                <div class="input-field">
                    <label for="txtMessage">Message</label>
                    <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Rows="4" placeholder="Write your message"></asp:TextBox>
                </div>

                <asp:Button ID="btnSubmit" runat="server" CssClass="btn" Text="Send Message" OnClick="btnSubmit_Click" />
                <br />
                <br />
                <asp:Label ID="lblMessage" runat="server" ForeColor="Green"></asp:Label>
            </div>
        </div>
        <style>
           
            .form-container {
                max-width: 450px;
                margin: auto;
                background: #fff;
                padding: 20px;
                border-radius: 12px;
                box-shadow: 0 2px 8px rgba(0,0,0,0.2);
            }

            h2 {
                text-align: center;
                margin-bottom: 20px;
            }

            .input-field {
                margin-bottom: 15px;
            }

                .input-field label {
                    display: block;
                    margin-bottom: 5px;
                    font-weight: bold;
                }

                .input-field input, .input-field textarea {
                    width: 100%;
                    padding: 10px;
                    border: 1px solid #ddd;
                    border-radius: 8px;
                    font-size: 14px;
                }

            textarea {
                resize: none;
            }

            .btn {
                width: 100%;
                padding: 12px;
                background: blue;
                color: #fff;
                font-size: 16px;
                border: none;
                border-radius: 8px;
                cursor: pointer;
            }

                .btn:hover {
                    background: #218838;
                }
        </style>
   
        <br />
        <br />
        <br />
</asp:Content>
<asp:Content ID="Content7" runat="server" ContentPlaceHolderID="ContentPlaceHolder3">
    <!-- Footer -->
    <footer>
        <div class="footer-content">
            <div class="footer-column">
                <h3>Mobile Junction</h3>
                <p>
                    Your one-stop destination for the latest smartphones and accessories at the best prices.
                </p>
                <div class="social-icons">
                    <a href="#"><i class="fab fa-facebook-f"></i></a><a href="#"><i class="fab fa-twitter"></i></a><a href="#"><i class="fab fa-instagram"></i></a><a href="#"><i class="fab fa-linkedin-in"></i></a>
                </div>
            </div>
            <div class="footer-column">
                <h3>Quick Links</h3>
                <a href="#">Home</a> <a href="#">About Us</a> <a href="#">Shop</a> <a href="#">Offers</a> <a href="#">Contact</a>
            </div>
            <div class="footer-column">
                <h3>Customer Service</h3>
                <a href="#">FAQ</a> <a href="#">Returns & Refunds</a> <a href="#">Shipping Policy</a> <a href="#">Privacy Policy</a> <a href="#">Terms & Conditions</a>
            </div>
            <div class="footer-column">
                <h3>Newsletter</h3>
                <p>
                    Subscribe to our newsletter for updates on new products and exclusive offers.
                </p>
                <div class="newsletter">
                    <input type="email" placeholder="Your email address">
                    <button class="btn-subscribe">
                        Subscribe
                    </button>
                </div>
            </div>
        </div>
        <div class="footer-bottom">
            <p>
                &copy; 2023 Mobile Junction. All rights reserved.
            </p>
        </div>
    </footer>

    <script>
        // Mobile menu functionality
        const mobileMenuBtn = document.querySelector('.mobile-menu-btn');
        const navLinks = document.querySelector('.nav-links');

        mobileMenuBtn.addEventListener('click', () => {
            navLinks.classList.toggle('active');

            if (navLinks.classList.contains('active')) {
                mobileMenuBtn.innerHTML = '<i class="fas fa-times"></i>';
            } else {
                mobileMenuBtn.innerHTML = '<i class="fas fa-bars"></i>';
            }
        });

        // Add to cart animation
        const cartIcon = document.querySelector('.cart-icon');
        const cartCount = document.querySelector('.cart-count');
        let count = 3;

        cartIcon.addEventListener('click', () => {
            count++;
            cartCount.textContent = count;

            // Animation effect
            cartIcon.classList.add('animate');
            setTimeout(() => {
                cartIcon.classList.remove('animate');
            }, 500);
        });

        // Add animation class to CSS
        const style = document.createElement('style');
        style.textContent = `
            .cart-icon.animate {
                animation: bounce 0.5s;
            }
            
            @keyframes bounce {
                0%, 100% { transform: scale(1); }
                50% { transform: scale(1.2); }
            }
        `;
        document.head.appendChild(style);
    </script>
</asp:Content>

