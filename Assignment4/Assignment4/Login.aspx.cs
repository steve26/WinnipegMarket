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
    public partial class Login : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                tbPassword.TextMode = TextBoxMode.Password;
            }

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Security.Login(tbName.Text, tbPassword.Text);
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

        protected void hlEmail_ServerClick(object sender, EventArgs e)
        {
            if (tbName.Text != null || tbName.Text != "")
            {
                DAL mydal = new DAL(conn);
                mydal.AddParam("name", tbName.Text);
                DataSet ds = mydal.ExecuteProcedure("recoverPassword");
                if (ds.Tables[0].Rows.Count > 0)
                {
                    string pass = (string)ds.Tables[0].Rows[0]["Password"];
                    MailMessage msg = new MailMessage();
                    msg.From = new MailAddress("winnipegmarketproject@gmail.com");
                    msg.To.Add(new MailAddress(tbName.Text));
                    msg.Subject = "Password Recovery";
                    msg.Body = "Your password is "+pass;
                    SmtpClient client = new SmtpClient();
                    client.Host = "smtp.gmail.com";
                    client.Port = 587;
                    client.EnableSsl = true;
                    client.Credentials = new System.Net.NetworkCredential("winnipegmarketproject@gmail.com", "SD22WinnipegMarket");
                    client.DeliveryMethod = SmtpDeliveryMethod.Network;
                    client.Send(msg);
                }
                else
                {
                    lblError.Text = "That email address is not subscribed to our site.";
                }

                
                tbName.Text = "";
            }
        }
    }
}