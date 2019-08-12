using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;

namespace WebAppEmail
{
    public class MailSender
    {
        public static void CreateTestMessage(string server, string msg)
        {
            MailMessage mail = new MailMessage();
            mail.Subject = "Your TEST Subject";
            mail.From = new MailAddress("oksanamyrndsu@gmail.com");// add your gmail account
            mail.To.Add("oksanamyrndsu@gmail.com");// add your gmail account
            mail.Body = msg;
            mail.IsBodyHtml = true;

            SmtpClient smtp = new SmtpClient(server, 587);
            smtp.EnableSsl = true;
            NetworkCredential netCre = new NetworkCredential("oksanamyrndsu@gmail.com", "add your password -for your email");
            smtp.Credentials = netCre;

            try
            {
                smtp.Send(mail);
            }
            catch (Exception ex)
            {

            }


        }

        public static string SendMail(string toList, string from, string ccList, string subject, string body)
        {

            MailMessage message = new MailMessage();
            SmtpClient smtpClient = new SmtpClient();
            string msg = string.Empty;
            try
            {
                MailAddress fromAddress = new MailAddress(from);
                message.From = fromAddress;
                message.To.Add(toList);
                if (ccList != null && ccList != string.Empty)
                    message.CC.Add(ccList);
                message.Subject = subject;
                message.IsBodyHtml = true;
                message.Body = body;
                smtpClient.Host = "smtp.gmail.com";   // We use gmail as our smtp client
                smtpClient.Port = 587;
                smtpClient.EnableSsl = true;
                smtpClient.UseDefaultCredentials = true;
                smtpClient.Credentials = new System.Net.NetworkCredential("taylorf3rn@gmail.com", "Cruz6112");

                smtpClient.Send(message);
                msg = "Successful<BR>";
            }
            catch (Exception ex)
            {
                msg = ex.Message;
            }
            return msg;
        }


        protected void sendBTN_Click(object sender, EventArgs e)
        {
            string to = TextBox4.Text;
            string from = TextBox1.Text;
            string subject = TextBox2.Text;
            string msg = TextBox3.Text;
            SendMail(to, from, null, subject, msg);
        }



    }