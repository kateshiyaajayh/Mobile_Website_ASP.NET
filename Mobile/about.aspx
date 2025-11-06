<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="about.aspx.cs" Inherits="Mobile.about" %>
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
                              background: linear-gradient(to bottom, #FFFFFF, color-mix(in srgb, #FFFFFF 50%, #0000FF 50%), #0000FF);

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
                           

      
        /* Hero Section */
        .hero {
                                        background: linear-gradient(to bottom, #FFFFFF, color-mix(in srgb, #FFFFFF 50%, #0000FF 50%), #0000FF);

           background-size: cover;
            background-position: center;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            text-align: center;
            padding: 2rem;
            position: relative;
        }

        .hero-content {
            max-width: 800px;
            padding: 3rem;
           
                                        background: linear-gradient(to bottom, #FFFFFF, color-mix(in srgb, #FFFFFF 50%, #0000FF 50%), #0000FF);
border-radius: 16px;
            backdrop-filter: blur(10px);
            animation: fadeIn 1s ease-out;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.3);
        }

        .hero h1 {
            font-size: 3.5rem;
            margin-bottom: 1.5rem;
            background: linear-gradient(to right, var(--primary), var(--secondary));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            text-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
            letter-spacing: 1px;
        }

        .hero p {
            font-size: 1.3rem;
            margin-bottom: 2.5rem;
            line-height: 1.8;
            font-weight: 300;
        }

        .cta-buttons {
            display: flex;
            gap: 1.5rem;
            justify-content: center;
            flex-wrap: wrap;
        }

        .btn {
            padding: 1rem 2.5rem;
            border-radius: 50px;
            font-weight: 600;
            text-transform: uppercase;
            cursor: pointer;
            transition: all 0.3s ease;
            border: none;
            font-size: 1.1rem;
            letter-spacing: 1px;
            position: relative;
            overflow: hidden;
        }

        .btn-primary {
            background: linear-gradient(to right, var(--primary), var(--accent));
            color: white;
            box-shadow: 0 5px 15px rgba(58, 134, 255, 0.4);
        }

        .btn-primary:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 25px rgba(58, 134, 255, 0.6);
        }

        .btn-primary:active {
            transform: translateY(1px);
        }

        .btn-secondary {
            background-color: transparent;
            border: 2px solid white;
            color: white;
            box-shadow: 0 5px 15px rgba(255, 255, 255, 0.2);
        }

        .btn-secondary:hover {
            background-color: white;
            color: var(--dark);
            box-shadow: 0 10px 25px rgba(255, 255, 255, 0.3);
        }

        /* Stats Section */
        .stats {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            padding: 4rem 2rem;
            background: linear-gradient(135deg, var(--primary), var(--accent));
            color: white;
        }

        .stat-item {
            text-align: center;
            padding: 1.5rem;
            flex: 1;
            min-width: 200px;
            transition: transform 0.3s ease;
        }

        .stat-item:hover {
            transform: translateY(-5px);
        }

        .stat-number {
            font-size: 3rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
            display: block;
        }

        .stat-label {
            font-size: 1.2rem;
            text-transform: uppercase;
            letter-spacing: 1px;
            font-weight: 500;
        }

        /* Animations */
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .hero h1 {
                font-size: 2.5rem;
            }

            .hero p {
                font-size: 1.1rem;
            }

            .cta-buttons {
                flex-direction: column;
                align-items: center;
            }
            
            .btn {
                width: 100%;
                max-width: 300px;
            }
            
            .stats {
                flex-direction: column;
                gap: 2rem;
            }
        }

        @media (max-width: 480px) {
            .hero-content {
                padding: 2rem 1.5rem;
            }
            
            .hero h1 {
                font-size: 2rem;
            }
            
            .stat-number {
                font-size: 2.5rem;
            }
        }
            .team-card {
        background:white; 
        border-radius:10px; 
        box-shadow:0 8px 20px rgba(0,0,0,0.1); 
        transition:transform 0.3s, box-shadow 0.3s; 
        padding:20px;
        text-align:center;
    }
    .team-card img {
        border-radius:50%; 
        width:150px; 
        margin-bottom:15px;
        transition: transform 0.3s;
    }
    .team-card h5 {
        color:#007bff; 
        margin:10px 0 5px 0;
    }
    .team-card p {
        color:#555;
    }
    .team-card:hover {
        transform: translateY(-10px);
        box-shadow: 0 12px 25px rgba(0,0,0,0.2);
    }
    .team-card img:hover {
        transform: scale(1.1) rotate(5deg);
    }
    @keyframes fadeIn {
        from { opacity: 0; }
        to { opacity: 1; }
    }/* User avatar circular badge */
