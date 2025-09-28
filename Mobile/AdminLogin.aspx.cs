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
    public partial class AdminLogin : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        string fnm;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private bool RegisterAdmin(string username, string password)
        {
            bool success = false;

            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\AJAY\source\repos\Mobile\Mobile\App_Data\Database1.mdf;Integrated Security=True");
            con.Open();

            string query = "INSERT INTO AdminUsers (Username, Password) VALUES ('" + username + "', '" + password + "')";
            SqlCommand cmd = new SqlCommand(query, con);

            int rows = cmd.ExecuteNonQuery();
            con.Close();

            if (rows > 0)
                success = true;

            return success;
        }

        // Method: Check if admin exists
        private bool IsAdminExist(string username, string password)
        {
            bool exists = false;

            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\AJAY\source\repos\Mobile\Mobile\App_Data\Database1.mdf;Integrated Security=True");
            con.Open();

            string query = "SELECT COUNT(*) FROM AdminUsers WHERE Username='" + txtUsername.Text + "' AND Password='" + txtPassword.Text + "'";
            SqlCommand cmd = new SqlCommand(query, con);

            int count = Convert.ToInt32(cmd.ExecuteScalar());
            con.Close();

            if (count > 0)
                exists = true;

            return exists;
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();

            if (username == "rkuajay" && password == "rkuajay12345$12345")
            {
                Session["AdminUser"] = username;
                Response.Redirect("Admin_add_company.aspx"); 
            }
            else
            {
                Response.Write("<script>alert('Invalid Username or Password!');</script>");
            }
        }
    }
}