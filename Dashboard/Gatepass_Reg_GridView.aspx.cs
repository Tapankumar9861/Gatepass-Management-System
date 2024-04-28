using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Runtime.Remoting.Messaging;

namespace ERP_Login.Dashboard
{
    public partial class Gatepass_Reg_GridView : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("data source=TAPAN;initial catalog=Gatepass_Management;integrated security=true");
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                BindGridView();
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(GridView1.SelectedIndex >=0)
            {
                //select the row
                int selectedIndex = GridView1.SelectedIndex;
                // select the row value
                GridViewRow selectedRow = GridView1.Rows[selectedIndex];

                Console.WriteLine("Name: " + selectedRow.Cells[0].Text);
                Console.WriteLine("Id:" + selectedRow.Cells[1].Text);
                Console.WriteLine("Contact:" + selectedRow.Cells[2].Text);
                Console.WriteLine("Email:" + selectedRow.Cells[3].Text);
                Console.WriteLine("Reason:" + selectedRow.Cells[4].Text);
                Console.WriteLine("Date:" + selectedRow.Cells[5].Text);
                Console.WriteLine("Photo:" + selectedRow.Cells[6].Text);

            }
        }
        private void BindGridView()
        {
            string query = "SELECT * FROM [GatepassReg]";
            SqlCommand cmd = new SqlCommand(query, con);    
            con.Open();
            using (SqlDataReader userRead = cmd.ExecuteReader())
            {
                if(userRead.HasRows)
                {
                    GridView1.DataSource = userRead;
                    GridView1.DataBind();

                }
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string searchText = txtSearch.Text.Trim();

            if (!string.IsNullOrEmpty(searchText))
            {
                
                using (SqlConnection con = new SqlConnection("data source=TAPAN;initial catalog=Gatepass_Management;integrated security=true"))
                {
                    SqlCommand cmd = new SqlCommand("SELECT * FROM [GatepassReg]  WHERE ID = @ID", con);
                    cmd.Parameters.AddWithValue("@ID", searchText);

                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    GridView1.DataSource = reader;
                    GridView1.DataBind();
                }
            }
            else
            {
                
                BindGridView();
            }
        }

        protected void btnPrint_Click(object sender, EventArgs e)
        {
            btnPrint.Visible = false;
            string script = "<script type='text/javascript'>window.onload = function() { window.print(); }</script>";
            ClientScript.RegisterStartupScript(this.GetType(), "Print", script);
        }
    }
}