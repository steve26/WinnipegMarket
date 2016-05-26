using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL_Project;
using System.Configuration;

namespace WinnipegMarketClassLIbrary
{
    public class CartItem : Products, IEquatable<CartItem>
    {
        public int Quantity { get; set; }
        public int ProductID { get; set; }
        public decimal SubTotal { get { return Price * Quantity; } }

        public CartItem(int productID, int quantity)
        {
            Products myProduct = Products.GetProductsByID(productID);
            this.Product = myProduct.Product;
            this.Price = myProduct.Price;
            this.Image = myProduct.Image;
            this.Category = myProduct.Category;
            this.Id = myProduct.Id;
            this.Quantity = quantity;
            //this.ProductID = productID;
            //this.Quantity = quantity;
        }

        public bool Equals(CartItem other)
        {
            throw new NotImplementedException();
        }
    }
}
