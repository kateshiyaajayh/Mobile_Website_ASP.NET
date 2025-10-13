using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

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
                ShowTotal();
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
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
            using (SqlConnection con = new SqlConnection(s))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT ISNULL(SUM(CAST(Prod_Quantity AS INT)),0) FROM Cart_tbl", con);
                int totalQuantity = Convert.ToInt32(cmd.ExecuteScalar());
                lblTotalQuantity.Text = "Total Quantity: " + totalQuantity.ToString();

                cmd = new SqlCommand("SELECT COUNT(DISTINCT User_Cart_Id) FROM Cart_tbl", con);
                int totalUsers = Convert.ToInt32(cmd.ExecuteScalar());
                lblTotalUsers.Text = "Total Users: " + totalUsers.ToString();

                cmd = new SqlCommand("SELECT ISNULL(SUM(CAST(Prod_Price AS DECIMAL) * CAST(Prod_Quantity AS INT)),0) FROM Cart_tbl", con);
                decimal totalMRP = Convert.ToDecimal(cmd.ExecuteScalar());
                lblTotalMRP.Text = "Total MRP: ₹ " + totalMRP.ToString("0.00");

            }
        }
    }
}
