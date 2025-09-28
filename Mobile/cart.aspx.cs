using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
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
            int Uid = Convert.ToInt16(ds.Tables[0].Rows[0][0]);
            DataSet cartds = new DataSet();
            da = new SqlDataAdapter("SELECT Prod_Cart_Id, Prod_Name, Prod_Price,Prod_Quantity, img FROM Cart_tbl WHERE User_Cart_Id=" + Uid, con);
            da.Fill(cartds);
            SvCart.DataSource = cartds;
            SvCart.DataBind();

        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "cmd_cart")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                Response.Redirect("Cart.aspx?id=" + id);
            }
        }

        protected void gvcart_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void SvCart_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }
    }
}
