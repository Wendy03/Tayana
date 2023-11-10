using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Tayana
{
    public partial class Yachts_Video : System.Web.UI.Page
    {
      
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                VideoData();
            }
        }
        private void VideoData()
        {
            string guidStr = GetGuid.GuidDate();
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["TayanaConnectionString"].ConnectionString);
            string sql = "SELECT * FROM Yachts  WHERE guid=@guid";
            SqlCommand command = new SqlCommand(sql, connection);
            command.Parameters.AddWithValue("@guid", guidStr);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            if (reader.Read())
            {
                string youtubeLink = @"https://www.youtube.com/embed/";
                string videoStr = reader["video"].ToString();
                if (!string.IsNullOrEmpty(videoStr))
                {
                    VideoLiteral.Text = $"<div><iframe src='{youtubeLink}{videoStr}' title='YouTube video player' frameborder='0' allow='accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture' allowfullscreen></iframe></div>";
                }  
            }
            reader.Close();
            connection.Close();
        }
    }
}