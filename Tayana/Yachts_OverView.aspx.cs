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
    public partial class Yachts_OverView1 : System.Web.UI.Page
    {
     
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string guid = GetGuid.GuidDate();
                Session["guid"] = guid;
                OverviewData();
            }
        }
        private void OverviewData()
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
                string overviewStr = HttpUtility.HtmlDecode(reader["overview"].ToString());
                string dimStr = HttpUtility.HtmlDecode(reader["dim"].ToString());
                string modelStr = reader["model"].ToString();
                string pdfFileStr = reader["pdfFile"].ToString();
                OverViewLiteral.Text = overviewStr;
                DimLiteral.Text = dimStr;
                if (!string.IsNullOrEmpty(pdfFileStr))
                {
                    DownloadLiteral.Text = $"<li><a href='{pdfFileStr}' target='_blank'>{modelStr}-STANDARD SPECIFICATIONS</a></li>";
                }

            }
            reader.Close();
            connection.Close();

        }
    }
}