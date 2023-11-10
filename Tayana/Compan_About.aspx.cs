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
    public partial class Compan_About : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            AboutContent();
        }
        private void AboutContent()
        {
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["TayanaConnectionString"].ConnectionString);
            string sql = "SELECT aboutContent FROM Compan";
            SqlCommand command = new SqlCommand(sql, connection);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            if (reader.Read())
            {
                AboutLabel.Text = HttpUtility.HtmlDecode(reader["aboutContent"].ToString());
            }
            connection.Close();
        }
    }
}