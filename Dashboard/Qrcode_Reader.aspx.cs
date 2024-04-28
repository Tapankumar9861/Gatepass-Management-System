using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace ERP_Login.Dashboard
{
    public partial class Qrcode_Reader : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data source=TAPAN; initial catalog=Gatepass_Management;integrated security=true");
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            Response.Redirect("Qrcode_Reader.aspx");
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {



            using (SqlConnection con = new SqlConnection("Data source=TAPAN; initial catalog=Gatepass_Management;integrated security=true"))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM GatepassReg WHERE Id = @Id", con))
                {
                    cmd.Parameters.AddWithValue("@Id", txtResult.Text);
                    con.Open();
                    int count = Convert.ToInt32(cmd.ExecuteScalar());
                    if (count > 0)
                    {

                        if (RadioButton1.Checked)
                        {
                            string query = "Select * from Gatepass_Report where Id = @Id AND Date = @Date ";

                            using (SqlCommand cmd2 = new SqlCommand(query, con))
                            {
                                cmd2.Parameters.AddWithValue("@Id", txtResult.Text);
                                cmd2.Parameters.AddWithValue("@Date", DateTime.Today.ToString("yyyy-MM-dd"));
                                using(SqlDataReader reader = cmd2.ExecuteReader())
                                {
                                    
                                    if (reader.Read())
                                    {
                                        Response.Write("<script>alert('You are Already In Today!')</script>");
                                    }
                                    else
                                    {
                                        try
                                        {
                                            reader.Close();
                                            string insertQuery = "INSERT INTO Gatepass_Report (Id, Gate_In_Time) VALUES (@Id, @Date)";
                                            using (SqlCommand cmd1 = new SqlCommand(insertQuery, con))
                                            {
                                                cmd1.Parameters.AddWithValue("@Id", txtResult.Text);
                                                cmd1.Parameters.AddWithValue("@Date", DateTime.Now);
                                                int t = cmd1.ExecuteNonQuery();
                                                if (t > 0)
                                                {
                                                    Response.Write("<script>alert('Data Saved Successfully!')</script>");
                                                }
                                                else
                                                {
                                                    Response.Write("<script>alert('Data Not Save Successfully!')</script>");
                                                }
                                                
                                            }
                                        }
                                        catch(Exception ex)
                                        {

                                        }
                                        finally { con.Close(); }
                                        
                                    }
                                }
                            }

                                
                        }
                        else
                        {


                            using (SqlCommand cmd1 = new SqlCommand("UPDATE Gatepass_Report SET Gate_Out_Time = @Date WHERE Id = @Id ", con))
                            {
                                cmd1.Parameters.AddWithValue("@Id", txtResult.Text);
                                cmd1.Parameters.AddWithValue("@Date", DateTime.Now);
                                int t = cmd1.ExecuteNonQuery();
                                if (t > 0)
                                {
                                    Response.Write("<script>alert('Data Saved Successfully!')</script>");
                                }
                                else
                                {
                                    Response.Write("<script>alert('Data Not Save Successfully!')</script>");
                                }
                            }
                        }
                    }
                    con.Close();
                }
            }    

        }
    }
}