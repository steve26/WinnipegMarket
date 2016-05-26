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
                NewProductList();
                BrandList();
            }
        }

        private void BrandList()
        {
            DAL d = new DAL(conn);
            dlBrands.DataSource = d.ExecuteProcedure("spGetBrandsByID");
            dlBrands.DataBind();
        }

        private void NewProductList()
        {
            DAL d = new DAL(conn);
            dlNewProducts.DataSource = d.ExecuteProcedure("spNewProducts");
            dlNewProducts.DataBind();
        }

        private void DisplayProducts()
        {
            int brand = Convert.ToInt32(Request.QueryString["brand"]);
            int category = Convert.ToInt32(Request.QueryString["category"]);
            DAL d = new DAL(conn);
            if(brand == 0 && category==0)
            {
                dlProducts.DataSource = d.ExecuteProcedure("spSearchProducts");
                dlProducts.DataBind();
            }
            else if(brand > 0 && category == 0)
            {
                d.AddParam("Pro_Brand", brand);
                dlProducts.DataSource = d.ExecuteProcedure("spSearchProducts");
                dlProducts.DataBind();
            }
            else if (category > 0 && brand == 0)
            {
                d.AddParam("Category", category);
                dlProducts.DataSource = d.ExecuteProcedure("spSearchProducts");
                dlProducts.DataBind();
            }

            dlProductScroll.DataSource = d.ExecuteProcedure("spSearchProducts");
            dlProductScroll.DataBind();
        }
    }
}