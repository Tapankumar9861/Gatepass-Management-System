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
    public partial class Item_Gatepass_GridView : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("data source=TAPAN;initial catalog=Gatepass_Management;integrated security=true");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
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

                Console.WriteLine("Id:" + selectedRow.Cells[0].Text);
                Console.WriteLine("Name: " + selectedRow.Cells[1].Text);
                Console.WriteLine("Vechile_No:" + selectedRow.Cells[2].Text);
                Console.WriteLine("Tax:" + selectedRow.Cells[3].Text);
                Console.WriteLine("Date:" + selectedRow.Cells[4].Text);
                Console.WriteLine("Reason:" + selectedRow.Cells[5].Text);
                Console.WriteLine("Description:" + selectedRow.Cells[6].Text);


            }
        }
        private void BindGridView()
        {
            string query = "SELECT * FROM Item_Gatepass";
            SqlCommand cmd = new SqlCommand(query, con);
            con.Open();
            using (SqlDataReader userRead = cmd.ExecuteReader())
            {
                if (userRead.HasRows)
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
                    SqlCommand cmd = new SqlCommand("SELECT * FROM Item_Gatepass  WHERE ID = @ID", con);
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
            btnBack.Visible = false;
            string script = "<script type='text/javascript'>window.onload = function() { window.print(); }</script>";
            ClientScript.RegisterStartupScript(this.GetType(), "Print", script);
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            BindGridView();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());

            string Name = ((TextBox)GridView1.Rows[e.RowIndex].Cells[4].Controls[0]).Text;
            string Contact = ((TextBox)GridView1.Rows[e.RowIndex].Cells[4].Controls[0]).Text;
            string Vechile_No = ((TextBox)GridView1.Rows[e.RowIndex].Cells[4].Controls[0]).Text;
            string Reason = ((TextBox)GridView1.Rows[e.RowIndex].Cells[4].Controls[0]).Text;
            string Description = ((TextBox)GridView1.Rows[e.RowIndex].Cells[4].Controls[0]).Text;


            string query = "UPDATE Item_Gatepass SET Name='" + Name + "',Contact='" + Contact + "',Vechile_No='" + Vechile_No + "',Reason='" + Reason + "',Description='" + Description + "' WHERE Id='"+id+"'";
            using (SqlCommand cmd= new SqlCommand(query,con))
            {
                con.Open();
                int t= cmd.ExecuteNonQuery();
                if(t > 0)
                {
                    Response.Write("<script>alert('Data Updated Successfully')<script>");
                }
            }

        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            BindGridView();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());

            string query = "DELETE FROM  Item_Gatepass WHERE Sl_no='"+id+"'";
            using (SqlCommand cmd=new SqlCommand(query,con))
            {
                con.Open();
                int t= cmd.ExecuteNonQuery();
                if(t > 0)
                {
                    Response.Write("<script>alert('Data Delete Successfully')</script>");
                }
            }
        }

        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            Response.Redirect("Gatepass_Item_GridView.aspx");
        }

        protected void btnBack_Click1(object sender, EventArgs e)
        {
            Response.Redirect("Dashboard_Gatepass_MS.aspx");
        }
    }
}