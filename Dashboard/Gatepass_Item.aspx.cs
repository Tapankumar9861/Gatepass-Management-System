using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Xml.Linq;

namespace ERP_Login.Dashboard
{
    public partial class Gatepass_Item : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("data source=TAPAN;initial catalog=Gatepass_Management;integrated security=true");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click1(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtName.Text) || string.IsNullOrEmpty(txtContact.Text) || string.IsNullOrEmpty(txtVehicleNo.Text)  || string.IsNullOrEmpty(txtDescription.Text) || string.IsNullOrEmpty(txtDate.Text))
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('Must fill in all fields.');", true);


            }
            else
            {
                SqlCommand cmd = new SqlCommand("Insert into Item_Gatepass(Name,Contact,Vechile_No,Date,Reason,Description) Values ('" + txtName.Text + "','" + txtContact.Text + "','" + txtVehicleNo.Text + "','" + txtDate.Text + "','" + ddlReason.Text + "','" + txtDescription.Text + "')", con);
                con.Open();
                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Successfully Submited')</script>");
                con.Close();


                Response.Redirect("Gatepass_Item_Card.aspx?Name=" +
                    this.txtName.Text + "&Contact=" +
                    this.txtContact.Text + "&VechileNo=" +
                    this.txtVehicleNo.Text + "&Date=" +
                    this.txtDate.Text + "&Reason=" +
                    this.ddlReason.Text);

            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dashboard_Gatepass_MS.aspx");
        }
    }
}