using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL_Project;
using System.Configuration;
using System.Data.SqlClient;

namespace WinnipegMarketClassLIbrary
{
    
    public class Categories
    {
        public int Id { get; set; }
        public string Category { get; set; }

        public Categories(){}
        public Categories(int Id, string Category)
        {
            this.Id = Id;
            this.Category = Category;
        }
        public void spGetCategories()
        {
            DAL d = new DAL(ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString);
            d.ExecuteProcedure("spGetCategoriesById");
        }
    }
}
