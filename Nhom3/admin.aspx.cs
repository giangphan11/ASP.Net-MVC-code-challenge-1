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
using Core;
using System.Web.Services;
using Nhom3.AdminControls;
namespace Nhom3
{
    public partial class admin1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            intiDate();
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
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = conn;
            DateInstance dateInstance = (DateInstance)HttpContext.Current.Session["DateG"];
            if(dateInstance!= null)
            {
                if (dateInstance.DateID > 2)
                {
                    cmd.CommandText = "thongkeDonHang2Date";
                    cmd.Parameters.Add("@ngay1", SqlDbType.Date).Value = getDate().DateValue;
                    cmd.Parameters.Add("@ngay2", SqlDbType.Date).Value = DateTime.Now;
                }
                else
                {
                    cmd.CommandText = "thongkeDonHang";
                    cmd.Parameters.Add("@ngay", SqlDbType.Date).Value = getDate().DateValue;
                }
            }
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            dt = ds.Tables[0];
            conn.Close();
            return dt;
        }

        public static DataTable BindDataTotalAmoutByMonth()
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(@"Data Source=PBGIANG;Initial Catalog=NHOM3;Integrated Security=True");
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = conn;
            cmd.CommandText = "reportTotalAmoutByMonth";
            var numDayOfMonth = DateTime.DaysInMonth(2021, DateTime.Now.Month);
            cmd.Parameters.Add("@date1", SqlDbType.Date).Value = DateTime.Now.AddDays(-numDayOfMonth);
            cmd.Parameters.Add("@date2", SqlDbType.Date).Value = DateTime.Now;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            dt = ds.Tables[0];
            conn.Close();
            return dt;
        }

        private void intiDate()
        {

            if(HttpContext.Current.Session["DateG"] == null)
            {
                HttpContext.Current.Session["DateG"] = new DateInstance(1, "Hôm nay", DateTime.Now);
            }
        }

        private static DateInstance getDate()
        {
            return (DateInstance) HttpContext.Current.Session["DateG"] != null ? (DateInstance) HttpContext.Current.Session["DateG"] : null;
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

        [WebMethod]
        public static string GetBarDataLala()
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

        [WebMethod]
        public static string GetBarDataTotalAmoutByMonth()
        {
            DataTable dt = BindDataTotalAmoutByMonth();
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