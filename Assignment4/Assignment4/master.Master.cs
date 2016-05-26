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
using System.Net.Mail;


namespace Assignment4
{
    public partial class master : System.Web.UI.MasterPage
    {
        string conn = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if (Session["User"]== null)
                {
                    hlLogout.Visible = false;
                    hlLogin.Visible = true;
                    lblGreeting.Text = "Welcome Guest";
                }
                else
                {
                    hlLogin.Visible = false;
                    hlLogout.Visible = true;
                    Users x = (Users)Session["User"];
                    lblGreeting.Text = "Welcome " + x.FirstName + " " + x.LastName;
                    
                }
                if (Session["masterCartPrice"]==null)
                {
                    lblCost.Text = "$0.00";
                    lblCount.Text = "0";
                }
                else
                {
                    lblCost.Text = "$" + Session["masterCartPrice"].ToString();
                    lblCount.Text = Session["cartItems"].ToString();
                }
            }
        }

        protected void btnEmail_Click(object sender, EventArgs e)
        {
            DAL mydal = new DAL(conn);
            mydal.AddParam("name", tbEmail.Text);
            mydal.ExecuteProcedure("AddEmail");

            MailMessage msg = new MailMessage();
            msg.From = new MailAddress("winnipegmarketproject@gmail.com");
            msg.To.Add(new MailAddress(tbEmail.Text));
            msg.Subject = "Thanks for signing up with us!";
            msg.Body = "Welcome to Winnipeg Market. We would like to thank you for signing up for our email subscription. Check back in periodically for great sales and offers.";
            SmtpClient client = new SmtpClient();
            client.Host = "smtp.gmail.com";
            client.Port = 587;
            client.EnableSsl = true;
            client.Credentials = new System.Net.NetworkCredential("winnipegmarketproject@gmail.com", "SD22WinnipegMarket");
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            client.Send(msg);
            tbEmail.Text = "";
        }
    }
}