.user-icon {
    width: 38px;
    height: 38px;
    background: #10989e;
    color: #fff;
    font-weight: 700;
    font-size: 1.17rem;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    cursor: pointer;
    position: relative;
    box-shadow: 0 1.5px 7px rgba(30,100,130,0.13);
    transition: box-shadow 0.2s;
    margin-left: 8px;
    user-select: none;
}

.user-icon:hover, .user-icon.active {
    box-shadow: 0 6px 20px rgba(20,90,150,0.15);
    background: #00767c;
}

/* Custom dropdown menu */
.dropdown {
    display: none;
    position: absolute;
    right: 0;
    top: 110%;
    min-width: 170px;
    background: #fff;
    padding: 0.65rem 0;
    box-shadow: 0 7px 16px rgba(40,60,110,0.12);
    border-radius: 12px;
    z-index: 99;
    text-align: left;
}

.user-icon:active .dropdown,
.user-icon:focus-within .dropdown,
.user-icon.open .dropdown {
    display: block;
}

/* Dropdown links */
.dropdown a {
    display: block;
    color: #3a3a4c;
    font-weight: 600;
    padding: 9px 23px 9px 18px;
    text-decoration: none;
    font-size: 1rem;
    border-radius: 7px;
    transition: background 0.18s, color 0.18s;
}
.dropdown a:hover {
    background: #e6f8ff;
    color: #158cae;
}

/* Smaller screens */
@media (max-width: 650px) {
    .user-icon {
        width: 34px;
        height: 34px;
        font-size: 1rem;
        margin-left: 0;
    }
    .dropdown {
        min-width: 120px;
    }
}


                    </style>
                </head>
</asp:Content>
<asp:Content ID="Content6" runat="server" contentplaceholderid="ContentPlaceHolder3">


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
                            <a href="#">Home</a> <a href="#">About Us</a> <a href="#">Shop</a> <a href="#">Offers</a> <a href="#">Contact</a>
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
<asp:Content ID="Content7" runat="server" contentplaceholderid="ContentPlaceHolder2">
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
                                                            <li><a href="wishlist.aspx"><i class="fa-solid fa-heart"></i>wishlist</a></li>

                                    <li><a href="contact.aspx"><i class="fas fa-phone"></i>Contact</a></li>
                                </ul>
                            </div>
                                                                             <div class="nav-right">
    <div class="user-icon" id="userIcon" onclick="toggleDropdown()">
      <% if (Session["Email"] != null) { Response.Write(Session["Email"].ToString()[0].ToString().ToUpper()); } %>
      <div class="dropdown" id="dropdownMenu">
          <a href="Forgot.aspx">Forgot Password</a>
          <a href="login.aspx">Logout</a>
      </div>
  </div>


                        </div>
    </header>
          <!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>About | Mobile Junction</title>

<style>
/* ===== GLOBAL ===== */
* {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}

