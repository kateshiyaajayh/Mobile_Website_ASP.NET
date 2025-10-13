<%@ Page Title="" Language="C#" MasterPageFile="~/Adminpenal.Master" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="Mobile.Orders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content5" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Panel - ASP.NET Website</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }

            :root {
                --primary: #2c3e50;
                --secondary: #34495e;
                --accent: #3498db;
                --light: #ecf0f1;
                --success: #2ecc71;
                --warning: #f39c12;
                --danger: #e74c3c;
                --text: #2c3e50;
                --text-light: #f5f6fa;
            }

            body {
                background-color: #f9f9f9;
                color: var(--text);
                line-height: 1.6;
            }

            .admin-container {
                display: flex;
                min-height: 100vh;
            }

            /* Sidebar Styles */
            .sidebar {
                width: 250px;
                background: var(--primary);
                color: var(--text-light);
                transition: all 0.3s ease;
            }

            .sidebar-header {
                padding: 20px;
                background: var(--secondary);
                text-align: center;
            }

                .sidebar-header h2 {
                    font-size: 1.5rem;
                    margin: 0;
                }

            .sidebar-menu {
                padding: 15px 0;
            }

                .sidebar-menu ul {
                    list-style: none;
                }

                .sidebar-menu li {
                    margin-bottom: 5px;
                }

                .sidebar-menu a {
                    display: block;
                    padding: 12px 20px;
                    color: var(--text-light);
                    text-decoration: none;
                    transition: all 0.3s;
                    font-size: 1rem;
                }

                    .sidebar-menu a:hover {
                        background: var(--secondary);
                        padding-left: 25px;
                    }

                    .sidebar-menu a.active {
                        background: var(--accent);
                        border-left: 4px solid var(--light);
                    }

                .sidebar-menu i {
                    margin-right: 10px;
                    width: 20px;
                    text-align: center;
                }

            /* Main Content Area */
            .main-content {
                flex: 1;
                display: flex;
                flex-direction: column;
            }

            /* Header Styles */
            .admin-header {
                background: white;
                padding: 15px 30px;
                display: flex;
                justify-content: space-between;
                align-items: center;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            }

            .user-info {
                display: flex;
                align-items: center;
            }

                .user-info img {
                    width: 40px;
                    height: 40px;
                    border-radius: 50%;
                    margin-right: 10px;
                }

            /* Content Styles */
            .content {
                padding: 30px;
                flex: 1;
            }

            .dashboard-cards {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
                gap: 20px;
                margin-bottom: 30px;
            }

            .card {
                background: white;
                border-radius: 8px;
                padding: 20px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.05);
            }

            .stat-card {
                text-align: center;
            }

                .stat-card i {
                    font-size: 2.5rem;
                    margin-bottom: 15px;
                }

                .stat-card .number {
                    font-size: 2rem;
                    font-weight: bold;
                    margin: 10px 0;
                }

                .stat-card .label {
                    color: #7f8c8d;
                    font-size: 0.9rem;
                }

            .users i {
                color: var(--accent);
            }

            .products i {
                color: var(--success);
            }

            .orders i {
                color: var(--warning);
            }

            .revenue i {
                color: var(--danger);
            }

            .content-section {
                background: white;
                border-radius: 8px;
                padding: 25px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.05);
                margin-bottom: 30px;
            }

                .content-section h2 {
                    margin-bottom: 20px;
                    padding-bottom: 10px;
                    border-bottom: 1px solid #eee;
                }

            /* Table Styles */
            table {
                width: 100%;
                border-collapse: collapse;
            }

                table th, table td {
                    padding: 12px 15px;
                    text-align: left;
                    border-bottom: 1px solid #eee;
                }

                table th {
                    background-color: #f8f9fa;
                    font-weight: 600;
                }

                table tr:hover {
                    background-color: #f9f9f9;
                }

            /* Button Styles */
            .btn {
                display: inline-block;
                padding: 8px 15px;
                border-radius: 4px;
                border: none;
                cursor: pointer;
                font-weight: 500;
                transition: all 0.3s;
            }

            .btn-primary {
                background: var(--accent);
                color: white;
            }

            .btn-success {
                background: var(--success);
                color: white;
            }

            .btn-danger {
                background: var(--danger);
                color: white;
            }

            .btn-sm {
                padding: 5px 10px;
                font-size: 0.85rem;
            }

            /* Footer Styles */
            .admin-footer {
                background: var(--secondary);
                color: var(--text-light);
                text-align: center;
                padding: 15px;
                margin-top: auto;
            }

            /* Responsive Design */
            @media (max-width: 992px) {
                .sidebar {
                    width: 80px;
                }

                    .sidebar .menu-text {
                        display: none;
                    }

                .sidebar-header h2 {
                    font-size: 1.2rem;
                }

                .sidebar-menu a {
                    text-align: center;
                    padding: 15px 10px;
                }

                .sidebar-menu i {
                    margin-right: 0;
                    font-size: 1.2rem;
                }

                .sidebar-menu a:hover {
                    padding-left: 10px;
                }
            }

            @media (max-width: 768px) {
                .admin-container {
                    flex-direction: column;
                }

                .sidebar {
                    width: 100%;
                    height: auto;
                }

                .sidebar-menu {
                    display: flex;
                    overflow-x: auto;
                }

                    .sidebar-menu ul {
                        display: flex;
                    }

                    .sidebar-menu li {
                        margin-bottom: 0;
                        margin-right: 5px;
                    }

                    .sidebar-menu a {
                        padding: 10px 15px;
                    }

                .dashboard-cards {
                    grid-template-columns: 1fr;
                }
            }
            .cart-dashboard {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    border-radius: 15px;
    padding: 25px;
    margin: 20px 0;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
    color: white;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

.cart-stats {
    display: flex;
    justify-content: space-around;
    align-items: center;
    flex-wrap: wrap;
    gap: 20px;
}

.stat-item {
    text-align: center;
    padding: 15px 25px;
    background: rgba(255, 255, 255, 0.1);
    border-radius: 12px;
    backdrop-filter: blur(10px);
    border: 1px solid rgba(255, 255, 255, 0.2);
    min-width: 180px;
    transition: transform 0.3s ease, background 0.3s ease;
}

.stat-item:hover {
    transform: translateY(-5px);
    background: rgba(255, 255, 255, 0.2);
}

.stat-value {
    font-size: 2.2em;
    font-weight: bold;
    display: block;
    margin-bottom: 5px;
}

.stat-label {
    font-size: 0.9em;
    opacity: 0.9;
    text-transform: uppercase;
    letter-spacing: 1px;
}

/* Specific color styles for each stat */
.users-stat .stat-value { color: #4FC3F7; }
.quantity-stat .stat-value { color: #81C784; }
.mrp-stat .stat-value { color: #FFB74D; }

/* Responsive design */
@media (max-width: 768px) {
    .cart-stats {
        flex-direction: column;
    }
    
    .stat-item {
        min-width: 200px;
    }
}
.cart-summary {
    background: #f8f9fa;
    border: 2px solid #e9ecef;
    border-radius: 10px;
    padding: 20px;
    margin: 15px 0;
}

.stat-card {
    display: inline-block;
    margin: 0 20px;
    padding: 15px;
    text-align: center;
    min-width: 150px;
}

.stat-number {
    font-size: 1.8em;
    font-weight: bold;
    display: block;
}

.stat-title {
    font-size: 0.9em;
    color: #6c757d;
    margin-top: 5px;
}
        </style>
    </head>
</asp:Content>
<asp:Content ID="Content6" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <body>
        <div class="admin-container">
            <!-- Sidebar -->
            <div class="sidebar">
                <div class="sidebar-header">
                    <h2>Admin Panel</h2>
                </div>
                <div class="sidebar-menu">
                    <ul>
                        <li><a href="Dashboard.aspx" class="active"><i class="fas fa-home"></i><span class="menu-text">Dashboard</span></a></li>
                        <li><a href="User.aspx"><i class="fas fa-users"></i><span class="menu-text">Users</span></a></li>
                        <li><a href="Products.aspx"><i class="fas fa-box"></i><span class="menu-text">Products</span></a></li>
                        <li><a href="Order.aspx"><i class="fas fa-shopping-cart"></i><span class="menu-text">Orders</span></a></li>
                        <li><a href="Reports.aspx"><i class="fas fa-chart-bar"></i><span class="menu-text">Reports</span></a></li>
                        <li><a href="Settings.aspx"><i class="fas fa-cog"></i><span class="menu-text">Settings</span></a></li>
                        <li><a href="Logout.aspx"><i class="fas fa-sign-out-alt"></i><span class="menu-text">Logout</span></a></li>
                    </ul>
                </div>
            </div>

            <!-- Main Content -->
            <div class="main-content">
                <!-- Header -->
                <div class="admin-header">
                    <h1>Dashboard</h1>
                    <div class="user-info">
                        <img src="https://ui-avatars.com/api/?name=Admin+User&background=3498db&color=fff" alt="Admin User">
                        <span>Admin User</span>
                    </div>
                </div>
                    <asp:GridView ID="GridViewOrders" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered">
    <Columns>
       
    </Columns>
</asp:GridView>

<hr />
<div class="cart-dashboard">
    <div class="cart-stats">
        <div class="stat-item users-stat">
            <span class="stat-value">
                <asp:Label ID="lblTotalUsers" runat="server" Text="2"></asp:Label>
            </span>
            <span class="stat-label">Total Users</span>
        </div>
        
        <div class="stat-item quantity-stat">
            <span class="stat-value">
                <asp:Label ID="lblTotalQuantity" runat="server" Text="15"></asp:Label>
            </span>
            <span class="stat-label">Total Quantity</span>
        </div>
        
        <div class="stat-item mrp-stat">
            <span class="stat-value">
                <asp:Label ID="lblTotalMRP" runat="server" Text="₹ 14,35,662.00"></asp:Label>
            </span>
            <span class="stat-label">Total MRP</span>
        </div>
    </div>
</div>
        </div>


        </div>



</asp:Content>

<asp:Content ID="Content7" runat="server" ContentPlaceHolderID="ContentPlaceHolder3">
    <!-- Footer -->
    <div class="admin-footer">
        <p>
            &copy; 2023 Mobile Junction Admin Panel. All rights reserved.
        </p>
    </div>
    </div>
        </div>

    <script>
        // Simple JavaScript for interactive elements
                             document.addEventListener('DOMContentLoaded', function () {
                                 // Add active class to clicked menu items
                                 const menuItems = document.querySelectorAll('.sidebar-menu a');
                                 menuItems.forEach(item => {
                                     item.addEventListener('click', function () {
                                         menuItems.forEach(i => i.classList.remove('active'));
                                         this.classList.add('active');
                                     });
                                 });

                                 // Simulate loading for demonstration
                                 console.log('Admin panel loaded successfully');
                             });
    </script >
    </body >
</html >
</asp:Content>

