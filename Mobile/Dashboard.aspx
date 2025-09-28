<%@ Page Title="" Language="C#" MasterPageFile="~/Adminpenal.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Mobile.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* 🔹 Layout */
        .admin-container {
            display: flex;
            min-height: 100vh;
            font-family: Arial, sans-serif;
        }

        /* 🔹 Sidebar */
        .sidebar {
            width: 220px;
            background: #2c3e50;
            color: #fff;
            padding-top: 20px;
        }

        .sidebar-header {
            text-align: center;
            margin-bottom: 20px;
        }

        .sidebar-header h2 {
            font-size: 20px;
            color: #ecf0f1;
        }

        .sidebar-menu ul {
            list-style: none;
            padding: 0;
        }

        .sidebar-menu ul li {
            margin: 10px 0;
        }

        .sidebar-menu ul li a {
            display: block;
            padding: 10px 15px;
            color: #ecf0f1;
            text-decoration: none;
            transition: 0.3s;
            border-radius: 6px;
        }

        .sidebar-menu ul li a:hover,
        .sidebar-menu ul li a.active {
            background: #3498db;
        }

        .sidebar-menu ul li a i {
            margin-right: 10px;
        }

        /* 🔹 Main Content */
        .main-content {
            flex: 1;
            padding: 20px;
            background: #f4f6f9;
        }

        /* 🔹 Header */
        .admin-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: #fff;
            padding: 15px 20px;
            border-radius: 8px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        }

        .admin-header h1 {
            margin: 0;
            font-size: 22px;
            color: #2c3e50;
        }

        .user-info {
            display: flex;
            align-items: center;
        }

        .user-info img {
            border-radius: 50%;
            margin-right: 10px;
            width: 40px;
            height: 40px;
        }

        /* 🔹 Logout Button */
        .logout-btn {
            margin-left: 15px;
            padding: 8px 16px;
            border: none;
            background: #e74c3c;
            color: #fff;
            border-radius: 20px;
            cursor: pointer;
            font-size: 14px;
            transition: 0.3s;
        }

        .logout-btn:hover {
            background: #c0392b;
        }

        /* 🔹 Welcome Section */
        .dashboard-welcome {
            margin-top: 30px;
            padding: 20px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        }

        .dashboard-welcome h2 {
            margin-top: 0;
            color: #34495e;
        }

        /* 🔹 Footer */
        .admin-footer {
            text-align: center;
            margin-top: 30px;
            padding: 15px;
            background: #2c3e50;
            color: #ecf0f1;
            border-radius: 8px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content4" runat="server" contentplaceholderid="ContentPlaceHolder3">
    <!-- Footer -->
    <div class="admin-footer">
        <p>&copy; 2023 Mobile Junction Admin Panel. All rights reserved.</p>
    </div>
</asp:Content>

<asp:Content ID="Content5" runat="server" contentplaceholderid="ContentPlaceHolder2">
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

                    <!-- 🔹 Logout Button -->
                    <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="logout-btn" PostBackUrl="~/Logout.aspx" />
                </div>
            </div>

            <!-- Welcome Section -->
            <div class="dashboard-welcome">
                <h2>Welcome to your Admin Dashboard!</h2>
                <p>Use the sidebar to manage Users, Products, Orders, Reports, and Settings.</p>
            </div>
        </div>
    </div>
</asp:Content>
