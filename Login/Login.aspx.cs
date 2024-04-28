using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ERP_Login
{
    public partial class Login : System.Web.UI.Page
    {
        string connectionString = "Data Source=SQL5110.site4now.net;Initial Catalog=db_a9f4d2_collegeerp;User Id=db_a9f4d2_collegeerp_admin;Password=Ahts@2023";
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void lgnbtn_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text;
            string password = txtPassword.Text;
            if (email == "" || password == "")
            {
                Response.Write("<script>alert('Email Or Password Not Enter')</script>");
                return;
            }
            else
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();

                    string userQuery = "SELECT * FROM [dbo].[GatepassMS_db.User_Register] WHERE E_Mail = @email AND Password=@Password";
                    using (SqlCommand userCmd = new SqlCommand(userQuery, con))
                    {
                        userCmd.Parameters.AddWithValue("@email", email);
                        userCmd.Parameters.AddWithValue("@Password", password);
                        using (SqlDataReader userReader = userCmd.ExecuteReader())
                        {
                            if (userReader.Read())
                            {
                                string authentication = userReader["Authentication"].ToString();
                                Session["id"] = txtEmail.Text;
                                userReader.Close();
                                if (authentication == "Yes")
                                {
                                    Response.Redirect("~/Dashboard/Dashboard_Gatepass_MS.aspx");
                                }
                                else
                                {
                                    string sqlquery = "select E_Mail from[dbo].[GatepassMS_db.User_Register] where E_Mail='" + Session["id"] + "'";
                                    SqlCommand cmd = new SqlCommand(sqlquery, con);
                                    SqlDataReader dataReader = cmd.ExecuteReader();
                                    if (dataReader.Read())
                                    {
                                        con.Close();
                                        Random random = new Random();
                                        int myRandom = random.Next(1000, 10000);
                                        string forgot_otp = myRandom.ToString();

                                        con.Open();
                                        string updateACC = "UPDATE [dbo].[GatepassMS_db.User_Register] SET forgot_otp='" + forgot_otp + "' where E_Mail = '" + Session["id"].ToString() + "'";
                                        SqlCommand cmdUpdate = new SqlCommand(updateACC, con);
                                        cmdUpdate.ExecuteNonQuery();
                                        con.Close();


                                        MailMessage mail = new MailMessage();
                                        mail.To.Add(Session["id"].ToString());
                                        mail.From = new MailAddress(Session["id"].ToString());
                                        mail.Subject = "Verification OTP";

                                        string emailBody = "";
                                        emailBody += "<h1>Hello User,</h1>";
                                        emailBody += "This is Your OTP </br>";
                                        emailBody += "<b>" + forgot_otp + "</b>";

                                        mail.Body = emailBody;
                                        mail.IsBodyHtml = true;
                                        SmtpClient smtp = new SmtpClient();
                                        smtp.Port = 587;
                                        smtp.EnableSsl = true;
                                        smtp.UseDefaultCredentials = false;
                                        smtp.Host = "smtp.gmail.com";
                                        smtp.Credentials = new System.Net.NetworkCredential("connectahts@gmail.com", "ggak oaab msqv lvjz");
                                        smtp.Send(mail);
                                        Response.Redirect("OtpVerification.aspx?email=" + Server.UrlEncode(Session["id"].ToString()));
                                    }

                                }
                            }
                            else
                            {
                                Response.Write("<script>alert('Invalid User')</script>");
                            }
                        }
                    }
                    con.Close();
                }
            }

        }

        protected void BackButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/index.html");
        }

        protected void fPassword_Click(object sender, EventArgs e)
        {
            Response.Redirect("ForgotPassword.aspx");
        }
    }
}