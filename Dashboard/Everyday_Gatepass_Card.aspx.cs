using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.EnterpriseServices;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ERP_Login.Dashboard
{
    public partial class Everyday_Gatepass_Card : System.Web.UI.Page
    {
        SqlConnection con=new SqlConnection("data source=TAPAN;initial catalog=Gatepass_Management;integrated security=true");
        protected void Page_Load(object sender, EventArgs e)
        {
            lblName.Text = Request.QueryString["Name"];
            lblContact.Text = Request.QueryString["Contact"];
            lblDate.Text = Request.QueryString["Date"];
            lblReason.Text = Request.QueryString["Reason"];
            lblDescription.Text = Request.QueryString["Description"];
            if (!IsPostBack)
            {
                String query = "SELECT * FROM Everyday_Gatepass ORDER BY Sl_no DESC";
                SqlCommand cmd = new SqlCommand(query,con);
                {
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    
                    if(reader.Read())
                    {
                        lblId.Text = reader["id"].ToString();
                        
                    }
                    con.Close();
                }
            }
        }

        protected void btnPrint_Click(object sender, EventArgs e)
        {
            
            string script = "<script type='text/javascript'>window.onload = function() { window.print(); }</script>";
            ClientScript.RegisterStartupScript(this.GetType(), "Print", script);
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