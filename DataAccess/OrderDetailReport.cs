using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Core;
namespace DataAccess
{
    public class OrderDetailReport
    {
        public int orderid { get; set; }
        public float tongtien { get; set; }

        public static List<OrderDetailReport> getall()
        {
            return CBO.FillCollection<OrderDetailReport>(DataProvider.Instance.ExecuteReader("thongkeDonHang", "5/01/2021 12:00:00 AM"));
        }
    }
}
