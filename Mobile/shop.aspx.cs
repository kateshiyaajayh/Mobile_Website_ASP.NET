using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mobile
{
    public partial class shop : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        DataSet ds;
        SqlCommand cmd;
        IDataAdapter da;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Email"] == null)
            {
                Response.Redirect("Register.aspx");
            }
            if (!IsPostBack)
            {
                fill();
            }
            if (!IsPostBack)
            {
                BindProducts("");
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }
        void BindProducts(string keyword)
        {
            getcon();

            string query;
            if (keyword == "")
            {
                query = "SELECT * FROM Mobiles ORDER BY NEWID()";
            }
            else
            {
                query = "SELECT * FROM Mobiles WHERE ModelName LIKE '%" + keyword + "%' OR Brand LIKE '%" + keyword + "%'";
            }

            da = new SqlDataAdapter(query, con);
            ds = new DataSet();
            da.Fill(ds);

            rptMobiles.DataSource = ds;
            rptMobiles.DataBind();

            con.Close();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string keyword = TextBox1.Text.Trim();
            BindProducts(keyword);
        }
        private void fill()
        {
            getcon();
            SqlCommand cmd = new SqlCommand("select * from Mobiles", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            rptMobiles.DataSource = dt;
            rptMobiles.DataBind();
        
        }

        protected void drpFilterBrand_SelectedIndexChanged(object sender, EventArgs e)
        {
            fill();
        }

        protected void rptMobiles_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "cmd_view")
            {
                Response.Redirect("ViewDetail.aspx?id=" + e.CommandArgument);
            }
            if (e.CommandName == "cmd_cart")

            {
                getcon();

                cmd = new SqlCommand("SELECT Id FROM Register WHERE Email='" + Session["Email"].ToString() + "'", con);
                object uidObj = cmd.ExecuteScalar();
                if (uidObj == null)
                {

                    return;
                }

                int userId = Convert.ToInt32(uidObj);

                cmd = new SqlCommand("SELECT * FROM Mobiles WHERE Id=" + e.CommandArgument, con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    string prodName = dr["ModelName"].ToString();
                    decimal prodPrice = Convert.ToDecimal(dr["Price"]);
                    string img = dr["ImagePath"].ToString();
                    dr.Close();
                    cmd = new SqlCommand("INSERT INTO Cart_tbl(User_Cart_Id, Prod_Cart_Id, Prod_Name, Prod_Price, Prod_Quantity, img) " +
                                         "VALUES(" + userId + "," + e.CommandArgument + ",'" + prodName + "'," + prodPrice + ",1,'" + img + "')", con);
                    cmd.ExecuteNonQuery();

                    Response.Redirect("Cart.aspx");
                }
            }
            else if (e.CommandName == "cmd_wish")
            {
                getcon();
                SqlDataAdapter da = new SqlDataAdapter("select * from Register where Email='" + Session["Email"].ToString() + "'", con);
                ds = new DataSet();
                da.Fill(ds);
                int userid = Convert.ToInt32(ds.Tables[0].Rows[0]["Id"].ToString());

                int prodid = Convert.ToInt32(e.CommandArgument);
                da = new SqlDataAdapter("select * from Mobiles where Id='" + prodid + "'", con);
                ds = new DataSet();
                da.Fill(ds);

                string Prod_Name = ds.Tables[0].Rows[0]["ModelName"].ToString();
                string Prod_Price = ds.Tables[0].Rows[0]["Price"].ToString();
                string img = ds.Tables[0].Rows[0]["ImagePath"].ToString();

                cmd = new SqlCommand("insert into Wishlist_tbl(User_Id,Prod_Name, Prod_Price, img) values ('"
                    + userid + "','" + Prod_Name + "','" + Prod_Price + "','" + img + "')", con);
                cmd.ExecuteNonQuery();
                Response.Redirect("wishlist.aspx");

            }
        }
    }
}
