using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using DAL_Project;

namespace WinnipegMarketClassLIbrary
{
    public class Brands
    {
        public int Id { get; set; }
        public string Brand { get; set; }
        public Brands() { }
        public Brands(int Id, string Brand)
        {
            this.Id = Id;
            this.Brand = Brand;
        }
        public void GetAllBrands()
        {
            DAL d = new DAL(ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString);
            d.ExecuteProcedure("spGetBrandsByID");
        }
    }
}
