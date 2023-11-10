using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Tayana
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ShowImages();
                ShowNews();
            }
        }
        private void ShowImages()
        {
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["TayanaConnectionString"].ConnectionString);
            string sql = "SELECT Yachts.id, Yachts.model, Yachts.isNewDesign, Yachts.isNewBuild ,CASE WHEN Yachts.coverImg IS NOT NULL THEN Yachts.coverImg ELSE (SELECT TOP 1 Images.image FROM Images WHERE Images.YachtId = Yachts.id) END AS image FROM Yachts ";
            SqlCommand command = new SqlCommand(sql, connection);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            StringBuilder ImagesListHtml = new StringBuilder();
            while (reader.Read())
            {
                string modelStr = reader["model"].ToString();
                string[] modelArr = modelStr.Split(' ');
                string imgPath = reader["image"].ToString();
                string isNewBuildStr = reader["isNewBuild"].ToString();
                string isNewDesignStr = reader["isNewDesign"].ToString();
                string tagStr = "";
                string displayTagStr = "0";
                if (isNewBuildStr.Equals("True"))
                {
                    displayTagStr = "1";
                    tagStr = "assets/home/images/new01.png";
                }else if (isNewDesignStr.Equals("True"))
                {
                    displayTagStr = "1";
                    tagStr = "assets/home/images/new02.png";
                }
                if (!string.IsNullOrEmpty(imgPath))
                {
                    ImagesListHtml.Append($"<li class='info' style='border-radius: 5px;height: 424px;width: 978px;'><a href='' target='_blank'><img src='{imgPath}' style='width: 978px;height: 424px;border-radius: 5px;'/></a><div class='wordtitle'>{modelArr[0]} <span>{modelArr[1]}</span><br /><p>SPECIFICATION SHEET</p></div><div class='new' style='display: none;overflow: hidden;border-radius:10px;'><img src='{tagStr}' alt='new' /></div><input type='hidden' value='{displayTagStr}' /></li>");
                }
            }
            reader.Close();
            connection.Close();

            BannerImagesLiteral.Text = ImagesListHtml.ToString();
            SmallImagesLiteral.Text = ImagesListHtml.ToString();
        }
        private void ShowNews()
        {
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["TayanaConnectionString"].ConnectionString);
            string sql = "SELECT TOP 3 id, guid, coverImg, title, publishDate, isTop FROM News WHERE publishDate <= GETDATE() ORDER BY isTop DESC, initDate DESC";
            SqlCommand command = new SqlCommand(sql, connection);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            StringBuilder NewsListHtml = new StringBuilder();
            while (reader.Read())
            {
                string idStr = reader["id"].ToString();
                string guidStr = reader["guid"].ToString();
                DateTime publishDate = DateTime.Parse(reader["publishDate"].ToString());
                string dateStr = publishDate.ToString("yyyy/M/d");
                string coverImgStr = reader["coverImg"].ToString();
                string titleStr = reader["title"].ToString();
                string displayStr = "none";
                string isTopStr = reader["isTop"].ToString();
                if (isTopStr.Equals("True"))
                {
                    displayStr = "inline-block";
                }
                NewsListHtml.Append($"<li><div class='home_newstop'>" +
                    $"<img src = '../assets/home/images/new_top01.png' alt='&quot;&quot;'style='display: {displayStr};z-index: 5;'/>" +
                    $"</div><div class='news01'>" +
                    $"<div class='news02p1'><p class='news02p1img'>" +
                    $"<img thumbnail_Image{idStr} src='{coverImgStr}' alt='&quot;&quot;'/></p></div>" +
                    $"<p class='news02p2'><span><font color='#02a5b8' >{dateStr}</font ></span ></br>" +
                    $"<span><a href = 'News_View.aspx?id={guidStr}'>{titleStr}</a ></span></p></div></li> ");

            }
            NewsListLiteral.Text = NewsListHtml.ToString();
            reader.Close();
            connection.Close();
        }
    }
}