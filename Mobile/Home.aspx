﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Mobile.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content5" runat="server" contentplaceholderid="ContentPlaceHolder1">
                <!DOCTYPE html>
                <html>
                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0"><title>Mobile Junction - Header & Footer</title>
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
                           
                            color: var(--dark);
                            min-height: 100vh;
                            display: flex;
                            flex-direction: column;
                            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;

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
<asp:Content ID="Content7" runat="server" contentplaceholderid="ContentPlaceHolder3">

   <style>
   
  
    .btn-main {
        background:RGB (128, 128, 128); color:black;
        padding: 12px 20px; border-radius: 8px;
        text-decoration: none; font-weight: bold;
        transition: all 0.3s ease;
    }
    .btn-main:hover {
        background:#ffcc00;
        color:white;
        transform: scale(1.05);
        box-shadow:0 4px 12px rgba(0,0,0,0.2);
    }

    /* Features */
    .features { 
        display: grid;
        grid-template-columns: 1fr 1fr 1fr;
        gap: 15px; padding: 20px;
    }
    .card {
        background:white; padding:15px;
        border-radius:12px; text-align:center;
        box-shadow:0 2px 6px rgba(0,0,0,0.1);
        transition: transform 0.3s ease, box-shadow 0.3s ease;
        cursor:pointer;
        animation: fadeInUp 1.5s ease;
    }
    .card:hover {
        transform: translateY(-8px) scale(1.05);
        box-shadow:0 6px 15px rgba(0,0,0,0.2);
    }
    .card h3 { margin:10px 0; font-size:16px; }

    /* Products */
    .products { padding:20px; }
    .products h2 {
        text-align:center; margin-bottom:15px;
        animation: fadeIn 1.2s ease;
    }
    .product-grid {
        display:grid;
        grid-template-columns:1fr 1fr;
        gap:15px;
    }
    .product {
        background:white; padding:10px;
        border-radius:12px; text-align:center;
        box-shadow:0 2px 6px rgba(0,0,0,0.1);
        transition: all 0.3s ease;
        overflow:hidden;
        animation: zoomIn 1.5s ease;
    }
    .product:hover {
        transform: translateY(-6px);
        box-shadow:0 8px 18px rgba(0,0,0,0.25);
    }
   .product img {
    width: 150x;
    height: 150px;   /* 👈 image height fix kari */
    object-fit: cover;  /* 👈 crop thai ne fit thay */
    border-radius: 8px;
    transition: transform 0.3s ease; /* hover effect */
}

