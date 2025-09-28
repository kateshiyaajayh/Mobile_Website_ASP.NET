using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mobile
{
    public partial class Admin_add_company : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        Class1 cs;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            getcon();

        }
        void getcon()
        {
            cs = new Class1();
            cs.startcon();
        }

        void clen()
        {
            txtcom.Text = "";
        }
        protected void Button1_Click(object sender, EventArgs e)
        {

            getcon();
            cs.insert(txtcom.Text);
            clen();
            Response.Redirect("Products.aspx");
        }
    }
}