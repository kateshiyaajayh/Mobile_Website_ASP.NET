using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Mobile
{
    public partial class Dashboard : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindPaymentDetails();
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void BindPaymentDetails()
        {
            SqlDataAdapter da = new SqlDataAdapter("SELECT PaymentID, OrderID, UserID, PaymentMethod, TransactionID, Amount, PaymentStatus, PaymentDate FROM PaymentDetails", s);
            DataTable dt = new DataTable();
            da.Fill(dt);
            GridViewPaymentDetails.DataSource = dt;
            GridViewPaymentDetails.DataBind();
        }

        protected void GridViewPaymentDetails_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewPaymentDetails.EditIndex = e.NewEditIndex;
            BindPaymentDetails();
        }

        protected void GridViewPaymentDetails_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewPaymentDetails.EditIndex = -1;
            BindPaymentDetails();
        }

        protected void GridViewPaymentDetails_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int paymentId = Convert.ToInt32(GridViewPaymentDetails.DataKeys[e.RowIndex].Value);

            GridViewRow row = GridViewPaymentDetails.Rows[e.RowIndex];
            int orderId = Convert.ToInt32(((TextBox)row.Cells[1].Controls[0]).Text);
            int userId = Convert.ToInt32(((TextBox)row.Cells[2].Controls[0]).Text);
            string paymentMethod = ((TextBox)row.Cells[3].Controls[0]).Text;
            string transactionId = ((TextBox)row.Cells[4].Controls[0]).Text;
            decimal amount = Convert.ToDecimal(((TextBox)row.Cells[5].Controls[0]).Text);
            string paymentStatus = ((TextBox)row.Cells[6].Controls[0]).Text;
            string paymentDate = ((TextBox)row.Cells[7].Controls[0]).Text;

            getcon();
         
        }

        protected void GridViewPaymentDetails_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int paymentId = Convert.ToInt32(GridViewPaymentDetails.DataKeys[e.RowIndex].Value);
            getcon();
            SqlCommand cmd = new SqlCommand("DELETE FROM PaymentDetails WHERE PaymentID=" + paymentId, con);
            cmd.ExecuteNonQuery();
            con.Close();
            BindPaymentDetails();
        }
    }
}
