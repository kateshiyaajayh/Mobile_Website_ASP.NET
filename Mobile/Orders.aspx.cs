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
    public partial class Orders : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        DataSet ds;
        SqlCommand cmd;

        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                fill();
                BindGrid();
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        private void BindGrid()
        {
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Cart_tbl", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        private void fill()
        {
            getcon();
            SqlCommand cmd = new SqlCommand("SELECT * FROM Cart_tbl", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            GridViewOrders.DataSource = dt;
            GridViewOrders.DataBind();
        }
        private void ShowTotal()
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("SELECT SUM(Prod_Quantity) FROM Cart_tbl", con);
                con.Open();
                int totalQuantity = Convert.ToInt32(cmd.ExecuteScalar());
                con.Close();

                lblTotalQuantity.Text = "Total Quantity: " + totalQuantity.ToString();

                cmd = new SqlCommand("SELECT COUNT(DISTINCT User_Cart_Id) FROM Cart_tbl", con);
                con.Open();
                int totalUsers = Convert.ToInt32(cmd.ExecuteScalar());
                con.Close();

                lblTotalUsers.Text = "Total Users: " + totalUsers.ToString();
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }
    }
}