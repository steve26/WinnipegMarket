using DAL_Project;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment4
{
    public partial class Single : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                DisplayNewProducts();
                DisplayBrands();
                DisplaySingleProduct();
            }
        }

        private void DisplaySingleProduct()
        {
            string product = Request.QueryString["product"];
            int conv_proID = Convert.ToInt32(product);

            DAL d = new DAL(conn);
            d.AddParam("Pro_ID", conv_proID);
            dlSingleProduct.DataSource = d.ExecuteProcedure("spSearchProducts");
            dlSingleProduct.DataBind();
        }

        private void DisplayBrands()
        {
            DAL d = new DAL(conn);
            dlBrands.DataSource = d.ExecuteProcedure("spGetBrandsByID");
            dlBrands.DataBind();
        }

        private void DisplayNewProducts()
        {
            DAL d = new DAL(conn);
            dlNewProducts.DataSource = d.ExecuteProcedure("spNewProducts");
            dlNewProducts.DataBind();
        }
    }
}