using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ERP_Login.Dashboard
{
    public partial class CameraPhoto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindPhotos();
            }

        }

        private void BindPhotos()
        {
            // Sample data - you should replace this with your actual data source
            List<Photo> photos = new List<Photo>
            {
                new Photo { PhotoId = 1, ImageUrl = "photo1.jpg", AltText = "Photo 1" },
                new Photo { PhotoId = 2, ImageUrl = "photo2.jpg", AltText = "Photo 2" },
                new Photo { PhotoId = 3, ImageUrl = "photo3.jpg", AltText = "Photo 3" }
            };

            rptPhotos.DataSource = photos;
            rptPhotos.DataBind();
        }
        protected void btnLike_Click(object sender, EventArgs e)
        {
            Button btnLike = (Button)sender;
            int photoId = Convert.ToInt32(btnLike.CommandArgument);
        }

        public class Photo
        {
            public int PhotoId { get; set; }
            public string ImageUrl { get; set; }
            public string AltText { get; set; }
        }
    }
}