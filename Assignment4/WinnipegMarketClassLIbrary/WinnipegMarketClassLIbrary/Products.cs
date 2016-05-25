using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL_Project;
using System.Configuration;

namespace WinnipegMarketClassLIbrary
{
    public class Products
    {
        public int Id { get; set; }
        public string Product { get; set; }
        public decimal Price { get; set; }
        public Categories Category { get; set; }
        public Brands Brand { get; set; }
        public Stores Store { get; set; }
        public Products()
        {

        }

        public Products(int Id, string Product, decimal Price, Categories Category, Brands Brand, Stores Store)
        {
            this.Id = Id;
            this.Product = Product;
            this.Price = Price;
            this.Category = Category;
            this.Brand = Brand;
            this.Store = Store;
        }
        public void GetAllProducts()
        {
            DAL d = new DAL(ConfigurationManager.ConnectionStrings["dbWinnipegMarket"].ConnectionString);
            d.ExecuteProcedure("spSearchProducts");
        }

        public void SearchProductsByID(int Id)
        {
            DAL d = new DAL(ConfigurationManager.ConnectionStrings["dbWinnipegMarket"].ConnectionString);
            d.AddParam("Pro_ID", Id);
            d.ExecuteProcedure("spSearchProducts");
        }
        public void SearchProductsByBrand(int Brand)
        {
            DAL d = new DAL(ConfigurationManager.ConnectionStrings["dbWinnipegMarket"].ConnectionString);
            d.AddParam("Brand", Brand); 
            d.ExecuteProcedure("spSearchProducts");
        }
        public void SearchProductsByCategory(int Category)
        {
            DAL d = new DAL(ConfigurationManager.ConnectionStrings["dbWinnipegMarket"].ConnectionString);
            d.AddParam("Category", Category);
            d.ExecuteProcedure("spSearchProducts");
        }
        public void SearchProductsByStore(int Store)
        {
            DAL d = new DAL(ConfigurationManager.ConnectionStrings["dbWinnipegMarket"].ConnectionString);
            d.AddParam("Store", Store);
            d.ExecuteProcedure("spSearchProducts");
        }
    }
}
