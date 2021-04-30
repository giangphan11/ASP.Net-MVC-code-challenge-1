using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.Services;

namespace Nhom3
{
    public partial class admin1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] != null)
            {
                PlaceHolder1.Controls.Add(LoadControl("AdminControls/index.ascx"));
            }
            else
            {
                PlaceHolder1.Controls.Add(LoadControl("AdminControls/login.ascx"));
            }
        }

        public static DataTable BindData()
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(@"Data Source=PBGIANG;Initial Catalog=NHOM3;Integrated Security=True");
            conn.Open();
            SqlCommand cmd = new SqlCommand("select * from Results", conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            dt = ds.Tables[0];
            conn.Close();
            return dt;
        }
        [WebMethod]
        public static string GetBarData()
        {
            DataTable dt = BindData();
            dt.TableName = "Bar";
            string result;
            using (StringWriter sw = new StringWriter())
            {
                dt.WriteXml(sw);
                result = sw.ToString();
            }
            return result;
        }
    }
}