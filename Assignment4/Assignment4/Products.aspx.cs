using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WinnipegMarketClassLIbrary;
using System.Data.SqlClient;
using DAL_Project;
using System.Configuration;
using System.Data;

namespace Assignment4
{
    public partial class Products : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                DisplayProducts();
            }
        }

        private void DisplayProducts()
        {
            DAL d = new DAL(conn);
            dlProducts.DataSource = d.ExecuteProcedure("spSearchProducts");
            dlProducts.DataBind();
        }
    }
}