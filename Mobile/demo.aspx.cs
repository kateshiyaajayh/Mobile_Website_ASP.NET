
using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using CrystalDecisions.CrystalReports.Engine;

namespace Mobile
{
    public partial class demo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ReportDocument rptDoc = new ReportDocument();
                string reportPath = Server.MapPath("CheckoutAddressReport.rpt");

                // Connection string from Web.config file
                string connStr = ConfigurationManager.ConnectionStrings["YourConnectionStringName"].ConnectionString;
                SqlConnection con = new SqlConnection(connStr);
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM CheckoutAddress", con);
                DataSet ds = new DataSet();
                da.Fill(ds, "CheckoutAddress");

                rptDoc.Load(reportPath);
                rptDoc.SetDataSource(ds.Tables["CheckoutAddress"]);

                CrystalReportViewer1.ReportSource = rptDoc;
                CrystalReportViewer1.DataBind();
            }
        }
    }
}
