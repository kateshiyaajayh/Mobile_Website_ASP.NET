<%@ Page Title="" Language="C#" MasterPageFile="~/Adminpenal.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="Mobile.Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        // Optional: Smooth fade in page content on load
        document.addEventListener("DOMContentLoaded", function () {
            const container = document.querySelector("div");
            if (container) {
                container.style.opacity = 0;
                container.style.transition = "opacity 0.8s ease";
                setTimeout((s) => {
                    container.style.opacity = 1;
                }, 100);
            }
        });

    </script>
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
        /* Existing base styles remain unchanged */

        /* Medium devices - tablets (768px and below) */
        @media (max-width: 768px) {
            .admin-container {
                flex-direction: column;
            }

            .sidebar {
                width: 100%;
                height: auto;
                order: 1;
            }

            .sidebar-menu {
                display: flex;
                overflow-x: auto;
                padding: 0;
                margin: 0;
            }

                .sidebar-menu ul {
                    display: flex;
                    flex-wrap: nowrap;
                }

                .sidebar-menu li {
                    margin: 0 10px 0 0;
                }

                .sidebar-menu a {
                    padding: 10px 15px;
                    white-space: nowrap;
                }

                    .sidebar-menu a .menu-text {
                        display: none; /* Optionally hide text to save space */
                    }

            .main-content {
                order: 2;
                padding: 15px 10px;
            }

            /* Stack form labels and inputs vertically for small devices */
            table tr td:first-child {
                width: auto;
                font-weight: 600;
                padding-bottom: 5px;
            }

            table tr {
                display: flex;
                flex-direction: column;
                margin-bottom: 15px;
            }

                table tr td {
                    padding: 4px 0;
                }

            /* Make GridView scrollable horizontally */
            #GridView1 {
                display: block;
                overflow-x: auto;
                white-space: nowrap;
            }
        }

        /* Small devices - phones (480px and below) */
        @media (max-width: 480px) {
            .sidebar-header h2 {
                font-size: 1rem;
            }

            .sidebar-menu a {
                padding: 8px 10px;
                font-size: 0.9rem;
            }

            .admin-header {
                flex-direction: column;
                align-items: flex-start;
            }

            .user-info {
                margin-top: 10px;
                width: 100%;
                justify-content: space-between;
            }

            /* Further stack table for narrow screens */
            table tr {
                margin-bottom: 20px;
            }

            /* Buttons and inputs should be full width on small devices */
            asp\:TextBox,
            asp\:DropDownList,
            asp\:Button {
                width: 100% !important;
                box-sizing: border-box;
            }
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

        /* Container */
        /* Container styling */
        div.container {
            max-width: 900px;
            margin: 20px auto;
            padding: 20px 30px;
            background-color: #fff;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            border-radius: 10px;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        /* Table styling */
        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0 10px;
            margin-bottom: 20px;
        }

            table tr td:first-child {
                font-weight: 600;
                padding-right: 15px;
                vertical-align: middle;
                color: #333;
                width: 160px;
            }

            table tr td {
                padding: 8px 10px;
            }

        /* Input and dropdown fields styling */
        input[type="text"],
        input[type="file"],
        select,
        asp\:TextBox, asp\:DropDownList {
            width: 100%;
            padding: 8px 12px;
            border: 1.5px solid #ccc;
            border-radius: 6px;
            outline: none;
            font-size: 1rem;
            transition: border-color 0.3s ease;
            box-sizing: border-box;
        }

            input[type="text"]:focus,
            input[type="file"]:focus,
            select:focus {
                border-color: #0078D7;
                box-shadow: 0 0 8px rgba(0, 120, 215, 0.3);
            }

        /* Button styling */
        asp\:Button {
            padding: 10px 25px;
            font-size: 1.05rem;
            background: linear-gradient(135deg, #0078D7, #005ea2);
            color: #fff;
            border: none;
            border-radius: 25px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

            asp\:Button:hover {
                background: linear-gradient(135deg, #005ea2, #003f6a);
            }

        /* GridView styling */
        #GridView1 {
            width: 100%;
            border-collapse: collapse;
            font-size: 0.95rem;
        }

            #GridView1 th,
            #GridView1 td {
                padding: 12px 15px;
                border-bottom: 1px solid #e1e1e1;
                text-align: left;
            }

            #GridView1 th {
                background-color: #0078D7;
                color: #fff;
                font-weight: 600;
                text-transform: uppercase;
                letter-spacing: 0.05em;
            }

            #GridView1 tr:nth-child(even) {
                background-color: #f9f9f9;
            }

            #GridView1 tr:hover {
                background-color: #d6ebff;
            }

            /* Image styling in GridView */
            #GridView1 img {
                border-radius: 8px;
                object-fit: cover;
            }

            /* LinkButtons inside GridView as links */
            #GridView1 .aspNetDisabled {
                cursor: default;
                color: #999;
            }

            #GridView1 a {
                color: #0078D7;
                text-decoration: none;
                font-weight: 600;
            }

                #GridView1 a:hover {
                    text-decoration: underline;
                }

        /* Responsive tweak */
        @media (max-width: 700px) {
            table, #GridView1 {
                font-size: 0.85rem;
            }

                table tr td:first-child {
                    width: 120px;
                }
        }
    </style>