.product img:hover {
    transform: scale(1.05); /* zoom thoda */
}
    .product h4 { margin:8px 0; font-size:14px; transition: color 0.3s ease; }
    .product:hover h4 { color:#007bff; }
    .product .price { color:green; font-weight:bold; }

    /* 🔥 Keyframe Animations */
    @keyframes fadeIn {
        from { opacity:0; }
        to { opacity:1; }
    }
    @keyframes fadeInDown {
        from { opacity:0; transform:translateY(-20px); }
        to { opacity:1; transform:translateY(0); }
    }
    @keyframes fadeInUp {
        from { opacity:0; transform:translateY(20px); }
        to { opacity:1; transform:translateY(0); }
    }
    @keyframes zoomIn {
        from { opacity:0; transform:scale(0.9); }
        to { opacity:1; transform:scale(1); }
    }
    .product-grid {
    display: grid;
    grid-template-columns: repeat(3, 1fr); /* 3 per row */
    gap: 20px;
    padding: 30px 0;
}

.product {
    background: #fff;
    border-radius: 14px;
    box-shadow: 0 2px 10px rgba(80,120,250,0.06);
    text-align: center;
    padding: 22px 12px 16px 12px;
    transition: box-shadow 0.3s, transform 0.3s;
    position: relative;
    overflow: hidden;
}

.product:hover {
    box-shadow: 0 8px 22px rgba(60,132,255,0.17);
    transform: translateY(-6px) scale(1.025);
    z-index: 2;
}

.product img {
    width: 120px;
    height: 120px;
    object-fit: cover;
    border-radius: 10px;
    transition: transform 0.3s;
    background: #f6f8ff;
}

.product img:hover {
    transform: scale(1.09);
}

.product h4 {
    color: #3a86ff;
    margin: 10px 0 7px 0;
    font-size: 1.03rem;
    font-weight: 600;
}

.product .price {
    color: #19cf86;
    font-size: 1.01rem;
    font-weight: 700;
    margin-bottom: 6px;
}

/* Responsive for tablets & mobiles */
@media (max-width: 900px) {
    .product-grid { grid-template-columns: 1fr 1fr; }
}
@media (max-width: 650px) {
    .product-grid { grid-template-columns: 1fr; }
}
 .hero {
            height: 400px;
            background: linear-gradient(135deg, #3a57e8 0%, #1e34a7 100%);
            color: white;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            padding: 2rem;
        }
        
        .hero h1 {
            font-size: 3rem;
            margin-bottom: 1rem;
            text-shadow: 1px 1px 3px rgba(0,0,0,0.3);
        }
        
        .hero p {
            font-size: 1.2rem;
            margin-bottom: 2rem;
            max-width: 600px;
        }
        
        .shop-btn {
            background-color: #ff6b35;
            color: white;
            border: none;
            padding: 12px 30px;
            font-size: 1.1rem;
            font-weight: 600;
            border-radius: 30px;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 10px rgba(0,0,0,0.2);
        }
        
        .shop-btn:hover {
            background-color: #e85a2a;
            transform: translateY(-2px);
            box-shadow: 0 6px 15px rgba(0,0,0,0.3);
        }
 .responsive-banner {
  width: 100%;           /* full width of container */
  height: auto;          /* maintain aspect ratio */
  max-height: 600px;     /* max height restriction */
  object-fit: cover;     /* cover full container area */
  border-radius: 15px;   /* rounded corners for style */
  box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3); /* subtle shadow */
  transition: transform 0.5s ease;  /* smooth hover effect */
  display: block;
  margin: 0 auto;        /* center horizontally */
}

/* On hover zoom effect */
.responsive-banner:hover {

  box-shadow: 0 12px 30px rgba(0, 0, 0, 0.5);
}


</style>
   
       <img src="product_images/home hero.png" alt="Banner Image" class="responsive-banner" />

    
     <div id="form1">
      <div class="products">
    <h2>Our Latest Mobiles</h2>
    <div class="product-grid">
        <asp:Repeater ID="rptProducts" runat="server" OnItemCommand="rptProducts_ItemCommand">
            <ItemTemplate>
                <div class="product">
                            <img src='<%# ResolveUrl(Eval("ImagePath") != DBNull.Value && !string.IsNullOrEmpty(Eval("ImagePath").ToString()) ? Eval("ImagePath").ToString() : "~/images/noimage.png") %>' alt="Image2" style="height: 100px; width: 100px;" /><br />
                                <asp:Label CssClass="product-label" runat="server" Text='<%# Eval("Brand") %>'></asp:Label><br />
                                
                    <h4><%# Eval("ModelName") %></h4>
                    <p class="price">₹<%# Eval("Price") %></p>
                    <p><b>Brand:</b> <%# Eval("Brand") %></p>
                    <p><b>RAM:</b> <%# Eval("RAM") %> | <b>Storage:</b> <%# Eval("Storage") %></p>
                    <p><b>Camera:</b> <%# Eval("CameraDetails") %></p>
                    <p><b>Battery:</b> <%# Eval("BatteryCapacity") %> mAh</p>
                    <p><b>OS:</b> <%# Eval("OS") %></p>
                     <asp:Button ID="cmd_view" runat="server" Text="View Details" CssClass="btn btn-main" CommandArgument='<%# Eval("Id") %>' CommandName="cmd_view" />
                    <asp:Button ID="cmd_cart" runat="server" Text="Add To Cart" CommandName="AddToCart" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-main" />
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</div>

 
    </div>
   <!-- Footer -->
                <footer>
                    <div class="footer-content">
                        <div class="footer-column">
                            <h3>Mobile Junction</h3>
                            <p>
                                Your one-stop destination for the latest smartphones and accessories at the best prices.</p>
                            <div class="social-icons">
                                <a href="#"><i class="fab fa-facebook-f"></i></a><a href="#"><i class="fab fa-twitter"></i></a><a href="#"><i class="fab fa-instagram"></i></a><a href="#"><i class="fab fa-linkedin-in"></i></a>
                            </div>
                        </div>
                        <div class="footer-column">
                            <h3>Quick Links</h3>
                            <a href="home.aspx">Home</a> <a href="#">About Us</a> <a href="#">Shop</a> <a href="#">Offers</a> <a href="#">Contact</a>
                        </div>
                        <div class="footer-column">
                            <h3>Customer Service</h3>
                            <a href="#">FAQ</a> <a href="#">Returns & Refunds</a> <a href="#">Shipping Policy</a> <a href="#">Privacy Policy</a> <a href="#">Terms & Conditions</a>
                        </div>
                        <div class="footer-column">
                            <h3>Newsletter</h3>
                            <p>
                                Subscribe to our newsletter for updates on new products and exclusive offers.</p>
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
                            &copy; 2023 Mobile Junction. All rights reserved.</p>
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


                 
                </script>
</asp:Content>
<asp:Content ID="Content8" runat="server" contentplaceholderid="ContentPlaceHolder2">
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
    <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Search products..."></asp:TextBox>
    <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary" OnClick="btnSearch_Click" />
</div>

<asp:Repeater ID="Repeater1" runat="server">
    <ItemTemplate>
        <!-- product display here (already hase) -->
        <div>
            <%# Eval("Brand") %> - <%# Eval("ModelName") %> - <%# Eval("Price") %>
        </div>
    </ItemTemplate>
</asp:Repeater>


    <div class="auth-buttons">  
        <a href="login.aspx" class="btn btn-register">Login</a> 
        <a href="Register.aspx" class="btn btn-register">Register</a>
    </div>

    <div class="cart-icon">
        <a href="contact.aspx">
            <i class="fas fa-shopping-cart"></i>
            <span class="cart-count">3</span>
        </a>
    </div>
</div>

        </header>

         
</asp:Content>

