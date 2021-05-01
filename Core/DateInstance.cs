using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Core
{
    public class DateInstance
    {
        public int DateID { get; set; }
        public String Name { get; set; }
        public DateTime DateValue { get; set; }

        public DateInstance() { }

        public DateInstance(int dateID, String name, DateTime v)
        {
            this.DateID = dateID;
            this.Name = name;
            this.DateValue = v;
        }

        public static List<DateInstance> getListDate()
        {
            List<DateInstance> lst = new List<DateInstance>();
            lst.Add(new DateInstance(1, "Hôm nay", DateTime.Now));
            lst.Add(new DateInstance(2, "Hôm qua", DateTime.Now.AddDays(-1)));
            lst.Add(new DateInstance(3, "Tuần này", DateTime.Now.AddDays(-7)));
            var numDayOfMonth = DateTime.DaysInMonth(2021, DateTime.Now.Month);
            lst.Add(new DateInstance(4, "Tháng này", DateTime.Now.AddDays(-numDayOfMonth)));
            return lst;
        }
    }
}
