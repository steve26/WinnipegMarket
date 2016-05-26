using System;
using System.Collections.Generic;
using System.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL_Project;
using System.Configuration;
using System.Data;
using WinnipegMarketClassLIbrary;

namespace Assignment4
{
    public partial class Checkout : System.Web.UI.Page
        
    {
        string conn = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString;
        ShoppingCart c = new ShoppingCart();
        decimal Total = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                 loadGrid();
                try { lblNumber.Text = Session["cartItems"].ToString(); }
                catch { lblNumber.Text = "0"; }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            SessionCart.Instance.UpdateCartItem(Convert.ToInt32(Session["updateID"]), Convert.ToInt32(ddlQuantity.SelectedValue));
            loadGrid();
        }

        private void loadGrid()
        {
            int count = Convert.ToInt32(SessionCart.Count());
            Session["cartItems"] = count;
            gvCart.DataSource = SessionCart.Instance.Cart;
            gvCart.DataBind();
            c.Cart = SessionCart.Instance.Cart;
        }

        protected void btnCheckOut_Click(object sender, EventArgs e)
        {
            c.Cart = SessionCart.Instance.Cart;
            c.CheckOut(Convert.ToInt32(Session["custID"]), DateTime.Now, Convert.ToDecimal(Session["masterCartPrice"]));
            SessionCart.AbandonCart();
            loadGrid();
        }

        protected void btnRemoveAll_Click(object sender, EventArgs e)
        {
            SessionCart.AbandonCart();
            Session["masterCartPrice"] = "0.00";
        }

        protected void gvCart_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            gvCart.SelectedIndex = Convert.ToInt32(e.CommandArgument.ToString());
            if (e.CommandName == "del")
            {
                int id = Convert.ToInt32(gvCart.SelectedValue.ToString());
                SessionCart.Instance.RemoveCartItem(Convert.ToInt32(e.CommandArgument.ToString()));
                loadGrid();
            }
            else if (e.CommandName == "edit")
            {
                pnlQuantity.Visible = true;
                Session["updateID"] = Convert.ToInt32(e.CommandArgument.ToString() + 1);
                lblErrorMsg.Text = Session["updateID"].ToString();
            }
        }

        protected void gvCart_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void gvCart_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            switch (e.Row.RowType)
            {
                case DataControlRowType.Header:
                    Total = 0;
                    decimal value = Convert.ToDecimal(0.00);
                    break;
                case DataControlRowType.DataRow:
                    try
                    {
                        value = Convert.ToDecimal(e.Row.Cells[4].Text);
                    }
                    catch
                    {
                        value = Convert.ToDecimal(0.00);
                    }

                    Total = Total + value;
                    break;
                case DataControlRowType.Footer:
                    e.Row.Cells[0].Text = "Total";
                    e.Row.Cells[4].Text = "$" + Total.ToString();
                    Session["masterCartPrice"] = Total;
                    break;
                default:
                    break;
            }
        }
    }
}