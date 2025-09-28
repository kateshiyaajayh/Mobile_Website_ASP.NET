using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Mobile
{
    public class Class1
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;

        public SqlConnection startcon()
        {
            con = new SqlConnection(s);
            con.Open();
            return con;
        }

        public void insert(string nm)
        {
            cmd = new SqlCommand("insert into Add_compny(Addcompany) values('" + nm + "')", con);
            cmd.ExecuteNonQuery();

        }
    }
}