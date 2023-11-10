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
    public partial class Compan_Certificat : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CertificatContent();
        }
        private void CertificatContent()
        {
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["TayanaConnectionString"].ConnectionString);
            string sql = "SELECT certificatContent FROM Compan";
            SqlCommand command = new SqlCommand(sql, connection);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            if (reader.Read())
            {
                CertificatLabel.Text = HttpUtility.HtmlDecode(reader["certificatContent"].ToString());
            }
            connection.Close();
        }
    }
}