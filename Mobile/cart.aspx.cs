using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics.Eventing.Reader;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mobile
{
    public partial class cart : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Email"] == null)
            {
                Response.Redirect("Register.aspx");
            }
            if (!IsPostBack)
            {
                fillgrid();
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void fillgrid()
        {
            getcon();
            ds = new DataSet();
            da = new SqlDataAdapter("select * from Register where Email='" + Session["Email"] + "'", con);
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                int Uid = Convert.ToInt16(ds.Tables[0].Rows[0][0]);
                DataSet cartds = new DataSet();
                da = new SqlDataAdapter("SELECT Prod_Cart_Id, Prod_Name, Prod_Price, Prod_Quantity, img FROM Cart_tbl WHERE User_Cart_Id=" + Uid, con);
                da.Fill(cartds);
                SvCart.DataSource = cartds;
                SvCart.DataBind();

                decimal totalAmount = 0;
                foreach (DataRow dr in cartds.Tables[0].Rows)
                {
                    if (dr["Prod_Price"] != DBNull.Value && dr["Prod_Quantity"] != DBNull.Value)
                    {
                        decimal price = Convert.ToDecimal(dr["Prod_Price"]);
                        int qty = Convert.ToInt32(dr["Prod_Quantity"]);
                        totalAmount += price * qty;
                    }
                }
                lblFinalTotal.Text = "totalAmount :" + totalAmount.ToString("0.00");
            }
            else
            {
                SvCart.DataSource = null;
                SvCart.DataBind();
                lblFinalTotal.Text = "Final Total : 0.00";
            }
        }


        protected void SvCart_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }
        protected void SvCart_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void lnkRemove_Click(object sender, EventArgs e)
        {
            LinkButton lnkRemove = (LinkButton)sender;
            GridViewRow row = (GridViewRow)lnkRemove.NamingContainer;
            string prodCartId = SvCart.DataKeys[row.RowIndex].Value.ToString();
            getcon();
            cmd = new SqlCommand("DELETE FROM Cart_tbl WHERE Prod_Cart_Id = '" + prodCartId + "'", con);
            cmd.ExecuteNonQuery();
            fillgrid();
        }

        protected void txtQuantity_TextChanged(object sender, EventArgs e)
        {


        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            getcon();
            da = new SqlDataAdapter("SELECT * FROM Register WHERE Email='" + Session["Email"] + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                int uid = Convert.ToInt32(ds.Tables[0].Rows[0][0]);

                foreach (GridViewRow row in SvCart.Rows)
                {
                    if (row.RowType == DataControlRowType.DataRow)
                    {
                        int prodcartid = Convert.ToInt32(SvCart.DataKeys[row.RowIndex].Value);
                        TextBox txtqty = (TextBox)row.FindControl("txtQuantity");


                        int quantity = 1;
                        if (txtqty != null && !string.IsNullOrWhiteSpace(txtqty.Text))
                        {
                            int.TryParse(txtqty.Text, out quantity);
                            if (quantity < 1) quantity = 1;
                        }

                        cmd = new SqlCommand(
                            "UPDATE Cart_tbl SET Prod_Quantity='" + quantity +
                            "' WHERE User_Cart_Id='" + uid +
                            "' AND Prod_Cart_Id='" + prodcartid + "'", con);

                        cmd.ExecuteNonQuery();
                    }
                }

               
                fillgrid();
            }
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
        
            getcon();
            da = new SqlDataAdapter("SELECT * FROM Register WHERE Email='" + Session["Email"] + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                int uid = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
                decimal totalAmount = 0;
                da = new SqlDataAdapter("SELECT Prod_Price, Prod_Quantity FROM Cart_tbl WHERE User_Cart_Id=" + uid, con);
                DataSet cartds = new DataSet();
                da.Fill(cartds);
                foreach (DataRow dr in cartds.Tables[0].Rows)
                {
                    decimal price = Convert.ToDecimal(dr["Prod_Price"]);
                    int qty = Convert.ToInt32(dr["Prod_Quantity"]);
                    totalAmount += price * qty;
                }
                cmd = new SqlCommand("INSERT INTO Orders(UserID, TotalAmount) VALUES(" + uid + ", " + totalAmount + ")", con);
                cmd.ExecuteNonQuery();
                cmd = new SqlCommand("SELECT MAX(OrderID) FROM Orders", con);
                int orderId = Convert.ToInt32(cmd.ExecuteScalar());
                da = new SqlDataAdapter("SELECT Prod_Cart_Id, Prod_Quantity, Prod_Price FROM Cart_tbl WHERE User_Cart_Id=" + uid, con);
                DataSet orderds = new DataSet();
                da.Fill(orderds);

                foreach (DataRow dr in orderds.Tables[0].Rows)
                {
                    int prodId = Convert.ToInt32(dr["Prod_Cart_Id"]);
                    int qty = Convert.ToInt32(dr["Prod_Quantity"]);
                    decimal price = Convert.ToDecimal(dr["Prod_Price"]);

                    cmd = new SqlCommand("INSERT INTO Order_Details(OrderID, MobileID, Quantity, Price) VALUES(" + orderId + "," + prodId + "," + qty + "," + price + ")", con);
                    cmd.ExecuteNonQuery();
                    Response.Redirect("chek_out.aspx");
                }
                cmd = new SqlCommand("DELETE FROM Cart_tbl WHERE User_Cart_Id=" + uid, con);
                cmd.ExecuteNonQuery();
                Response.Redirect("chek_out.aspx");
            }
        }

    }
}

