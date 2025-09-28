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
    public partial class ViewDetail : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        string fnm;

        protected void Page_Load(object sender, EventArgs e)
        {
            getcon();
            fill();
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void fill()
        {
            da = new SqlDataAdapter("select * from Mobiles where Id='" + Request.QueryString["id"] + "'", con);
            ds = new DataSet();
            da.Fill(ds);
            DataList1.DataSource = ds;
            DataList1.DataBind();

        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "cmd_View")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                Response.Redirect("ViewDetail.aspx?id=" + id);
            }
        }

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
