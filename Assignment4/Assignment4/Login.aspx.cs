﻿using System;
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
        string conn = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {

            }

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Users s = new Users();
            s.Email = tbName.Text;
            s.Password = tbPassword.Text;
            s.Login(s.Email, s.Password);
            if (true)
            {
                Response.Redirect("Products.aspx");
            }
            else
            {
                lblError.Text = "Incorrect Username or password. Try again.";
            }
        }
    }
}