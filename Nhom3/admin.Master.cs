using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Nhom3
{
    public partial class admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session["admin"] = null;
            Session["name"] = null;
            Session["role"] = null;
            Session["email"] = null;
            Response.Redirect("admin.aspx");   
        }
    }
}