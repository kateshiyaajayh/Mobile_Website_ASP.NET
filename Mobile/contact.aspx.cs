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
    public partial class contact : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        string fnm;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Email"] == null)
            {
                Response.Redirect("Register.aspx");
            }
            if (Session["Email"] == null)
            {
                Response.Redirect("Register.aspx");
            }
            if (!IsPostBack)
            {
                BindCart();
            }
        }

        private void BindCart()
        {
            DataTable dtCart = Session["Cart"] as DataTable;
            if (dtCart != null)
            {
                gvCart.DataSource = dtCart;
                gvCart.DataBind();
                CalculateTotal(dtCart);
            }
        }

        protected void gvCart_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            DataTable dtCart = Session["Cart"] as DataTable;
            if (dtCart != null)
            {
                int index = e.RowIndex;
                GridViewRow row = gvCart.Rows[index];
                TextBox txtQty = (TextBox)row.FindControl("txtQty");
                int newQty = int.Parse(txtQty.Text);

                dtCart.Rows[index]["Quantity"] = newQty;
                Session["Cart"] = dtCart;
                gvCart.EditIndex = -1;
                BindCart();
            }
        }

        protected void gvCart_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DataTable dtCart = Session["Cart"] as DataTable;
            if (dtCart != null)
            {
                dtCart.Rows[e.RowIndex].Delete();
                dtCart.AcceptChanges();
                Session["Cart"] = dtCart;
                BindCart();
            }
        }

        private void CalculateTotal(DataTable dtCart)
        {
            decimal total = 0;
            foreach (DataRow row in dtCart.Rows)
            {
                int qty = (int)row["Quantity"];
                decimal price = Convert.ToDecimal(row["Price"]);
                total += qty * price;z
            }
            lblTotal.Text = "Total: " + total.ToString("C");
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

        }
    }
}
