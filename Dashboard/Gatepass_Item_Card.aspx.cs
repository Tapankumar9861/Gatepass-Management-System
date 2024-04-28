using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.HtmlControls;


namespace ERP_Login.Dashboard
{
    public partial class Gatepass_Item_Card : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data source=TAPAN;initial catalog=Gatepass_Management;Integrated security=true");
        protected void Page_Load(object sender, EventArgs e)
        {
            lblName.Text = Request.QueryString["Name"];
            lblVehicle.Text = Request.QueryString["VechileNo"];
            lblContact.Text = Request.QueryString["Contact"];
            lblDate.Text = Request.QueryString["date"];

            if (!IsPostBack)
            {
                string query = " select TOP 1 Id FROM Item_Gatepass ORDER BY Sl_no DESC ";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    con.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            lblId.Text = reader["Id"].ToString();
                        }
                    }
                }
            }
        }

        protected void btnQrcode_Click(object sender, EventArgs e)
        {
            string Id = lblId.Text; 
            string qrCodeUrl = $"https://chart.googleapis.com/chart?cht=qr&chs=200x200&chl={Id}";
            string qrCodeIframe = $"<iframe src='{qrCodeUrl}' height='200' width='200'></iframe>";
            qrcode.InnerHtml = qrCodeIframe;
            
        }
    }
}