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
    public class Products
    {
        public int Id { get; set; }
        public string Product { get; set; }
        public decimal Price { get; set; }
        public int Category { get; set; }
        public int Brand { get; set; }
        public int Store { get; set; }
        public string ImagePath { get; set; }
        public Products()
        {

        }

        public Products(int Id, string Product, decimal Price, int Category, int Brand, int Store)
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
            DAL d = new DAL(ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString);
            d.ExecuteProcedure("spSearchProducts");
        }

        public void SearchProductsByID(int Id)
        {
            DAL d = new DAL(ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString);
            d.AddParam("Pro_ID", Id);
            d.ExecuteProcedure("spSearchProducts");
        }
        public static Products GetProductByID(int productID)
        {
            Products result = null;
            DAL_Project.DAL d = new DAL_Project.DAL(ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString);
            d.AddParam("ID", productID);
            DataRow row = d.ExecuteProcedure("spGetProductByID").Tables[0].Rows[0];
            result = GetProductFromDataRow(row);
            return result;
        }
        private static Products GetProductFromDataRow(DataRow row)
        {
            Products p = new Products();
            p.Id = int.Parse(row["Pro_ID"].ToString());
            p.Category = int.Parse(row["Category"].ToString());
            p.Product = row["Pro_Name"].ToString();
            p.Price = decimal.Parse(row["Price"].ToString());
            p.ImagePath = row["Product_Image"].ToString();
            return p;
        }
        public void SearchProductsByBrand(int Brand)
        {
            DAL d = new DAL(ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString);
            d.AddParam("Brand", Brand); 
            d.ExecuteProcedure("spSearchProducts");
        }
        public void SearchProductsByCategory(int Category)
        {
            DAL d = new DAL(ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString);
            d.AddParam("Category", Category);
            d.ExecuteProcedure("spSearchProducts");
        }
        public void SearchProductsByStore(int Store)
        {
            DAL d = new DAL(ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString);
            d.AddParam("Store", Store);
            d.ExecuteProcedure("spSearchProducts");
        }
    }
}
