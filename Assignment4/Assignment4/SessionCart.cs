using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WinnipegMarketClassLIbrary;

namespace Assignment4
{
    public class SessionCart
    {
        public static readonly ShoppingCart Instance;


       static SessionCart()
        {
            HttpContext.Current.Session["ShoppingCart"] = HttpContext.Current.Session["ShoppingCart"] ?? new ShoppingCart();
            Instance = (ShoppingCart)HttpContext.Current.Session["ShoppingCart"];
        }

        public static void AbandonCart()
        {
            Instance.Cart.Clear();
        }
        public static int Count()
        {
            int x = Instance.Cart.Count();
            return x;
        }
    }
}