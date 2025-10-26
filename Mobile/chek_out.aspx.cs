using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
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
            }

            con.Close();
        }

        protected void btnPlaceOrder_Click(object sender, EventArgs e)
        {
            getcon();

            da = new SqlDataAdapter("SELECT * FROM Register WHERE Email='" + Session["Email"] + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                int uid = Convert.ToInt32(ds.Tables[0].Rows[0][0]);

                cmd = new SqlCommand("INSERT INTO Orders(UserID, TotalAmount) VALUES(" + uid + ", " + totalAmount + ")", con);
                cmd.ExecuteNonQuery();

                cmd = new SqlCommand("SELECT MAX(OrderID) FROM Orders", con);
                int orderId = Convert.ToInt32(cmd.ExecuteScalar());

                da = new SqlDataAdapter("SELECT Prod_Cart_Id, Prod_Quantity, Prod_Price FROM Cart_tbl WHERE User_Cart_Id=" + uid, con);
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

                cmd = new SqlCommand("DELETE FROM Cart_tbl WHERE User_Cart_Id=" + uid, con);
                cmd.ExecuteNonQuery();


                Response.Redirect("OrderSuccess.aspx");
            }
        }
    }
}