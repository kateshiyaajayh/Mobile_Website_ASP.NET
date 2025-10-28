using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Mobile
{
    public partial class Home : System.Web.UI.Page
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
                Response.Redirect("Login.aspx");
                return;
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

            rptProducts.DataSource = ds;
            rptProducts.DataBind();

            con.Close();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string keyword = TextBox1.Text.Trim();
            BindProducts(keyword);
        }

        protected void rptProducts_ItemCommand(object source, RepeaterCommandEventArgs e)
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

                con.Close();
            }
        }
    }
}
