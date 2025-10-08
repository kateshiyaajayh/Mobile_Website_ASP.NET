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
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
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
            con.Close();
        }

        protected void drpFilterBrand_SelectedIndexChanged(object sender, EventArgs e)
        {
            fill();
        }

        protected void rptMobiles_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "cmd_view")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                Response.Redirect("ViewDetail.aspx?id=" + id);
            }
            else if (e.CommandName == "cmd_cart")
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

                string prodname = ds.Tables[0].Rows[0]["ModelName"].ToString();
                string prodprc = ds.Tables[0].Rows[0]["Price"].ToString();
                string img = ds.Tables[0].Rows[0]["ImagePath"].ToString();  
                int quantity = 1;

                cmd = new SqlCommand("insert into Cart_tbl(User_Cart_Id, Prod_Cart_Id, Prod_Name, Prod_Price, Prod_Quantity, img) values ('"
                    + userid + "','" + prodid + "','" + prodname + "','" + prodprc + "','" + quantity + "','" + img + "')", con);
                cmd.ExecuteNonQuery();
                Response.Redirect("Cart.aspx");
            }
        }
    }
}
