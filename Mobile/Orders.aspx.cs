using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Globalization;

namespace Mobile
{
    public partial class Orders : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindOrders();
            }
        }

        void BindOrders()
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT OrderID, UserID, OrderDate, TotalAmount, Status FROM Orders", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }

        // ✏️ Edit
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            BindOrders();
        }

        // ❌ Cancel Edit
        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            BindOrders();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
                GridViewRow row = GridView1.Rows[e.RowIndex];

                string totalAmountText = ((TextBox)row.Cells[3].Controls[0]).Text.Trim();
                string statusText = ((TextBox)row.Cells[4].Controls[0]).Text.Trim();

                if (!decimal.TryParse(totalAmountText, NumberStyles.Any, CultureInfo.InvariantCulture, out decimal totalAmount))
                {
                    lblMsg.Text = "⚠ Invalid TotalAmount value.";
                    return;
                }

                string statusEscaped = statusText.Replace("'", "''");
                string totalAmountStr = totalAmount.ToString(CultureInfo.InvariantCulture);

                string query = "UPDATE Orders SET TotalAmount='" + totalAmountStr + "', Status='" + statusEscaped + "' WHERE OrderID='" + id + "'";

                SqlConnection con = new SqlConnection(s);
                con.Open();
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                con.Close();

                GridView1.EditIndex = -1;
                BindOrders();
                lblMsg.Text = "✅ Order updated successfully!";
            }
            catch (Exception ex)
            {
                lblMsg.Text = "❌ Error: " + ex.Message;
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

                string query = "DELETE FROM Orders WHERE OrderID='" + id + "'";

                SqlConnection con = new SqlConnection(s);
                con.Open();
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                con.Close();

                BindOrders();
                lblMsg.Text = "❌ Order deleted successfully!";
            }
            catch (Exception ex)
            {
                lblMsg.Text = "❌ Error: " + ex.Message;
            }
        }
    }
}