body {
  font-family: 'Poppins', sans-serif;
  overflow-x: hidden;
 
                              background: linear-gradient(to bottom, #FFFFFF, color-mix(in srgb, #FFFFFF 50%, #0000FF 50%), #0000FF);

  color: #333;
}

section {
  width: 100%;
  min-height: 100vh;
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  justify-content: center;
  padding: 60px 10%;
}

/* ===== SECTION 1 ===== */
.section1 {
             
}

.section1 .content {
  flex: 1 1 450px;
  text-align: center;
}

.section1 h1 {
  font-size: 3rem;
  font-weight: 700;
  margin-bottom: 20px;
  color:#00bcd4;
}

.section1 p {
  font-size: 1.2rem;
  margin-bottom: 30px;
}

.section1 button {
  background-color: white;
  color: #007bff;
  border: none;
  padding: 12px 28px;
  border-radius: 30px;
  font-weight: 600;
  cursor: pointer;
  transition: 0.3s;
}

.section1 button:hover {
  background-color: #333;
  color: #fff;
  transform: scale(1.05);
}

.section1 .image {
  flex: 1 1 450px;
  display: flex;
  justify-content: center;
  align-items: center;
}

.section1 .image img {
    border-radius:20px;
  max-width: 150px;
  width: 150px;
  transition: transform 0.5s ease;
}

.section1 .image img:hover {
  transform: scale(1.1) rotate(3deg);
}

/* ===== SECTION 2 ===== */
.section2 {
                  
  color: #222;
  gap: 50px;
}

/* Cube container */
.cube-container {
  perspective: 800px;
  flex: 1;
  display: flex;
  justify-content: center;
  align-items: center;
}

/* Cube */
.cube {
  position: relative;
  width: 200px;
  height: 200px;
  transform-style: preserve-3d;
  animation: cubeRotate360 8s infinite linear;
}

/* Smooth continuous 360 rotation */
@keyframes cubeRotate360 {
  from { transform: rotateX(0deg) rotateY(0deg); }
  to { transform: rotateX(360deg) rotateY(360deg); }
}

.cube div {
  position: absolute;
  width: 200px;
  height: 200px;
  border: 2px solid #fff;
  border-radius: 10px;
  overflow: hidden;
}

.cube div img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

/* Cube faces */
.front { transform: translateZ(100px); }
.back { transform: rotateY(180deg) translateZ(100px); }
.right { transform: rotateY(90deg) translateZ(100px); }
.left { transform: rotateY(-90deg) translateZ(100px); }
.top { transform: rotateX(90deg) translateZ(100px); }
.bottom { transform: rotateX(-90deg) translateZ(100px); }

/* Section text */
.section2 .text {
  flex: 1 1 400px;
  text-align: center;
}

.section2 h2 {
  font-size: 2.5rem;
  color: #007bff;
  margin-bottom: 20px;
}

.section2 p {
  font-size: 1.1rem;
  margin-bottom: 25px;
  line-height: 1.6;
}

.section2 button {
  background: #007bff;
  color: #fff;
  border: none;
  padding: 12px 28px;
  border-radius: 30px;
  cursor: pointer;
  font-weight: 600;
  transition: 0.3s;
}

.section2 button:hover {
  background: #00c6ff;
  transform: scale(1.05);
}

/* ===== SECTION 3 ===== */
.section3 {
                         color: white;
  flex-direction: column;
  text-align: center;
}

.section3 h2 {
  font-size: 2.8rem;
  margin-bottom: 40px;
}

.review-container {
  display: flex;
  gap: 25px;
  flex-wrap: wrap;
  justify-content: center;
}

.review {
  background: rgba(255,255,255,0.1);
  border-radius: 15px;
  padding: 30px;
  width: 300px;
  box-shadow: 0 10px 25px rgba(0,0,0,0.1);
  transition: transform 0.3s ease;
}

.review:hover {
  transform: translateY(-10px);
}

.review img {
  width: 80px;
  height: 80px;
  border-radius: 50%;
  margin-bottom: 15px;
  border: 3px solid #fff;
}

.review p {
  font-style: italic;
  margin-bottom: 15px;
}

.review h4 {
  margin: 0;
  font-weight: 600;
}

/* ===== RESPONSIVE ===== */
@media(max-width: 900px) {
  section {
    flex-direction: column;
    text-align: center;
  }
  .section1 h1 { font-size: 2.2rem; }
}
.section1 .image img {
  max-width: 280px;
  width: 100%;
  height: auto;
  border-radius: 25px;
                             background: linear-gradient(to bottom, #FFFFFF, color-mix(in srgb, #FFFFFF 50%, #0000FF 50%), #0000FF);

  box-shadow: 
      -10px -10px 20px rgba(255, 255, 255, 0.6),   /* top-left light */
      15px 15px 30px rgba(0, 0, 0, 0.3);          /* bottom-right deep shadow */
  transition: all 0.4s ease;
  transform: perspective(800px) rotateY(-5deg) rotateX(3deg);
}

.section1 .image img:hover {
  transform: perspective(800px) rotateY(0deg) rotateX(0deg) scale(1.05);
  box-shadow:
      -5px -5px 15px rgba(255, 255, 255, 0.7),
      20px 20px 40px rgba(0, 0, 0, 0.4);
}
/* Cube container */
.cube-container {
  perspective: 1000px;
  flex: 1;
  display: flex;
  justify-content: center;
  align-items: center;
}

/* Cube (static, no rotation) */
.cube {
  position: relative;
  width: 200px;
  height: 200px;
  transform-style: preserve-3d;
  transform: rotateY(-15deg) rotateX(10deg);
  transition: all 0.6s ease;
}

/* Cube faces */
.cube div {
  position: absolute;
  width: 200px;
  height: 200px;
  border-radius: 18px;
  overflow: hidden;
  background: #fff;
  box-shadow:
      -10px -10px 25px rgba(255, 255, 255, 0.8),  /* top-left light */
      20px 20px 40px rgba(0, 0, 0, 0.4);           /* bottom-right depth */
  transition: all 0.4s ease;
}

/* Image inside cube faces */
.cube div img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  border-radius: 18px;
}

/* Hover glow effect */
.cube:hover {
  transform: rotateY(0deg) rotateX(0deg) scale(1.05);
}

.cube:hover div {
  box-shadow:
      -5px -5px 20px rgba(255, 255, 255, 0.9),
      25px 25px 50px rgba(0, 0, 0, 0.5);
}

/* Cube sides */
.front { transform: translateZ(100px); }
.back { transform: rotateY(180deg) translateZ(100px); }
.right { transform: rotateY(90deg) translateZ(100px); }
.left { transform: rotateY(-90deg) translateZ(100px); }
.top { transform: rotateX(90deg) translateZ(100px); }
.bottom { transform: rotateX(-90deg) translateZ(100px); }
.section1 {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 50px;
  background: #f5f5f5;
}

.section1 .content {
  flex: 1;
  padding-right: 40px;
}

.section1 .image {
  flex: 1;
}

.section1 video {
  width: 100%;
  border-radius: 12px;
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
  object-fit: cover;
}


</style>
</head>
<body>

<!-- ===== SECTION 1 ===== -->
<section class="section1">
  <div class="content">
    <h1>Welcome to Mobile Junction</h1>
    <p>Your trusted destination for the latest smartphones and accessories.</p>
    <button>Shop Now</button>
  </div>

  <div class="image">
    <video autoplay muted loop playsinline>
      <source src="product_images/video.mp4" type="video/mp4">
      Your browser does not support the video tag.
    </video>
  </div>
</section>

<!-- ===== SECTION 2 ===== -->
<section class="section2">
  <div class="cube-container">
    <div class="cube">
      <div class="front"><img src="images/Home_add.png" alt="Front"></div>
      <div class="back"><img src="images/SAMSUNG_S25_ULTRA.png" alt="Back"> </div>
      <div class="right"><img src="images/Samsung Galaxy Z Flip7.png" alt="Right"></div>
      <div class="left"><img src="images/oppo.png" alt="Left"></div>
      <div class="top"><img src="images/Home_add.png" alt="Front"></div>
      <div class="bottom"><img src="images/oppo.png" alt="Left"></div>
    </div>
  </div>

  <div class="text">
    <h2>Discover Quality & Innovation</h2>
    <p>At Mobile Junction, we bring you the most advanced mobile technology at unbeatable prices. Experience cutting-edge performance, stylish designs, and unmatched support all in one place.</p>
    <button>Shop Now</button>
  </div>
</section>

<!-- ===== SECTION 3 ===== -->
<section class="section3">
  <h2>What Our Customers Say</h2>
  <div class="review-container">
    <div class="review">
      <img src="https://randomuser.me/api/portraits/men/1.jpg" alt="">
      <p>“Amazing service and the best prices. Got my new phone in just 2 days!”</p>
      <h4>Rohit Sharma</h4>
    </div>
    <div class="review">
      <img src="https://randomuser.me/api/portraits/women/2.jpg" alt="">
      <p>“Fantastic experience! The team was helpful and knowledgeable.”</p>
      <h4>Pooja Patel</h4>
    </div>
    <div class="review">
      <img src="https://randomuser.me/api/portraits/men/3.jpg" alt="">
      <p>“High-quality products and super fast delivery. Highly recommended.”</p>
      <h4>Arjun Mehta</h4>
    </div>
  </div>
</section>

</body>
</html>


</asp:Content>

