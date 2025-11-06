<%@ Page Title="" Language="C#" MasterPageFile="~/Adminpenal.Master" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="Mobile.User1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content5" runat="server" contentplaceholderid="ContentPlaceHolder1">
                <!DOCTYPE html>
                <html>
                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0"><title>Admin Panel - ASP.NET Website</title>
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
                    </style>
                </head>
</asp:Content>
<asp:Content ID="Content6" runat="server" contentplaceholderid="ContentPlaceHolder2">
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
                                    <li><a href="Orders.aspx"><i class="fas fa-shopping-cart"></i><span class="menu-text">Orders</span></a></li>
                                    <li><a href="Reports.aspx"><i class="fas fa-chart-bar"></i><span class="menu-text">Reports</span></a></li>
                                    <li><a href="Settings.aspx"><i class="fas fa-cog"></i><span class="menu-text">Settings</span></a></li>
                                     <li><a href="adminLogin.aspx"><i class="fas fa-sign-out-alt"></i><span class="menu-text">Logout</span></a></li>
                               
                                    </ul>
                            </div>
            </div>

                        <!-- Main Content -->
                        <div class="main-content">
                            <!-- Header -->
                            <div class="admin-header">
                                <h1>Dashboard</h1>
                                <div class="user-info">
                                    <img src="https://ui-avatars.com/api/?name=Admin+User&background=3498db&color=fff" alt="Admin User"> <span>Admin User</span>
                                </div>
                            </div>

                            <!-- Content -->
                            <div class="content">
                                <!-- Stats Cards -->
                                <div class="dashboard-cards">
                                    <div class="card stat-card users">
                                        <i class="fas fa-users"></i>
                                        <div class="number">
                                            1,258</div>
                                        <div class="label">
                                            Total Users</div>
                                    </div>
                                    <div class="card stat-card products">
                                        <i class="fas fa-box"></i>
                                        <div class="number">
                                            542</div>
                                        <div class="label">
                                            Total Products</div>
                                    </div>
                                    <div class="card stat-card orders">
                                        <i class="fas fa-shopping-cart"></i>
                                        <div class="number">
                                            789</div>
                                        <div class="label">
                                            Total Orders</div>
                                    </div>
                                    <div class="card stat-card revenue">
                                        <i class="fas fa-dollar-sign"></i>
                                        <div class="number">
                                            $25,890</div>
                                        <div class="label">
                                            Total Revenue</div>
                                    </div>
                                </div>

                                <!-- Recent Orders -->
                                <div class="content-section">
                                    <h2>Recent Orders</h2>
                                    <table>
                                        <thead>
                                            <tr>
                                                <th>Order ID</th>
                                                <th>Customer</th>
                                                <th>Date</th>
                                                <th>Amount</th>
                                                <th>Status</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>#ORD-7589</td>
                                                <td>John Smith</td>
                                                <td>May 15, 2023</td>
                                                <td>$125.99</td>
                                                <td><span class="badge completed">Completed</span></td>
                                                <td>
                                                    <button class="btn btn-primary btn-sm">
                                                        View
                                                    </button>
                                                    <button class="btn btn-danger btn-sm">
                                                        Delete
                                                    </button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>#ORD-7588</td>
                                                <td>Emma Johnson</td>
                                                <td>May 15, 2023</td>
                                                <td>$89.50</td>
                                                <td><span class="badge pending">Pending</span></td>
                                                <td>
                                                    <button class="btn btn-primary btn-sm">
                                                        View
                                                    </button>
                                                    <button class="btn btn-danger btn-sm">
                                                        Delete
                                                    </button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>#ORD-7587</td>
                                                <td>Michael Brown</td>
                                                <td>May 14, 2023</td>
                                                <td>$215.00</td>
                                                <td><span class="badge processing">Processing</span></td>
                                                <td>
                                                    <button class="btn btn-primary btn-sm">
                                                        View
                                                    </button>
                                                    <button class="btn btn-danger btn-sm">
                                                        Delete
                                                    </button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>#ORD-7586</td>
                                                <td>Sarah Williams</td>
                                                <td>May 14, 2023</td>
                                                <td>$52.75</td>
                                                <td><span class="badge completed">Completed</span></td>
                                                <td>
                                                    <button class="btn btn-primary btn-sm">
                                                        View
                                                    </button>
                                                    <button class="btn btn-danger btn-sm">
                                                        Delete
                                                    </button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>#ORD-7585</td>
                                                <td>David Miller</td>
                                                <td>May 13, 2023</td>
                                                <td>$179.99</td>
                                                <td><span class="badge pending">Pending</span></td>
                                                <td>
                                                    <button class="btn btn-primary btn-sm">
                                                        View
                                                    </button>
                                                    <button class="btn btn-danger btn-sm">
                                                        Delete
                                                    </button>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>

                                <!-- User Management -->
                                <div class="content-section">
                                    <h2>User Management</h2>
                                    <table>
                                        <thead>
                                            <tr>
                                                <th>User ID</th>
                                                <th>Name</th>
                                                <th>Email</th>
                                                <th>Role</th>
                                                <th>Status</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>#USR-2589</td>
                                                <td>John Smith</td>
                                                <td>john@example.com</td>
                                                <td>Customer</td>
                                                <td><span class="badge active">Active</span></td>
                                                <td>
                                                    <button class="btn btn-primary btn-sm">
                                                        Edit
                                                    </button>
                                                    <button class="btn btn-danger btn-sm">
                                                        Delete
                                                    </button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>#USR-2588</td>
                                                <td>Emma Johnson</td>
                                                <td>emma@example.com</td>
                                                <td>Admin</td>
                                                <td><span class="badge active">Active</span></td>
                                                <td>
                                                    <button class="btn btn-primary btn-sm">
                                                        Edit
                                                    </button>
                                                    <button class="btn btn-danger btn-sm">
                                                        Delete
                                                    </button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>#USR-2587</td>
                                                <td>Michael Brown</td>
                                                <td>michael@example.com</td>
                                                <td>Customer</td>
                                                <td><span class="badge inactive">Inactive</span></td>
                                                <td>
                                                    <button class="btn btn-primary btn-sm">
                                                        Edit
                                                    </button>
                                                    <button class="btn btn-danger btn-sm">
                                                        Delete
                                                    </button>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
        </div>
</asp:Content>
<asp:Content ID="Content7" runat="server" contentplaceholderid="ContentPlaceHolder3">
                <!-- Footer -->
                <div class="admin-footer">
                    <p>
                        &copy; 2023 Mobile Junction Admin Panel. All rights reserved.</p>
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
    </script>
</body>
</html>
</asp:Content>

