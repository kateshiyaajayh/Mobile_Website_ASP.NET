using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Configuration;
using System.Data;
using System.Data.SqlClient;


namespace Mobile
{
    public partial class WebForm1 : System.Web.UI.Page
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
        void clen()
        {
            txtName.Text = "";
            txtPassword.Text = "";
            txtConfirm.Text = "";
            txtEmail.Text = "";
            txtMobile.Text = "";

        }
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            getcon();
            cmd = new SqlCommand("insert into Register(FullName,Email,Mobile,Password,ConfirmPassword) values('"+txtName.Text+"','"+txtEmail.Text+"','"+txtMobile.Text+"','"+txtPassword.Text+"','"+txtConfirm.Text+"')",con);
            cmd.ExecuteNonQuery();
            Session["FullName"] = txtName.Text.Trim();
            Session["Email"] = txtEmail.Text.Trim();
            clen();
            Response.Redirect("Home.aspx");
            
        }
    }
}