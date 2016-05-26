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
        public string Image { get; set; }
        public decimal Price { get; set; }
        public string Category { get; set; }
        public string Brand { get; set; }
        public string Store { get; set; }

        public void GetAllProducts()
        {
            DAL d = new DAL(ConfigurationManager.ConnectionStrings["dbWinnipegMarket"].ConnectionString);
            d.ExecuteProcedure("spSearchProducts");
        }

        public void GetProductsByID(int Id)
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
        public void NewProducts()
        {
            DAL d = new DAL(ConfigurationManager.ConnectionStrings["dbWinnipegMarket"].ConnectionString);
            d.ExecuteProcedure("spNewProducts");

            
        }
        
    }
}
