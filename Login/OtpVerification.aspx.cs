using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ERP_Login.Login
{
    public partial class OtpVerification : System.Web.UI.Page
    {
        readonly string connectionString = "Data Source=SQL5110.site4now.net;Initial Catalog=db_a9f4d2_collegeerp;User Id=db_a9f4d2_collegeerp_admin;Password=Ahts@2023";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] != null)
            {
                EmailLabel.Text = Session["id"].ToString();
            }
            else
            {
                Response.Write("<script>alert('Session Not Exist');</script>");

                // Use JavaScript to delay the redirect by 1 second
                Response.Write("<script>setTimeout(function() { window.location = '/Login/Login.aspx'; }, 1000);</script>");

                // Return from the server-side code
                return;

            }


        }
        protected void VerifyButton_Click(object sender, EventArgs e)
        {
            string otp = box1.Text + box2.Text + box3.Text + box4.Text;
            string email = Session["id"].ToString();


            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                // Use parameterized query to prevent SQL injection
                string sqlquery = "SELECT forgot_otp FROM [dbo].[GatepassMS_db.User_Register] WHERE E_Mail=@Email";
                using (SqlCommand cmd = new SqlCommand(sqlquery, con))
                {
                    cmd.Parameters.AddWithValue("@Email", email);
                    using (SqlDataReader dataReader = cmd.ExecuteReader())
                    {
                        if (dataReader.Read())
                        {
                            string getOtp = dataReader["forgot_otp"].ToString();

                            // Close the SqlDataReader before executing another command
                            dataReader.Close();

                            if (getOtp == otp)
                            {
                                // Update OTP to 'NA'
                                string otpUpdateQuery = "UPDATE [dbo].[GatepassMS_db.User_Register] SET forgot_otp = 'NA', Authentication = 'Yes' WHERE E_Mail = @Email";
                                using (SqlCommand cmd1 = new SqlCommand(otpUpdateQuery, con))
                                {
                                    cmd1.Parameters.AddWithValue("@Email", email);
                                    cmd1.ExecuteNonQuery();
                                }

                                Response.Redirect("~/Login/Login.aspx");
                            }
                            else
                            {
                                LabelError.Text = "Invalid OTP";
                                LabelError.ForeColor = System.Drawing.Color.Red;
                            }
                        }
                    }
                }
            }
        }


        protected void resend_Click(object sender, EventArgs e)
        {
            // Implement resend logic if needed
        }
    }
}
