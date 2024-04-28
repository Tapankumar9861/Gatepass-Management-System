using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ERP_Login.Login
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=SQL5110.site4now.net;Initial Catalog=db_a9f4d2_collegeerp;User Id=db_a9f4d2_collegeerp_admin;Password=Ahts@2023");

        private string getName(string email)
        {
            string name = "";
            using (SqlConnection conn = new SqlConnection("Data Source=SQL5110.site4now.net;Initial Catalog=db_a9f4d2_collegeerp;User Id=db_a9f4d2_collegeerp_admin;Password=Ahts@2023"))
            {
                string query = "SELECT First_Name FROM [dbo].[GatepassMS_db.User_Register] WHERE E_Mail = @email";
                conn.Open();
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@email", email);
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        name = reader["First_Name"].ToString();
                    }
                    else
                    {
                        name = "User";
                    }
                }
            }
            return name;
        }

        protected void SendOtpButton_Click(object sender, EventArgs e)
        {
            con.Open();

            string sqlquery = "select E_Mail from[dbo].[GatepassMS_db.User_Register] where E_Mail='" + EmailTextBox.Text.ToString() + "'";
            SqlCommand cmd = new SqlCommand(sqlquery, con);
            SqlDataReader dataReader = cmd.ExecuteReader();
            if (dataReader.Read())
            {
                con.Close();
                Random random = new Random();
                int myRandom = random.Next(1000, 10000);
                string forgot_otp = myRandom.ToString();
                string email = EmailTextBox.Text;
                string name = getName(email);
                con.Open();
                string updateACC = "UPDATE [dbo].[GatepassMS_db.User_Register] SET forgot_otp='" + forgot_otp + "' where E_Mail = '" + EmailTextBox.Text.ToString() + "'";
                SqlCommand cmdUpdate = new SqlCommand(updateACC, con);
                cmdUpdate.ExecuteNonQuery();
                con.Close();


                MailMessage mail = new MailMessage();
                mail.To.Add(EmailTextBox.Text.ToString());
                mail.From = new MailAddress(EmailTextBox.Text.ToString());
                mail.Subject = "Verification OTP";

                string emailBody = "";
                emailBody += "<html>";
                emailBody += "<!DOCTYPE html>";
                emailBody += "<html lang='en'>";
                emailBody += "<head>";
                emailBody += "    <meta charset='UTF-8'>";
                emailBody += "    <meta name='viewport' content='width=device-width, initial-scale=1.0'>";
                emailBody += "    <title>Document</title>";
                emailBody += "    <style>";
                emailBody += "        *{";
                emailBody += "            margin: 0;";
                emailBody += "            padding: 0;";
                emailBody += "        }";
                emailBody += "        html body{";
                emailBody += "            background-color: rgb(133, 132, 130) ;";
                emailBody += "            display: flex;";
                emailBody += "            justify-content: center;";
                emailBody += "        }";
                emailBody += "        .container{";
                emailBody += "            margin-top:20px;";
                emailBody += "            width: 100%;";
                emailBody += "            height: auto;";
                emailBody += "            background-color: #fff;";
                emailBody += "            box-shadow: 1px 1px 4px gray;";
                emailBody += "        }";
                emailBody += "    </style>";
                emailBody += "</head>";
                emailBody += "<body>";
                emailBody += "    <div class='container'>";
                emailBody += "              <div >";
                emailBody += "                  <img src='https://ahtscarrier.com/img/Logowhitebg.png' style='width:35%;margin-left:32%;'>";
                emailBody += "              </div>";
                emailBody += "              <br>";
                emailBody += "              <div>";
                emailBody += "                <img src='https://ahtscarrier.com/img/socialforall/header.jpeg' style='width:100%; height:150px;'>";
                emailBody += "              </div>";
                emailBody += "              <br>";
                emailBody += "              <div>";
                emailBody += "                <h1 style='text-align:center;font-family:BIZ UDMincho Medium; margin-left:2%;'>Hello";
                emailBody += "                <b style='text-align:center;'>" + name + "</b>";
                emailBody += "                </h1>";
                emailBody += "              </div>";
                emailBody += "              <br>";
                emailBody += "              <div>";
                emailBody += "                <h2 style='text-align:center;font-family:BIZ UDMincho Medium; margin-left:2%;'>";
                emailBody += "                    Your Verification Code is :";
                emailBody += "                    <b style='text-align:center;'>" + forgot_otp + "</b>";
                emailBody += "                </h2>";
                emailBody += "              </div>";
                emailBody += "              <br><br>";
                emailBody += "              <hr>";
                emailBody += "              <br>";
                emailBody += "              <div style='height: 50px; width:100%; display:flex; justify-content:center;text-align: center;'>";
                emailBody += "                <div class='icon' style='height: 40px; width:40px; border-radius: 50%; ";
                emailBody += "                background-color: transparent;";
                emailBody += "                margin: 5px 2.5px;'>";
                emailBody += "                <a href='https://www.instagram.com/ahts23/' target='_blank'>";
                emailBody += "                    <div style='height: 100%; width: 100%; background-image: url(https://ahtscarrier.com/img/socialforall/instabg.png); background-size: cover;'></div>";
                emailBody += "                </a>";
                emailBody += "        </div>";
                emailBody += "                <div class='icon' style='height: 40px; width:40px; border-radius: 50%; ";
                emailBody += "                background-color: transparent;";
                emailBody += "                margin: 5px 2.5px;'>";
                emailBody += "                <a href='https://www.facebook.com/people/Authentic-Hire-technology-Solution/100091934478649/' target='_blank'>";
                emailBody += "                    <div style='height: 100%; width: 100%; background-image: url(https://ahtscarrier.com/img/socialforall/fbpic.png); background-size: cover;'></div>";
                emailBody += "                </a>";
                emailBody += "        </div>";
                emailBody += "                    <div class='icon' style='height: 40px; width:40px; border-radius: 50%; ";
                emailBody += "                    background-color: transparent;";
                emailBody += "                    margin: 5px 2.5px;'>";
                emailBody += "                    <a href='https://www.linkedin.com/in/authentic-hire-technology-solution-928019274/' target='_blank'>";
                emailBody += "                        <div style='height: 100%; width: 100%; background-image: url(https://ahtscarrier.com/img/socialforall/linkedinbg.png); background-size: cover;'></div>";
                emailBody += "                    </a>";
                emailBody += "            </div>";
                emailBody += "                    <div class='icon' style='height: 40px; width:40px; border-radius: 50%; ";
                emailBody += "                    background-color: transparent;";
                emailBody += "                    margin: 5px 2.5px;'>";
                emailBody += "                    <a href='https://twitter.com/i/flow/login?redirect_after_login=%2FAhts2023' target='_blank'>";
                emailBody += "                        <div style='height: 100%; width: 100%; background-image: url(https://ahtscarrier.com/img/socialforall/twiterbg.png); background-size: cover;'></div>";
                emailBody += "                    </a>";
                emailBody += "            </div>";
                emailBody += "                    <div class='icon' style='height: 40px; width:40px; border-radius: 50%; ";
                emailBody += "                    background-color: transparent;";
                emailBody += "                    margin: 5px 2.5px;'>";
                emailBody += "                    <a href='https://www.youtube.com/@authentichiretechnology' target='_blank'>";
                emailBody += "                        <div style='height: 100%; width: 100%; background-image: url(https://ahtscarrier.com/img/socialforall/youtubeimg.png); background-size: cover;'></div>";
                emailBody += "                    </a>";
                emailBody += "            </div>";
                emailBody += "              </div>";
                emailBody += "              <br><br>";
                emailBody += "              <p style='text-align:center;'>Copyright © NEW PAGE";
                emailBody += "                All rights reserved. Desigend by <a href='https://ahtscarrier.com/'>AHTS</a>";
                emailBody += "                </p>";
                emailBody += "                <br>";
                emailBody += "              <hr>";
                emailBody += "    </div>";
                emailBody += "</body>";
                emailBody += "</html>";

                mail.Body = emailBody;
                mail.IsBodyHtml = true;
                SmtpClient smtp = new SmtpClient();
                smtp.Port = 587;
                smtp.EnableSsl = true;
                smtp.UseDefaultCredentials = false;
                smtp.Host = "smtp.gmail.com";
                smtp.Credentials = new System.Net.NetworkCredential("connectahts@gmail.com", "ggak oaab msqv lvjz");
                smtp.Send(mail);
                Session["id"] = EmailTextBox.Text;
                Response.Redirect("~/Login/OtpVerification.aspx?email=" + Server.UrlEncode(EmailTextBox.Text));
            }
            else
            {
                LabelError.Text = "Your Email is not Valid.";
                LabelError.ForeColor = System.Drawing.Color.Red;
                con.Close();
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Login/Login.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Login/Register.aspx");
        }
    }
}