using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL_Project;
using System.Configuration;
using System.Data;

namespace WinnipegMarketClassLIbrary
{
    public class ShoppingCart
    {
        public int id { get; set; }
        public int ProductID { get; set; }
        public int Quantity { get; set; }
        public int orderID { get; set; }
        public decimal PricePaid { get; set; }
        public List<CartItem> Cart { get; set; }
        public ShoppingCart()
        {
            Cart = new List<CartItem>();
        }
        public void AddToCart(int ProductID, int Quantity)
        {
            CartItem item = new CartItem(ProductID, Quantity);
            Cart.Add(item);
        }
        public void UpdateCartItem(int orderID, int quantity)
        {
            CartItem item = new CartItem(orderID, quantity);
            foreach (var Item in Cart.Where(Item => item.Equals(item)))
            {
                Item.Quantity = quantity;
            }
            Cart.Equals(item);
        }
        public void RemoveCartItem(int ID)
        {
            Cart.RemoveAt(ID);
        }
        public void RemoveAll()
        {
            DAL d = new DAL(ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString);
            DataSet ds = d.ExecuteProcedure("spGetOrderDetails");
            int count = ds.Tables[0].Rows.Count;
            do
            {
                DAL d2 = new DAL(ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString);
                d2.AddParam("OrderID", Convert.ToInt32(ds.Tables[0].Rows[count - 1]["OrderID"]));
                d2.ExecuteProcedure("spCheckOut");
                count--;
            }
            while (count > 0);
        }
        public int CheckOut(int CustomerID, DateTime date, decimal price)
        {
            DAL d = new DAL(ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString);
            d.AddParam("Customer", CustomerID);
            d.AddParam("Order_Date", date);
            d.AddParam("Prics_Paid", price);
            DataSet ds = d.ExecuteProcedure("spAddOrders");
            return 1;
        }

    }
}
