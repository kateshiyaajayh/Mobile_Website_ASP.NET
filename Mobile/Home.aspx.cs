using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Mobile
{
    public partial class Home : System.Web.UI.Page
    {

        string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlDataAdapter da;
        SqlCommand cmd;
        SqlConnection con;
        DataSet ds;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Email"] == null)
            {
                Response.Redirect("Register.aspx");
            }
            if (!IsPostBack)
            {
                BindProducts();
                getcon();
            }
        }
        void getcon()
        {
            SqlConnection con = new SqlConnection(constr);
        }
        private void BindProducts()
        {
            using (SqlConnection con = new SqlConnection(constr))
            {
                getcon();
                da = new SqlDataAdapter("SELECT * FROM Mobiles ORDER BY NEWID()", con);
                ds = new DataSet();
                da.Fill(ds);
                rptProducts.DataSource = ds;
                rptProducts.DataBind();
            }
        }
        protected void rptProducts_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "cmd_view")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                Response.Redirect("ViewDetail.aspx?id=" + id);
            }
            else if (e.CommandName == "cmd_cart")
            {

                getcon();
                SqlDataAdapter da = new SqlDataAdapter("select * from Register where Email='" + Session["Email"] + "'", con);
                ds = new DataSet();
                da.Fill(ds);
                int userid = Convert.ToInt32(ds.Tables[0].Rows[0]["Id"].ToString());

                int prodid = Convert.ToInt32(e.CommandArgument);
                da = new SqlDataAdapter("select * from Mobiles where Id='" + prodid + "'", con);
                ds = new DataSet();
                da.Fill(ds);

                string prodname = ds.Tables[0].Rows[0][2].ToString();
                string prodprc = ds.Tables[0].Rows[0][4].ToString();
                string img = ds.Tables[0].Rows[0][5].ToString();
                int quantity = 1;

                cmd = new SqlCommand("insert into Cart_tbl(User_Cart_Id, Prod_Cart_Id, Prod_Name, Prod_Price, Prod_Quantity, img) values ('" + userid + "','" + prodid + "','" + prodname + "','" + prodprc + "','" + quantity + "','" + img + "')", con);
                cmd.ExecuteNonQuery();
                Response.Redirect("Cart.aspx");
            }

        }
        private void BindProducts(string keyword = "")
        {
            using (SqlConnection con = new SqlConnection(constr))
            {
                string query = "SELECT * FROM Mobiles";

                if (!string.IsNullOrEmpty(keyword))
                {
                    query += " WHERE " +
                             "CAST(Id AS NVARCHAR) LIKE @keyword OR " +
                             "Brand LIKE @keyword OR " +
                             "ModelName LIKE @keyword OR " +
                             "Color LIKE @keyword OR " +
                             "Storage LIKE @keyword OR " +
                             "RAM LIKE @keyword OR " +
                             "BatteryCapacity LIKE @keyword";
                }

                query += " ORDER BY NEWID()";

                da = new SqlDataAdapter(query, con);
                da.SelectCommand.Parameters.AddWithValue("@keyword", "%" + keyword + "%");
                ds = new DataSet();
                da.Fill(ds);

                rptProducts.DataSource = ds;
                rptProducts.DataBind();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string keyword = txtSearch.Text.Trim();
            BindProducts(keyword);
        }

    }
}
