using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace Mobile
{
    public partial class chek_out : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        decimal totalAmount = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Email"] == null)
            {
                Response.Redirect("Register.aspx");
            }
            if (!IsPostBack)
            {
                BindCheckout();
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }
       
        void BindCheckout()
        {
            getcon();
            da = new SqlDataAdapter("SELECT * FROM Register WHERE Email='" + Session["Email"] + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                int uid = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
                DataSet cartds = new DataSet();
                da = new SqlDataAdapter("SELECT Prod_Name, Prod_Price, Prod_Quantity, (CAST(Prod_Price AS DECIMAL(10,2)) * CAST(Prod_Quantity AS INT)) AS Subtotal FROM Cart_tbl WHERE User_Cart_Id=" + uid, con);
                da.Fill(cartds);
                GridViewCheckout.DataSource = cartds;
                GridViewCheckout.DataBind();
                totalAmount = 0;
                foreach (DataRow dr in cartds.Tables[0].Rows)
                {
                    totalAmount += Convert.ToDecimal(dr["Subtotal"]);
                }
                lblTotal.Text = "Total Amount: ₹ " + totalAmount.ToString("0.00");
                ViewState["TotalAmount"] = totalAmount;  
            }
           
        }

        protected void rblPaymentMethod_SelectedIndexChanged(object sender, EventArgs e)
        {
            decimal amount = (ViewState["TotalAmount"] != null) ? Convert.ToDecimal(ViewState["TotalAmount"]) : 0;

            pnlCreditCard.Visible = (rblPaymentMethod.SelectedValue == "CreditCard");
            pnlDebitCard.Visible = (rblPaymentMethod.SelectedValue == "DebitCard");
            pnlGPay.Visible = (rblPaymentMethod.SelectedValue == "GPay" || rblPaymentMethod.SelectedValue == "CashOnDelivery");
            pnlAdvance.Visible = (rblPaymentMethod.SelectedValue == "CashOnDelivery");
            pnlCODSummary.Visible = (rblPaymentMethod.SelectedValue == "CashOnDelivery");

            if (rblPaymentMethod.SelectedValue == "CashOnDelivery")
            {
                decimal advance = Math.Round(amount * 0.25M, 2);
                txtAdvanceAmount.Text = advance.ToString("0.00");
                lblCODMRP.Text = "₹ " + amount.ToString("0.00");
                lblCODAdvance.Text = "₹ " + advance.ToString("0.00");
            }
            else
            {
                txtAdvanceAmount.Text = "";
                lblCODMRP.Text = "";
                lblCODAdvance.Text = "";
            }
            lblMessage.Text = "";
            lblSuccess.Text = "";
        }

        protected void btnPlaceOrder_Click(object sender, EventArgs e)
        {
            lblMessage.Text = "";
            lblSuccess.Text = "";

            decimal amount = (ViewState["TotalAmount"] != null) ? Convert.ToDecimal(ViewState["TotalAmount"]) : 0;
            string payMethod = rblPaymentMethod.SelectedValue;

            if (payMethod == "CreditCard")
            {
                if (string.IsNullOrWhiteSpace(txtCardName.Text) || string.IsNullOrWhiteSpace(txtCardNumber.Text) ||
                    string.IsNullOrWhiteSpace(txtExpiry.Text) || string.IsNullOrWhiteSpace(txtCVV.Text))
                {
                    lblMessage.Text = "Please enter all credit card details!";
                    return;
                }
            }
            else if (payMethod == "DebitCard")
            {
                if (string.IsNullOrWhiteSpace(txtDCardName.Text) || string.IsNullOrWhiteSpace(txtDCardNumber.Text) ||
                    string.IsNullOrWhiteSpace(txtDExpiry.Text) || string.IsNullOrWhiteSpace(txtDCVV.Text))
                {
                    lblMessage.Text = "Please enter all debit card details!";
                    return;
                }
            }
            else if (payMethod == "GPay" || payMethod == "CashOnDelivery")
            {
                if (string.IsNullOrWhiteSpace(txtUPIID.Text) || string.IsNullOrWhiteSpace(txtGPayPhone.Text))
                {
                    lblMessage.Text = "Please enter your UPI ID and phone number!";
                    return;
                }
            }

            getcon();

            try
            {
                da = new SqlDataAdapter("SELECT * FROM Register WHERE Email='" + Session["Email"] + "'", con);
                ds = new DataSet();
                da.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    int uid = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
                    cmd = new SqlCommand("INSERT INTO Orders(UserID, TotalAmount) VALUES(" + uid + ", " + amount + ")", con);
                    cmd.ExecuteNonQuery();
                    cmd = new SqlCommand("SELECT MAX(OrderID) FROM Orders", con);
                    int orderId = Convert.ToInt32(cmd.ExecuteScalar());

                    da = new SqlDataAdapter("SELECT Prod_Cart_Id, Prod_Quantity, Prod_Price FROM Cart WHERE User_Cart_Id=" + uid, con);
                    DataSet cartds = new DataSet();
                    da.Fill(cartds);

                    foreach (DataRow dr in cartds.Tables[0].Rows)
                    {
                        int prodId = Convert.ToInt32(dr["Prod_Cart_Id"]);
                        int qty = Convert.ToInt32(dr["Prod_Quantity"]);
                        decimal price = Convert.ToDecimal(dr["Prod_Price"]);
                        cmd = new SqlCommand("INSERT INTO Order_Details(OrderID, MobileID, Quantity, Price) VALUES(" + orderId + "," + prodId + "," + qty + "," + price + ")", con);
                        cmd.ExecuteNonQuery();
                    }

                    if (payMethod == "CashOnDelivery")
                    {
                        decimal advAmount = Math.Round(amount * 0.25M, 2);
                        string transactionId = txtUPIID.Text.Trim();
                        cmd = new SqlCommand("INSERT INTO PaymentDetails(OrderID, UserID, PaymentMethod, TransactionID, Amount, PaymentStatus, PaymentDate) VALUES("
                            + orderId + ", " + uid + ", 'Cash On Delivery', '" + transactionId + "', " + advAmount + ", 'Advance Paid', GETDATE())", con);
                        cmd.ExecuteNonQuery();
                    }
                    else if (payMethod == "CreditCard")
                    {
                        cmd = new SqlCommand("INSERT INTO PaymentDetails(OrderID, UserID, PaymentMethod, TransactionID, Amount, PaymentStatus, PaymentDate) VALUES("
                            + orderId + ", " + uid + ", 'Credit Card', '" + txtCardNumber.Text + "', " + amount + ", 'Success', GETDATE())", con);
                        cmd.ExecuteNonQuery();
                    }
                    else if (payMethod == "DebitCard")
                    {
                        cmd = new SqlCommand("INSERT INTO PaymentDetails(OrderID, UserID, PaymentMethod, TransactionID, Amount, PaymentStatus, PaymentDate) VALUES("
                            + orderId + ", " + uid + ", 'Debit Card', '" + txtDCardNumber.Text + "', " + amount + ", 'Success', GETDATE())", con);
                        cmd.ExecuteNonQuery();
                    }
                    else if (payMethod == "GPay")
                    {
                        cmd = new SqlCommand("INSERT INTO PaymentDetails(OrderID, UserID, PaymentMethod, TransactionID, Amount, PaymentStatus, PaymentDate) VALUES("
                            + orderId + ", " + uid + ", 'GPay', '" + txtUPIID.Text + "', " + amount + ", 'Success', GETDATE())", con);
                        cmd.ExecuteNonQuery();
                    }

                    cmd = new SqlCommand("DELETE FROM Cart WHERE User_Cart_Id=" + uid, con);
                    cmd.ExecuteNonQuery();
                    lblSuccess.Text = "Order placed successfully!";
                    Response.Redirect("OrderSuccess.aspx");
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
            }
            finally
            {
                if (con != null && con.State == System.Data.ConnectionState.Open)
                    con.Close();
            }
        }
    }
}
