using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WinnipegMarketClassLIbrary;

namespace Assignment4
{
    public class Security
    {
        public static Users CurrentUser
        {
            get
            {
                return HttpContext.Current.Session["User"] == null ? null : (Users)HttpContext.Current.Session["User"];
            }
        }

        public static void Login(string userName, string password)
        {
            HttpContext.Current.Session["User"] = Users.Login(userName, password);
        }
    }
}