using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment4
{
    public partial class Contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            //MailMessage message = new MailMessage();
            //message.From = new MailAddress("jessica.mather@robertsoncollege.net");
            //message.To.Add(new MailAddress(tbNewEmail.Text));
            //message.To.Add(new MailAddress("jessica.hartling.12@gmail.com")); /*this way when someone signs up the administrator is notified and given the information they signup with.*/
            //message.Subject = "World Subscriber Confirmation";
            //message.Body = "Hello " + tbNewFirstName.Text + " " + tbNewLastName.Text + " and welcome to the World Subscriber, your new username is " + tbNewEmail.Text + " and your password is " + tbNewPassword.Text + " enjoy your shopping experience!";
            //SmtpClient client = new SmtpClient();
            //client.Host = "smtp.gmail.com";
            //client.Port = 587;
            //client.EnableSsl = true;
            //client.Credentials = new System.Net.NetworkCredential("jessica.mather@robertsoncollege.net", "J3ss!caM@ther");
            //client.DeliveryMethod = SmtpDeliveryMethod.Network;
            //client.Send(message);
        }
    }
}