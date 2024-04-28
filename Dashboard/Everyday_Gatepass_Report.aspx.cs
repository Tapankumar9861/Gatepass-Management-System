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
    public partial class Everyday_Gatepass_Report : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("data source=TAPAN;initial catalog =Gatepass_Management;integrated security=true ");
        protected void Page_Load(object sender, EventArgs e)
        {
             if(!IsPostBack)
             {
                BindGridView();
             }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (GridView1.SelectedIndex >= 0)
            {
                int selectedIndex = GridView1.SelectedIndex;
                GridViewRow selectedRow = GridView1.Rows[selectedIndex];

                Console.WriteLine("Sl_No:" + selectedRow.Cells[0].Text);
                Console.WriteLine("Id:" + selectedRow.Cells[1].Text);
                Console.WriteLine("Gate_In_Time:" + selectedRow.Cells[2].Text);
                Console.WriteLine("Gate_Out_Time:" + selectedRow.Cells[3].Text);
            }
        }

        private void BindGridView()
        {
            string query = "SELECT * FROM EveryDay_Gatepass_Report";
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                con.Open();
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.HasRows)
                    {
                        GridView1.DataSource = reader;
                        GridView1.DataBind();
                    }
                }
                con.Close();
            }
        }



        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string Id = GridView1.DataKeys[e.RowIndex].Value.ToString();

            string query = "DELETE FROM EveryDay_Gatepass_Report WHERE Id = '" + Id + "'";
            using (SqlCommand cmd = new SqlCommand(query,con))
            {
                con.Open() ;
                 int t=cmd.ExecuteNonQuery();  
                if (t > 0)
                {
                    Response.Write("<script>alert('Data Dalete Successfully')</script>");
                }

            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string searchText = txtSearch.Text.Trim();
            if (!string.IsNullOrEmpty(searchText))
            {
                string query = "SELECT * FROM EveryDay_Gatepass_Report WHERE Id = @Id";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Id", searchText);
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    GridView1.DataSource = reader;
                    GridView1.DataBind();
                    con.Close();
                }
            }
            else
            {
                Response.Write("<script>alert('Data Are Not Found')</script>");
            }



        }

        protected void btnPrint_Click(object sender, EventArgs e)
        {
            btnPrint.Visible = false;
           
            btnBack.Visible = false;
            string script = "<script type='text/javascript'>window.onload = function() { window.print(); }</script>";
            ClientScript.RegisterStartupScript(this.GetType(), "Print", script);
        }

        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            Response.Redirect("Everyday_Gatepass_Report.aspx");
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dashboard_Gatepass_MS.aspx");
        }
    }
}