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
    public partial class Registration : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                tbPassword.TextMode = TextBoxMode.Password;
                tbPassword2.TextMode = TextBoxMode.Password;
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (tbPassword.Text == tbPassword2.Text)
            {
                DAL myDAL = new DAL(conn);
                myDAL.AddParam("First_Name", tbFirst.Text);
                myDAL.AddParam("Last_Name", tbLast.Text);
                myDAL.AddParam("Password", tbPassword.Text);
                myDAL.AddParam("PhoneNumber", tbPhone.Text);
                myDAL.AddParam("Email", tbEmail.Text);
                myDAL.AddParam("Address", tbAddress.Text);
                myDAL.ExecuteProcedure("spAddUsers");
                clearTextBoxes();
                Security.Login(tbEmail.Text, tbPassword.Text);
                Users c = (Users)Session["User"];
            }   
            else
            {
                lblError.Text = "The passwords did not match, try again";
            }

        }

        private void clearTextBoxes()
        {
            tbAddress.Text = "";
            tbEmail.Text = "";
            tbFirst.Text = "";
            tbLast.Text = "";
            tbPassword.Text = "";
            tbPassword2.Text = "";
            tbPhone.Text = "";
        }
    }
}