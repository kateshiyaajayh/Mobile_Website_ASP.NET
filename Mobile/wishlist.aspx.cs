using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mobile
{
    public partial class wishlist : System.Web.UI.Page
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
            da = new SqlDataAdapter("SELECT * FROM Register WHERE Email='" + Session["Email"] + "'", con);
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                int Uid = Convert.ToInt16(ds.Tables[0].Rows[0][0]);
                DataSet wishds = new DataSet();

                da = new SqlDataAdapter("SELECT Wishlist_Id, Prod_Name, Prod_Price, img FROM Wishlist_tbl WHERE User_Id=" + Uid, con);
                da.Fill(wishds);
                SvWishlist.DataSource = wishds;
                SvWishlist.DataBind();

                decimal totalAmount = 0;
                foreach (DataRow dr in wishds.Tables[0].Rows)
                {
                    if (dr["Prod_Price"] != DBNull.Value)
                    {
                        decimal price = Convert.ToDecimal(dr["Prod_Price"]);
                        totalAmount += price;
                    }
                }

                lblTotal.Text = "Total Price : " + totalAmount.ToString("0.00");
            }
            else
            {
                SvWishlist.DataSource = null;
                SvWishlist.DataBind();
                lblTotal.Text = "Total Price : 0.00";
            }
        }

        protected void SvWishlist_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void lnkRemove_Click(object sender, EventArgs e)
        {
            LinkButton lnkRemove = (LinkButton)sender;
            GridViewRow row = (GridViewRow)lnkRemove.NamingContainer;
            string wishId = SvWishlist.DataKeys[row.RowIndex].Value.ToString();

            getcon();
            cmd = new SqlCommand("DELETE FROM Wishlist_tbl WHERE Wishlist_Id='" + wishId + "'", con);
            cmd.ExecuteNonQuery();
            fillgrid();
        }

        protected void btnMoveToCart_Click(object sender, EventArgs e)
        {
            LinkButton btnMove = (LinkButton)sender;
            GridViewRow row = (GridViewRow)btnMove.NamingContainer;
            string wishId = SvWishlist.DataKeys[row.RowIndex].Value.ToString();

            getcon();

            da = new SqlDataAdapter("SELECT * FROM Wishlist_tbl WHERE Wishlist_Id=" + wishId, con);
            DataSet dsWish = new DataSet();
            da.Fill(dsWish);

            if (dsWish.Tables[0].Rows.Count > 0)
            {
                SqlDataAdapter daUser = new SqlDataAdapter("SELECT * FROM Register WHERE Email='" + Session["Email"].ToString() + "'", con);
                ds = new DataSet();
                daUser.Fill(ds);
                int userid = Convert.ToInt32(ds.Tables[0].Rows[0]["Id"].ToString());

                string prodName = dsWish.Tables[0].Rows[0]["Prod_Name"].ToString();

                da = new SqlDataAdapter("SELECT * FROM Mobiles WHERE ModelName='" + prodName + "'", con);
                ds = new DataSet();
                da.Fill(ds);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    int prodid = Convert.ToInt32(ds.Tables[0].Rows[0]["Id"].ToString());
                    string prodprc = ds.Tables[0].Rows[0]["Price"].ToString();
                    string img = ds.Tables[0].Rows[0]["ImagePath"].ToString();
                    int quantity = 1;

                    string q = "INSERT INTO Cart_tbl(User_Cart_Id, Prod_Cart_Id, Prod_Name, Prod_Price, Prod_Quantity, img) " +
                               "VALUES ('" + userid + "','" + prodid + "','" + prodName + "','" + prodprc + "','" + quantity + "','" + img + "')";
                    cmd = new SqlCommand(q, con);
                    cmd.ExecuteNonQuery();
                    Response.Redirect("cart.aspx");
                 
                    SqlCommand cmdDel = new SqlCommand("DELETE FROM Wishlist_tbl WHERE Wishlist_Id='" + wishId + "'", con);
                    cmdDel.ExecuteNonQuery();

                    Response.Write("<script>alert('Product moved to cart');</script>");
                }
            }

            fillgrid();
        }

    }
}
