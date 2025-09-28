using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mobile
{
    public partial class Products : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;

        string imag1 = "";
        string imag2 = "";
        string imag3 = "";
        string imag4 = "";
        string imag5 = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fill();
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void fill()
        {
            getcon();
            da = new SqlDataAdapter("SELECT * FROM Mobiles", con);
            ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
           
        }

        void SaveImages()
        {
            if (FileUpload1.HasFile)
            {
                imag1 = "images/" + FileUpload1.FileName;
                FileUpload1.SaveAs(Server.MapPath(imag1));
            }
            if (FileUpload2.HasFile)
            {
                imag2 = "images/" + FileUpload2.FileName;
                FileUpload2.SaveAs(Server.MapPath(imag2));
            }
            if (FileUpload3.HasFile)
            {
                imag3 = "images/" + FileUpload3.FileName;
                FileUpload3.SaveAs(Server.MapPath(imag3));
            }
            if (FileUpload4.HasFile)
            {
                imag4 = "images/" + FileUpload4.FileName;
                FileUpload4.SaveAs(Server.MapPath(imag4));
            }
            if (FileUpload5.HasFile)
            {
                imag5 = "images/" + FileUpload5.FileName;
                FileUpload5.SaveAs(Server.MapPath(imag5));
            }
        }

        void clen()
        {
            drpbrand.SelectedValue = "--select--";
            txtmodelnm.Text = "";
            txtprise.Text = "";
            txtstok.Text = "";
            drpram.SelectedValue = "--Select--";
            drpdtor.SelectedValue = "--Select--";
            txtcolor.Text = "";
            txtbatry.Text = "";
            txtcamdt.Text = "";
            drpos.SelectedValue = "--Select--";
            txtdesc.Text = "";
            txtdate.Text = "";
            txtadd.Text = "Save";
            ViewState["EditId"] = null;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            getcon();
            SaveImages();

            if (txtadd.Text == "Save")
            {
                cmd = new SqlCommand("INSERT INTO Mobiles (Brand, ModelName, Price, StockQty, RAM, Storage, Color, BatteryCapacity, CameraDetails, OS, Description, ImagePath, ImagePath1, ImagePath2, ImagePath3, ImagePath4, LaunchDate) " +
                                     "VALUES ('" + drpbrand.SelectedValue + "','" + txtmodelnm.Text + "','" + txtprise.Text + "','" + txtstok.Text + "','" + drpram.SelectedValue + "','" + drpdtor.SelectedValue + "','" + txtcolor.Text + "','" + txtbatry.Text + "','" + txtcamdt.Text + "','" + drpos.SelectedValue + "','" + txtdesc.Text + "','" + imag1 + "','" + imag2 + "','" + imag3 + "','" + imag4 + "','" + imag5 + "','" + txtdate.Text + "')", con);
                cmd.ExecuteNonQuery();
            }
            else if (txtadd.Text == "Update" && ViewState["EditId"] != null)
            {
                string updateQuery = "UPDATE Mobiles SET Brand='" + drpbrand.SelectedValue +
                                     "', ModelName='" + txtmodelnm.Text +
                                     "', Price='" + txtprise.Text +
                                     "', StockQty='" + txtstok.Text +
                                     "', RAM='" + drpram.SelectedValue +
                                     "', Storage='" + drpdtor.SelectedValue +
                                     "', Color='" + txtcolor.Text +
                                     "', BatteryCapacity='" + txtbatry.Text +
                                     "', CameraDetails='" + txtcamdt.Text +
                                     "', OS='" + drpos.SelectedValue +
                                     "', Description='" + txtdesc.Text +
                                     "', LaunchDate='" + txtdate.Text + "'";
                if (!string.IsNullOrEmpty(imag1))
                    updateQuery += ", ImagePath='" + imag1 + "'";
                if (!string.IsNullOrEmpty(imag2))
                    updateQuery += ", ImagePath1='" + imag2 + "'";
                if (!string.IsNullOrEmpty(imag3))
                    updateQuery += ", ImagePath2='" + imag3 + "'";
                if (!string.IsNullOrEmpty(imag4))
                    updateQuery += ", ImagePath3='" + imag4 + "'";
                if (!string.IsNullOrEmpty(imag5))
                    updateQuery += ", ImagePath4='" + imag5 + "'";
                updateQuery += " WHERE Id='" + ViewState["EditId"].ToString() + "'";
                cmd = new SqlCommand(updateQuery, con);
                cmd.ExecuteNonQuery();

                txtadd.Text = "Save";
                ViewState["EditId"] = null;
            }
            fill();
            clen();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string id = e.CommandArgument.ToString();

            if (e.CommandName == "cmd_del")
            {
                getcon();
                cmd  = new SqlCommand ("DELETE FROM Mobiles WHERE Id='" + id + "'",con);
                cmd.ExecuteNonQuery();
                fill();
            }
            else if (e.CommandName == "cmd_edt")
            {
                getcon();
                cmd = new SqlCommand("SELECT * FROM Mobiles WHERE Id='" + id + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    drpbrand.SelectedValue = dr["Brand"].ToString();
                    txtmodelnm.Text = dr["ModelName"].ToString();
                    txtprise.Text = dr["Price"].ToString();
                    txtstok.Text = dr["StockQty"].ToString();
                    drpram.SelectedValue = dr["RAM"].ToString();
                    drpdtor.SelectedValue = dr["Storage"].ToString();
                    txtcolor.Text = dr["Color"].ToString();
                    txtbatry.Text = dr["BatteryCapacity"].ToString();
                    txtcamdt.Text = dr["CameraDetails"].ToString();
                    drpos.SelectedValue = dr["OS"].ToString();
                    txtdesc.Text = dr["Description"].ToString();
                    txtdate.Text = dr["LaunchDate"].ToString();
                    ViewState["EditId"] = id;
                    txtadd.Text = "Update";
                }

            }

        }
        protected void drpbrand_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

    }
}
