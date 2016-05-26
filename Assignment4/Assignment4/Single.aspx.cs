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
                DisplayAllProducts();
            }
        }

        private void DisplayAllProducts()
        {
            DAL d = new DAL(conn);
            dlAllProducts.DataSource = d.ExecuteProcedure("spSearchProducts");
            dlAllProducts.DataBind();
        }

        private void DisplaySingleProduct()
        {
            string product = Request.QueryString["product"];
            int conv_proID = Convert.ToInt32(product);
            if (conv_proID > 0)
            {
                DAL d = new DAL(conn);
                d.AddParam("Pro_ID", conv_proID);
                dlSingleProduct.DataSource = d.ExecuteProcedure("spSearchProducts");
                dlSingleProduct.DataBind();

                d.AddParam("Pro_ID", conv_proID);
                dlDescription.DataSource = d.ExecuteProcedure("spSearchProducts");
                dlDescription.DataBind();
            }
            else
            {
                Response.Redirect("Products.aspx");
            }
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