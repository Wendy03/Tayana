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
    public partial class News_List : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                NewsListData();
            }
        }

        private void NewsListData()
        {

            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["TayanaConnectionString"].ConnectionString);
            int page = 1;
            if (!String.IsNullOrEmpty(Request.QueryString["page"]))
            {
                page = Convert.ToInt32(Request.QueryString["page"]);
            }
            WebUserControl_Page.limit = 5;
            WebUserControl_Page.targetPage = "News_List.aspx";
            var floor = (page - 1) * WebUserControl_Page.limit + 1;
            var ceiling = page * WebUserControl_Page.limit;

            string sql_countTotal = "SELECT COUNT(id) FROM News WHERE publishDate <= GETDATE()";
            SqlCommand commandForTotal = new SqlCommand(sql_countTotal, connection);
            connection.Open();
            int count = Convert.ToInt32(commandForTotal.ExecuteScalar());
            connection.Close();

            WebUserControl_Page.totalItems =  count;
            WebUserControl_Page.showPageControls();

            string sql = $"WITH temp AS (SELECT ROW_NUMBER() OVER (ORDER BY isTop DESC, publishDate DESC) AS rowindex, * FROM News WHERE publishDate <=  GETDATE()) SELECT * FROM temp WHERE rowindex >= {floor} AND rowindex <= {ceiling}";
            SqlCommand command = new SqlCommand(sql, connection);

            connection.Open();
            StringBuilder newListHtml = new StringBuilder();
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                string idStr = reader["id"].ToString();
                DateTime publishDate = DateTime.Parse(reader["publishDate"].ToString());
                string dateStr = publishDate.ToString("yyyy/M/d");
                string titleStr = reader["title"].ToString();
                string subtitleStr = reader["subtitle"].ToString();
                string coverImgStr = reader["coverImg"].ToString();
                string guidStr = reader["guid"].ToString();
                string isTopStr = reader["isTop"].ToString();
                string displayStr = "none";
                if (isTopStr.Equals("True"))
                {
                    displayStr = "inline-block";
                }
                newListHtml.Append($"<li><div class='list01'><ul><li><div class='news01'>" +
                    $"<img src='../assets/home/images/new_top01.png' alt='&quot;&quot;' style='display: {displayStr};position: absolute;z-index: 5;'/>" +
                    $"<div class='news02p1' style='margin: 0px;border-width: 0px;padding: 0px;' ><p>" +
                    $"<img id='thumbnail_Image{idStr}' src='{coverImgStr}'/>" +
                    $"</p></div></li><li><span>{dateStr}</span><br />" +
                    $"<a href='News_View.aspx?id={guidStr}'>{titleStr} </a></li><br />" +
                    $"<li>{subtitleStr} </li></ul></div></li>");
            }
            connection.Close();

            NewsLiteral.Text = newListHtml.ToString();


        }
    }
}