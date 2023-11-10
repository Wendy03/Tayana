using System;
using System.Data.SqlClient;
using System.Text;
using System.Web.Configuration;

namespace Tayana
{
    public partial class Yachts : System.Web.UI.MasterPage
    {
     

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ModelsDate();
                BannerImages();
                NavLiink();
            }
        }
        private void BannerImages()
        {
            string guidStr = GetGuid.GuidDate();
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["TayanaConnectionString"].ConnectionString);
            string sql = "SELECT image FROM Images WHERE yachtId IN (SELECT id FROM Yachts WHERE guid = @guid)";
            SqlCommand command = new SqlCommand(sql, connection);
            command.Parameters.AddWithValue("@guid", guidStr);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            BannerRepeater.DataSource = reader;
            BannerRepeater.DataBind();
            connection.Close();
        }
        private void ModelsDate()
        {

            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["TayanaConnectionString"].ConnectionString);
            string sql = "SELECT * FROM Yachts";
            SqlCommand command = new SqlCommand(sql, connection);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            StringBuilder MenuHtml = new StringBuilder();
            while (reader.Read())
            {
                string modelStr = reader["model"].ToString();
                string isNewDesignStr = reader["isNewDesign"].ToString();
                string isNewBuildStr = reader["isNewBuild"].ToString();
                string guidStr = reader["guid"].ToString();
                string isNewStr = "";
                if (isNewDesignStr.Equals("True"))
                {
                    isNewStr = "(New Design)";
                }
                else if (isNewBuildStr.Equals("True"))
                {
                    isNewStr = "(New Building)";
                }
                MenuHtml.Append($"<li><a href='Yachts_OverView.aspx?id={guidStr}'>{modelStr} {isNewStr}</a></li>");
            }
            reader.Close();
            connection.Close();
            MenuLiteral.Text = MenuHtml.ToString();
        }
        private void NavLiink()
        {
            string guidStr = GetGuid.GuidDate();
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["TayanaConnectionString"].ConnectionString);
            string sql = "SELECT * FROM Yachts WHERE guid=@guid";
            SqlCommand command = new SqlCommand(sql, connection);
            command.Parameters.AddWithValue("@guid", guidStr);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            StringBuilder NavLinkHtml = new StringBuilder();
            if (reader.Read())
            {
                string videoStr = reader["video"].ToString();
                string modelStr = reader["model"].ToString();
                NavLinkHtml.Append($"<li><a class='menu_yli01' href='Yachts_OverView.aspx?id={guidStr}'>OverView</a></li>");
                NavLinkHtml.Append($"<li><a class='menu_yli02' href='Yachts_Layout.aspx?id={guidStr}'>Layout & deck plan</a></li>");
                NavLinkHtml.Append($"<li><a class='menu_yli03' href='Yachts_Specification.aspx?id={guidStr}'>Specification</a></li>");
                if (!string.IsNullOrEmpty(videoStr))
                {
                    NavLinkHtml.Append($"<li><a class='menu_yli04' href='Yachts_Video.aspx?id={guidStr}'>Video</a></li>");
                }
                TitleLiteral.Text = modelStr;
                LinkTitleLiteral.Text = modelStr;
            }
            reader.Close();
            connection.Close();
            NavLinkLiteral.Text = NavLinkHtml.ToString();
        }
    }
}