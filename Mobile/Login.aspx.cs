using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;


namespace Mobile
{
    public partial class WebForm2 : System.Web.UI.Page
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
        }
        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            getcon();
            cmd = new SqlCommand("SELECT * FROM Register WHERE Email='" + txtEmail.Text.Trim() + "' AND Password='" + txtPassword.Text.Trim() + "'", con);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                dr.Read();
                Session["FullName"] = dr["FullName"].ToString();
                Session["Email"] = dr["Email"].ToString();
                Response.Redirect("Home.aspx");
            }
            else
            {
                lblMsg.Text = "Invalid Email or Password";
            }
        }


    }
}

