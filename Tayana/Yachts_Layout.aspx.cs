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
    public partial class Yachts_Layout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LayoutData();
            }
        }
        private void LayoutData()
        {
            string guidStr = GetGuid.GuidDate();
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["TayanaConnectionString"].ConnectionString);
            string sql = "SELECT * FROM Yachts  WHERE guid=@guid";
            SqlCommand command = new SqlCommand(sql, connection);
            command.Parameters.AddWithValue("@guid", guidStr);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            StringBuilder LayoutHtml = new StringBuilder();
            if (reader.Read())
            {
                string layoutImgStr = reader["layoutImg"].ToString();
                string deckImgileStr = reader["deckImg"].ToString();
                if (!string.IsNullOrEmpty(layoutImgStr))
                {
                    LayoutHtml.Append($"<li><img src = '{layoutImgStr}' alt = '&quot;&quot;' /></li> ");
                }
                if (!string.IsNullOrEmpty(deckImgileStr))
                {
                    LayoutHtml.Append($"<li><img src = '{deckImgileStr}' alt = '&quot;&quot;' /></li> ");
                }

            }
            reader.Close();
            connection.Close();
            LayoutLiteral.Text = LayoutHtml.ToString();
        }
    }
}