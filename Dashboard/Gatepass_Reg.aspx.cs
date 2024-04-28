using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Xml.Linq;
using System.Net.Mail;
using System.IO;

namespace ERP_Login.Dashboard
{
    public partial class Gatepass_Reg : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("data source=TAPAN;initial catalog=Gatepass_Management;integrated security=true");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click1(object sender, EventArgs e)
        {
            if (txtName.Text == "" || txtContactNo.Text == "" || txtEmail.Text == "" || txtDate.Text == "" || FileUpload.FileName == "")
            {
                Response.Write("<script>alert('Must Fill The File')</script>");
            }
            else
            {
     
                SqlCommand cmd = new SqlCommand("INSERT into GatepassReg(Name,Contact,Email,Date,Photo) values('" + txtName.Text + "','" + txtContactNo.Text + "','" + txtEmail.Text + "','" + txtDate.Text + "','" + FileUpload.FileName + "')", con);
                con.Open();
                FileUpload.SaveAs(Server.MapPath("~/Dashboard/Image/") + FileUpload.FileName.ToString());
                int result =  cmd.ExecuteNonQuery();
                con.Close();
                string email = "tapuahts@gmail.com";
                if(result > 0)
                {
                    MailMessage mail = new MailMessage();
                    mail.To.Add(email);
                    mail.From = new MailAddress(txtEmail.Text);
                    mail.Subject = "Gate Entry Conformation";

                    string emailBody = "";


                    
                    emailBody += "<!DOCTYPE html>";
                    emailBody += "<html lang=\"en\">";
                    emailBody += "<head>";
                    emailBody += "<meta charset=\"UTF-8\">";
                    emailBody += "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">";
                    emailBody += "<title>Gate Entry Permission</title>";
                    emailBody += "<link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css\">";
                    emailBody += "<style>";
                    emailBody += "body {";
                    emailBody += "font-family: Arial, sans-serif;";
                    emailBody += "background-color: #f8f9fa;";
                    emailBody += "margin: 0;";
                    emailBody += "padding: 0;";
                    emailBody += "}";
                    emailBody += ".container {";
                    emailBody += "max-width: 500px;";
                    emailBody += "margin: 50px auto;";
                    emailBody += "background-color: #fff;";
                    emailBody += "padding: 30px;";
                    emailBody += "border-radius: 10px;";
                    emailBody += "box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);";
                    emailBody += "}";
                    emailBody += "h2 {";
                    emailBody += "text-align: center;";
                    emailBody += "color: #333;";
                    emailBody += "}";
                    emailBody += "p {";
                    emailBody += "color: #555;";
                    emailBody += "line-height: 1.6;";
                    emailBody += "}";
                    emailBody += ".btn {";
                    emailBody += "display: inline-block;";
                    emailBody += "background-color: #007bff;";
                    emailBody += "color: #fff;";
                    emailBody += "padding: 10px 30px;";
                    emailBody += "border-radius: 30px;";
                    emailBody += "text-decoration: none;";
                    emailBody += "transition: background-color 0.3s ease;";
                    emailBody += "}";
                    emailBody += ".btn:hover {";
                    emailBody += "background-color: #0056b3;";
                    emailBody += "}";
                    emailBody += "</style>";
                    emailBody += "</head>";
                    emailBody += "<body>";
                    emailBody += "<div class=\"container\">";
                    emailBody += "<h2>Gate Entry Permission</h2>";
                    emailBody += "<p>Dear Authenticator,</p>";
                    emailBody += "<p>To gain entry to our premises, I require your permission. Kindly grant us permission to entery the gate.</p>";
                    emailBody += "<div style=\"text-align: center;\">";
                    emailBody += "</div>";
                    emailBody += "<p class=\"mt-3\" style=\"text-align: center;\">If you wish to grant entry, Kindly reply the Email.</p>";
                    emailBody += "<br>";    
                    emailBody += "<p class=\"mt-3\" style=\"text-align: center;\">If you wish to deny entry, kindly inform the security personnel at the gate.</p>";
    
                    emailBody += "<h3>Gatepass Card Details:</h3>";
                    emailBody += "<p>Name: " + txtName.Text + "</p>";
                    emailBody += "<p>Contact No: " + txtContactNo.Text + "</p>";
                    emailBody += "<p>Email: " + txtEmail.Text + "</p>";
                    emailBody += "<p>Date: " + txtDate.Text + "</p>";
                    emailBody += "<img src=\"" + FileUpload.FileName + "\" alt=\"Gatepass Card\">";
                    emailBody += "</div>";
                    emailBody += "</body>";
                    emailBody += "</html>";

                    mail.Body = emailBody;
                    mail.IsBodyHtml = true;
                    SmtpClient smtp = new SmtpClient();
                    smtp.Port = 587;
                    smtp.EnableSsl = true;
                    smtp.UseDefaultCredentials = false;
                    smtp.Host = "smtp.gmail.com";
                    smtp.Credentials = new System.Net.NetworkCredential("tapu986168@gmail.com", "fwcs ivpp ewlu hxlt");
                    smtp.Send(mail);
                    

                }
                else
                {
                    Response.Write("<script>alert('Registration Failed')</script>");
                }

                Response.Write("<script>alert('Successfully Submited')</script>");
                


                Response.Redirect("Gatepass_Card.aspx?Name= " +
                  this.txtName.Text + "&Contact=" +
                  this.txtContactNo.Text + "&Email=" +
                  this.txtEmail.Text + "&Date=" +
                  this.txtDate.Text + "&ImageUrl=" +
                  this.FileUpload.FileName.ToString());
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dashboard_Gatepass_MS.aspx");
        }
    }
}