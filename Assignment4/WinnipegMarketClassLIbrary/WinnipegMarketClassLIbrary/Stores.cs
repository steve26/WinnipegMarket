using DAL_Project;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WinnipegMarketClassLIbrary
{
    public class Stores
    {
        public int Id { get; set; }
        public string Store { get; set; }

        public Stores()
        {

        }
        public Stores(int Id, string Store)
        {
            this.Id = Id;
            this.Store = Store;
        }
        public void GetAllStores()
        {
            DAL d = new DAL(ConfigurationManager.ConnectionStrings["dbWinnipegMarket"].ConnectionString);
            d.ExecuteProcedure("spGetStoresByID");
        }
    }
}
