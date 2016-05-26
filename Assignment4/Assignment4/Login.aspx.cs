using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using DAL_Project;
using WinnipegMarketClassLIbrary;

namespace Assignment4
{
    public partial class Login : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                tbPassword.TextMode = TextBoxMode.Password;
            }

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Users.Login(tbName.Text, tbPassword.Text);
            Users c = (Users)Session["User"];

            if (Session["User"] == null)
            {
                
                lblError.Text = "Invalid login, Please try again.";
            }
            else
            {
                Response.Redirect("Products.aspx");
            }
        }
    }
}