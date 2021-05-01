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
using DataAccess;
using Core;
namespace Nhom3.AdminControls
{
    public partial class baocao : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                drpDate.DataSource = DateInstance.getListDate();
                drpDate.DataValueField = "DateValue";
                drpDate.DataTextField = "Name";
                drpDate.DataBind();
            }
        }

        protected void drpDate_SelectedIndexChanged(object sender, EventArgs e)
        {
            DateInstance []data2 = DateInstance.getListDate().ToArray();
            DateInstance dateInstance = null;
            for (int i=0; i<data2.Length; i++)
            {
                if(i== drpDate.SelectedIndex)
                {
                    dateInstance = data2[i];
                    break;
                }
            }

            if(dateInstance == null)
            {
                dateInstance = new DateInstance(1, "Hôm nay", DateTime.Now);
            }

   //         ScriptManager.RegisterStartupScript(
   //this, this.GetType(), "alert",
   //"alert('" + dateInstance.DateID + "');location.href='admin.aspx?page=baocao';", true);

            if (HttpContext.Current.Session["dateg"] != null)
            {
                HttpContext.Current.Session["dateg"] = dateInstance;
            }
        }

    }
}