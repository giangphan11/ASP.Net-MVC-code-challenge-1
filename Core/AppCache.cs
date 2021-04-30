using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Core
{
    public class AppCache
    {
        private static AppCache instance;

        public static AppCache getInstance()
        {
            if (instance == null)
            {
                instance = new AppCache();
            }
            return instance;
        }

        public void saveCacheApplication (String key)
        {
        }
    }
}
