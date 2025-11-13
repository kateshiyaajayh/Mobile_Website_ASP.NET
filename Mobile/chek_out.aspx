<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="chek_out.aspx.cs" Inherits="Mobile.chek_out" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Checkout - Mobile Junction</title>
    <style>
        body { font-family: 'Poppins', sans-serif; background: #f5f5f5; text-align: center; padding: 50px; }
        table { width: 80%; margin: auto; border-collapse: collapse; background: white; border-radius: 10px; overflow: hidden; }
        th, td { border: 1px solid #ddd; padding: 15px; text-align: center; }
        th { background: #3a86ff; color: white; }
        h2 { color: #3a86ff; margin-bottom: 20px; }
        .btn { background: #3a86ff; color: white; padding: 12px 25px; border-radius: 50px; border: none; cursor: pointer; font-weight: 500; margin-top: 20px; }
        .btn:hover { background: #8338ec; }
        #lblTotal { margin-top: 20px; font-size: 1.2rem; font-weight: 600; }
        .payment-container { width: 80%; margin: 30px auto; background: white; padding: 25px; border-radius: 10px; text-align: left; }
        .form-group { margin-bottom: 15px; }
        label { font-weight: 600; display: block; margin-bottom: 5px; }
        input[type=text], input[type=number] { width: 100%; padding: 10px; border-radius: 6px; border: 1px solid #ccc; }
        .success-message { color: green; font-weight: 600; margin-top: 15px; }
        .error-message { color: #d90429; font-weight: 600; margin-top: 15px; }
     .form-container {
         margin-left:150px;
            background: #fff;
            padding: 25px 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            width:1210px;
        }
        h2 {
            text-align: left;
            margin-bottom: 20px;
            color: #333;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #555;
        }
        input, textarea {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .btn {
            width:1220px;
            background: #007BFF;
            color: white;
            border: none;
            padding: 10px;
            border-radius: 5px;
            cursor: pointer;
        }
        .btn:hover {
            background: #0056b3;
        }
        .success {
            color: green;
            text-align: center;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server" autocomplete="off">
        <center>
        Checkout
            </center>
        <asp:GridView ID="GridViewCheckout" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="Prod_Name" HeaderText="Product" />
                <asp:BoundField DataField="Prod_Price" HeaderText="Price" />
                <asp:BoundField DataField="Prod_Quantity" HeaderText="Quantity" />
                <asp:BoundField DataField="Subtotal" HeaderText="Subtotal" DataFormatString="{0:C}" />
            </Columns>
        </asp:GridView>
        <asp:Label ID="lblTotal" runat="server" Text=""></asp:Label>
                 <div id="form2" runat="server">
    <div class="form-container">
        <h2>Address Form</h2>

        <asp:Label ID="Label1" runat="server" Text="Full Name"></asp:Label>
        <asp:TextBox ID="txtFullName" runat="server" placeholder="Enter your name" required></asp:TextBox>

        <asp:Label ID="Label2" runat="server" Text="Phone Number"></asp:Label>
        <asp:TextBox ID="txtPhone" runat="server" placeholder="Enter phone number" required></asp:TextBox>

        <asp:Label ID="Label3" runat="server" Text="Address"></asp:Label>
        <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Rows="3" placeholder="Enter your full address" required></asp:TextBox>

        <asp:Label ID="Label4" runat="server" Text="State"></asp:Label>
        <asp:TextBox ID="txtState" runat="server" placeholder="Enter state" required></asp:TextBox>

        <asp:Label ID="Label5" runat="server" Text="City"></asp:Label>
        <asp:TextBox ID="txtCity" runat="server" placeholder="Enter city" required></asp:TextBox>

        <asp:Label ID="Label6" runat="server" Text="Pincode"></asp:Label>
        <asp:TextBox ID="txtPincode" runat="server" placeholder="Enter pincode" required></asp:TextBox>

         <br /><br />
        <asp:Label ID="Label7" runat="server" CssClass="success"></asp:Label>
    </div>
</div>
        <div class="payment-container">
            <h2>Payment Method</h2>
            <div class="form-group">
                <label>Select Payment Method</label><br />
                <asp:RadioButtonList ID="rblPaymentMethod" runat="server" RepeatDirection="Horizontal" AutoPostBack="true" OnSelectedIndexChanged="rblPaymentMethod_SelectedIndexChanged">
                    <asp:ListItem Value="CreditCard" Selected="True">Credit Card</asp:ListItem>
                    <asp:ListItem Value="DebitCard">Debit Card</asp:ListItem>
                    <asp:ListItem Value="GPay">GPay</asp:ListItem>
                    <asp:ListItem Value="CashOnDelivery">Cash on Delivery</asp:ListItem>
                </asp:RadioButtonList>
            </div>

            <!-- COD Summary Panel -->
          
            <asp:Panel ID="pnlCODSummary" runat="server" Visible="false">
                <div class="form-group">
                    <label><b>MRP:</b> <asp:Label ID="lblCODMRP" runat="server" /></label><br />
                    <label><b>25% Advance:</b> <asp:Label ID="lblCODAdvance" runat="server" /></label>
                </div>
            </asp:Panel>
            <!-- Credit Card -->
            <asp:Panel ID="pnlCreditCard" runat="server" Visible="true">
                <div class="form-group">
                    <label>Card Holder Name</label>
                    <asp:TextBox ID="txtCardName" runat="server" placeholder="Enter card holder name"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Card Number</label>
                    <asp:TextBox ID="txtCardNumber" runat="server" placeholder="1234 5678 9012 3456" MaxLength="16"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Expiry Date</label>
                    <asp:TextBox ID="txtExpiry" runat="server" placeholder="MM/YY"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>CVV</label>
                    <asp:TextBox ID="txtCVV" runat="server" placeholder="123" TextMode="Password" MaxLength="3"></asp:TextBox>
                </div>
            </asp:Panel>
            <!-- Debit Card -->
            <asp:Panel ID="pnlDebitCard" runat="server" Visible="false">
                <div class="form-group">
                    <label>Card Holder Name</label>
                    <asp:TextBox ID="txtDCardName" runat="server" placeholder="Enter card holder name"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Card Number</label>
                    <asp:TextBox ID="txtDCardNumber" runat="server" placeholder="1234 5678 9012 3456" MaxLength="16"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Expiry Date</label>
                    <asp:TextBox ID="txtDExpiry" runat="server" placeholder="MM/YY"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>CVV</label>
                    <asp:TextBox ID="txtDCVV" runat="server" placeholder="123" TextMode="Password" MaxLength="3"></asp:TextBox>
                </div>
            </asp:Panel>
            <!-- GPay/UPI & COD Advance Panel (same fields for GPay & COD)-->
            <asp:Panel ID="pnlGPay" runat="server" Visible="false">
                <div class="form-group">
                    <label>UPI ID</label>
                    <asp:TextBox ID="txtUPIID" runat="server" placeholder="example@upi"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Phone Number</label>
                    <asp:TextBox ID="txtGPayPhone" runat="server" placeholder="GPay phone"></asp:TextBox>
                </div>
            </asp:Panel>
            <asp:Panel ID="pnlAdvance" runat="server" Visible="false">
                <div class="form-group">
                    <label>Advance Payment Amount (25%)</label>
                    <asp:TextBox ID="txtAdvanceAmount" runat="server" ReadOnly="true"></asp:TextBox>
                </div>
            </asp:Panel>
        </div>
        <asp:Button ID="btnPlaceOrder" runat="server" Text="Place Order" OnClick="btnPlaceOrder_Click" CssClass="btn" />
        <asp:Label ID="lblMessage" runat="server" CssClass="error-message"></asp:Label>
        <asp:Label ID="lblSuccess" runat="server" CssClass="success-message"></asp:Label>
    </form>
</body>
</html>