</asp:Content>

<asp:Content ID="Content5" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

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
            <div class="admin-header">
                <h1>Dashboard</h1>
                <div class="user-info">
                    <img src="https://ui-avatars.com/api/?name=Admin+User&background=3498db&color=fff" alt="Admin User">
                    <span>Admin User</span>
                </div>
            </div>

            <!-- Product Form -->
            <table>
                <tr>
                    <td>Brand:</td>
                    <td>
                        <asp:DropDownList ID="drpbrand" runat="server" AutoPostBack="True" OnSelectedIndexChanged="drpbrand_SelectedIndexChanged">
                            <asp:ListItem>--select--</asp:ListItem>
                            <asp:ListItem>Apple</asp:ListItem>
                            <asp:ListItem>Samsung</asp:ListItem>
                            <asp:ListItem>Xiaomi</asp:ListItem>
                            <asp:ListItem>Google</asp:ListItem>
                            <asp:ListItem>Oppo</asp:ListItem>
                            <asp:ListItem>Vivo</asp:ListItem>
                            <asp:ListItem>Oneplus</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>Model Name:</td>
                    <td>
                        <asp:TextBox ID="txtmodelnm" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Price:</td>
                    <td>
                        <asp:TextBox ID="txtprise" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Stock Quantity:</td>
                    <td>
                        <asp:TextBox ID="txtstok" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>RAM:</td>
                    <td>
                        <asp:DropDownList ID="drpram" runat="server">
                            <asp:ListItem>--Select--</asp:ListItem>
                            <asp:ListItem>4GB</asp:ListItem>
                            <asp:ListItem>6GB</asp:ListItem>
                            <asp:ListItem>8GB</asp:ListItem>
                            <asp:ListItem>12GB</asp:ListItem>
                            <asp:ListItem>16GB</asp:ListItem>
                            <asp:ListItem>24GB</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>Storage:</td>
                    <td>
                        <asp:DropDownList ID="drpdtor" runat="server">
                            <asp:ListItem>--Select--</asp:ListItem>
                            <asp:ListItem>32GB</asp:ListItem>
                            <asp:ListItem>64GB</asp:ListItem>
                            <asp:ListItem>128GB</asp:ListItem>
                            <asp:ListItem>256GB</asp:ListItem>
                            <asp:ListItem>512GB</asp:ListItem>
                            <asp:ListItem>1TB</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>Color:</td>
                    <td>
                        <asp:TextBox ID="txtcolor" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Battery Capacity:</td>
                    <td>
                        <asp:TextBox ID="txtbatry" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Camera Details:</td>
                    <td>
                        <asp:TextBox ID="txtcamdt" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>OS (Operating System)</td>
                    <td>
                        <asp:DropDownList ID="drpos" runat="server">
                            <asp:ListItem>--Select--</asp:ListItem>
                            <asp:ListItem>Android</asp:ListItem>
                            <asp:ListItem>IOS</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>Description</td>
                    <td>
                        <asp:TextBox ID="txtdesc" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Image Upload</td>
                    <td>
                        <asp:FileUpload ID="FileUpload1" runat="server" /></td>
                </tr>
                <tr>
                    <td>Image Upload2</td>
                    <td>
                        <asp:FileUpload ID="FileUpload2" runat="server" /></td>
                </tr>
                <tr>
                    <td>Image Upload3</td>
                    <td>
                        <asp:FileUpload ID="FileUpload3" runat="server" /></td>
                </tr>
                <tr>
                    <td>Image Upload4</td>
                    <td>
                        <asp:FileUpload ID="FileUpload4" runat="server" /></td>
                </tr>
                <tr>
                    <td>Image Upload5</td>
                    <td>
                        <asp:FileUpload ID="FileUpload5" runat="server" /></td>
                </tr>
                <tr>
                    <td>Launch Date</td>
                    <td>
                        <asp:TextBox ID="txtdate" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="txtadd" runat="server" Text="Save" OnClick="Button1_Click" Height="38px" Width="146px" /></td>
                </tr>
            </table>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" CssClass="gridview-style">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="ID" Visible="false" />
                    <asp:TemplateField HeaderText="Brand">
                        <ItemTemplate>
                            <%# Eval("Brand") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Model Name">
                        <ItemTemplate>
                            <%# Eval("ModelName") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Price">
                        <ItemTemplate>
                            <%# Eval("Price") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Stock Qty">
                        <ItemTemplate>
                            <%# Eval("StockQty") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="RAM">
                        <ItemTemplate>
                            <%# Eval("RAM") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Storage">
                        <ItemTemplate>
                            <%# Eval("Storage") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Color">
                        <ItemTemplate>
                            <%# Eval("Color") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Battery Capacity">
                        <ItemTemplate>
                            <%# Eval("BatteryCapacity") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Camera Details">
                        <ItemTemplate>
                            <%# Eval("CameraDetails") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="OS">
                        <ItemTemplate>
                            <%# Eval("OS") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Description">
                        <ItemTemplate>
                            <%# Eval("Description") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Image 1">
                        <ItemTemplate>
                            <img src='<%# ResolveUrl(Eval("ImagePath") != DBNull.Value && !string.IsNullOrEmpty(Eval("ImagePath").ToString()) ? Eval("ImagePath").ToString() : "~/images/noimage.png") %>' width="100" height="100" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Image 2">
                        <ItemTemplate>
                            <img src='<%# ResolveUrl(Eval("ImagePath1") != DBNull.Value && !string.IsNullOrEmpty(Eval("ImagePath1").ToString()) ? Eval("ImagePath1").ToString() : "~/images/noimage.png") %>' width="100" height="100" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Image 3">
                        <ItemTemplate>
                            <img src='<%# ResolveUrl(Eval("ImagePath2") != DBNull.Value && !string.IsNullOrEmpty(Eval("ImagePath2").ToString()) ? Eval("ImagePath2").ToString() : "~/images/noimage.png") %>' width="100" height="100" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Image 4">
                        <ItemTemplate>
                            <img src='<%# ResolveUrl(Eval("ImagePath3") != DBNull.Value && !string.IsNullOrEmpty(Eval("ImagePath3").ToString()) ? Eval("ImagePath3").ToString() : "~/images/noimage.png") %>' width="100" height="100" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Image 5">
                        <ItemTemplate>
                            <img src='<%# ResolveUrl(Eval("ImagePath4") != DBNull.Value && !string.IsNullOrEmpty(Eval("ImagePath4").ToString()) ? Eval("ImagePath4").ToString() : "~/images/noimage.png") %>' width="100" height="100" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Launch Date">
                        <ItemTemplate>
                            <%# Eval("LaunchDate") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Edit">
                        <ItemTemplate>
                            <asp:LinkButton ID="cmd_edt" runat="server" CommandName="cmd_edt" CommandArgument='<%# Eval("Id") %>'>Edit</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Delete">
                        <ItemTemplate>
                            <asp:LinkButton ID="cmd_del" runat="server" CommandName="cmd_del" CommandArgument='<%# Eval("Id") %>'>Delete</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>

</asp:Content>

<asp:Content ID="Content6" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
</asp:Content>


