using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.IO;
using System.Web.UI.WebControls;
using Core;

namespace Nhom3
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session[AppConstant.KEY_TRAFFIC] == null)
            {
                Session[AppConstant.KEY_TRAFFIC] =1;
            }
            else
            {
                Session[AppConstant.KEY_TRAFFIC] = 2;
            }
            int check = (int)Session[AppConstant.KEY_TRAFFIC];
            Session[AppConstant.KEY_TRAFFIC] = 2;
            if (check == 1)
            {
                //Kiểm tra nếu chưa tồn tại file thì tạo file Count_Visited.txt
                if (!File.Exists(Server.MapPath("uploads/demtruycap.txt")))
                    File.WriteAllText(Server.MapPath("uploads/demtruycap.txt"), "0");
                Application["DaTruyCap"] = int.Parse(File.ReadAllText(Server.MapPath("uploads/demtruycap.txt")));

                // Tăng số đang truy cập lên 1 nếu có khách truy cập
                if (Application["DangTruyCap"] == null)
                    Application["DangTruyCap"] = 1;
                else
                    Application["DangTruyCap"] = (int)Application["DangTruyCap"] + 1;
                // Tăng số đã truy cập lên 1 nếu có khách truy cập
               // Application["DaTruyCap"] = (int)Application["DaTruyCap"] + 1;
                File.WriteAllText(Server.MapPath("uploads/demtruycap.txt"), Application["DaTruyCap"].ToString());
            }
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
           
        }
    }
}