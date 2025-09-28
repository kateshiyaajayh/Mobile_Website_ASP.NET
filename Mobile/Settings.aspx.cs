using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mobile
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // TODO: Load current settings from database
                // txtUsername.Text = ...
                // txtEmail.Text = ...
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();
            string email = txtEmail.Text.Trim();

            // TODO: Update logic (DB update)
            // Example:
            // SqlCommand cmd = new SqlCommand("UPDATE AdminUsers SET Username=@u, Password=@p, Email=@e WHERE Id=1", con);

            Response.Write("<script>alert('✅ Settings updated successfully!');</script>");
        }
    }
}