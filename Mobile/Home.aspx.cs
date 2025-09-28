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
        }
    }
}
