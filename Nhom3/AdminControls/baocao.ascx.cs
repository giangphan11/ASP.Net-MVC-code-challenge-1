using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Nhom3.AdminControls
{
    public partial class baocao : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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