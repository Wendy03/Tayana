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
    public partial class News_View : System.Web.UI.Page
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

            string guid = Request.QueryString["id"];
            if (String.IsNullOrEmpty(guid))
            {
                Response.Redirect("~/News_List.aspx");
            }
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["TayanaConnectionString"].ConnectionString);
            string sql = "SELECT * FROM News WHERE guid=@guid";
            SqlCommand command = new SqlCommand(sql, connection);
            command.Parameters.AddWithValue("@guid", guid);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                TitleLiteral.Text = reader["title"].ToString();
                NewContentLiteral.Text = HttpUtility.HtmlDecode(reader["newsContent"].ToString());
            }
            connection.Close();
        }
    }
}