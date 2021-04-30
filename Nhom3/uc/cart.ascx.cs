using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;

namespace Nhom3.uc
{
    public partial class cart : System.Web.UI.UserControl
    {
        
        public String url_checkout = "https://www.nganluong.vn/advance_payment.php";

        List<Cart_Temp> list = null;
        protected string tong = "0";
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "Giỏ Hàng";
            try
            {
                list = Session["Cart"] as List<Cart_Temp>;
                if (!Page.IsPostBack)
                {
                    if (Session["Cart"] != null)
                    {
                        BindRepeater();
                    }
                }
            }
            catch (Exception)
            {
                Response.Redirect("Default.aspx");

            }
        }
        
        protected void btnRemove_Click(object sender, EventArgs e)
        {

        }

        protected void rptcartV_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName.ToLower() == "update")
            {
                TextBox txtSl = (TextBox)e.Item.FindControl("txtSoluong");
                string pid = e.CommandArgument.ToString();
                Cart_Temp ct = Cart_Temp.FindProduct(list, int.Parse(pid));
                if (ct != null)
                {
                    ct.amount = int.Parse(txtSl.Text);
                    if(Products_info.getby_id(pid).pcount < ct.amount)
                    {
                        
                        ScriptManager.RegisterStartupScript(
                         this, this.GetType(), "alert",
                         "alert('Số lượng sản phẩm vượt quá số lượng cho phép');" +
                         "location.href='default.aspx?page=cart';", true);

                        ct.amount = 1;
                        BindRepeater();
                    }
                    else
                    {
                        BindRepeater();
                    }


                }             
            }
            if (e.CommandName.ToLower() == "remove")
            {                
                string pid = e.CommandArgument.ToString();
                
                if (pid != null)
                {
                    Cart_Temp.Delete(list, int.Parse(pid));
                }
                BindRepeater();
            }
            if (e.CommandName.ToLower() == "checkout")
            {
                if (Session["user"] == null)
                {
                    Response.Redirect("AccLogin.aspx");
                    return;
                }
              
                Session["Cart"] = null;
                Response.Redirect("Default.aspx");
            }

        }

        private void BindRepeater()
        {
            //tong = Cart_Temp.TongTien(list);
            tong = String.Format("{0:0,0}", Cart_Temp.TongTien(list));
            rptcartV.DataSource = list;
            rptcartV.DataBind();
        }



     


     

        protected void bntTiepTuc_Click(object sender, EventArgs e)
        {
           
        }

        

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (Session["Cart"] == null)
            {


                Response.Redirect("Default.aspx");
            }
            else
            {
                if (Session["admin"] == null)
                {
                    Response.Redirect("Default.aspx?page=chonptthanhtoan");
                }
                else
                {
                    Response.Redirect("Default.aspx?page=checkout");

                }
            }
        }


    }
}