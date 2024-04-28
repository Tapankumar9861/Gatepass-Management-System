using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.EnterpriseServices;

namespace ERP_Login.Dashboard
{
    public partial class Gatepass_Card : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("data source=TAPAN;initial catalog=Gatepass_Management;integrated security=true");
        protected void Page_Load(object sender, EventArgs e)
        {
            lblName.Text = Request.QueryString["Name"];
            lblContact.Text = Request.QueryString["Contact"];
            lblEmail.Text = Request.QueryString["Email"];
            lblDate.Text = Request.QueryString["Date"];
            string imageUrl = Request.QueryString["ImageUrl"];

            //Response.Write(Server.MapPath("~/Image/") + imageUrl);
            Image1.Attributes["src"] = "../Dashboard/Image/" + imageUrl;
            if (!IsPostBack)
            {
                string query = " SELECT TOP 1 id FROM GatepassReg ORDER BY Sl_no DESC";
                SqlCommand cmd = new SqlCommand(query, con);
                {
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {

                        string dataValue = reader["id"].ToString();
                        lblId.Text = dataValue;

                    }
                }
            }
        }
    }
}