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
    public partial class Yachts_Specification : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SpecsData();
            }
        }
        private void SpecsData()
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
                string specsStr = HttpUtility.HtmlDecode(reader["specs"].ToString());
                SpecsLiteral.Text = specsStr;
            }
            reader.Close();
            connection.Close();

        }
    }
}