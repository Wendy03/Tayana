using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;

namespace Tayana
{
    public class GetGuid
    {
        public static string GuidDate()
        {
            string guid = HttpContext.Current.Request.QueryString["id"];
            if (string.IsNullOrEmpty(guid))
            {
                SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["TayanaConnectionString"].ConnectionString);
                string sqlYacht = "SELECT TOP 1 guid FROM Yachts";
                SqlCommand commandYacht = new SqlCommand(sqlYacht, connection);
                connection.Open();
                SqlDataReader readerYacht = commandYacht.ExecuteReader();
                if (readerYacht.Read())
                {
                    guid = readerYacht["guid"].ToString().Trim();
                }
                connection.Close();
            }
            return guid;
        }
    }
}