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
    public partial class Dealers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CountriesData();
                DealersData();
            }
        }
        private void CountriesData()
        {

            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["TayanaConnectionString"].ConnectionString);
            string sql = "SELECT * FROM Countries";
            SqlCommand command = new SqlCommand(sql, connection);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            CountriesRepeater.DataSource = reader;
            CountriesRepeater.DataBind();
            connection.Close();

        }
        private void DealersData()
        {
            string countryId = Request.QueryString["id"];
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["TayanaConnectionString"].ConnectionString);

            if (string.IsNullOrEmpty(countryId))
            {
                string sql = "SELECT TOP 1 countryId FROM Dealers";
                SqlCommand command = new SqlCommand(sql, connection);
                connection.Open();
                countryId = command.ExecuteScalar()?.ToString();
                connection.Close();
            }

            int page = 1;
            if (!String.IsNullOrEmpty(Request.QueryString["page"]))
            {
                page = Convert.ToInt32(Request.QueryString["page"]);
            }
            WebUserControl_Page.limit = 5;
            WebUserControl_Page.targetPage = "Dealers.aspx";
            var floor = (page - 1) * WebUserControl_Page.limit + 1;
            var ceiling = page * WebUserControl_Page.limit;

            string sql_countTotal = "SELECT COUNT(id) FROM Dealers WHERE countryId=@countryId";
            SqlCommand commandForTotal = new SqlCommand(sql_countTotal, connection);
            commandForTotal.Parameters.AddWithValue("@countryId", countryId);
            connection.Open();
            int count = Convert.ToInt32(commandForTotal.ExecuteScalar());
            connection.Close();

            WebUserControl_Page.totalItems = count;
            WebUserControl_Page.showPageControls();

            string dealersSql = @"WITH temp AS (SELECT ROW_NUMBER() OVER (ORDER BY Dealers.initDate) AS rowindex, Dealers.*, Countries.country  FROM Dealers INNER JOIN Countries ON Dealers.countryId = Countries.id  WHERE Dealers.countryId = @countryId ) SELECT * FROM temp WHERE rowindex >= @floor AND rowindex <= @ceiling";
            SqlCommand dealersCommand = new SqlCommand(dealersSql, connection);
            dealersCommand.Parameters.AddWithValue("@countryId", countryId);
            dealersCommand.Parameters.AddWithValue("@floor", floor);
            dealersCommand.Parameters.AddWithValue("@ceiling", ceiling);
            StringBuilder dealerListHtml = new StringBuilder();
            connection.Open();
            SqlDataReader reader = dealersCommand.ExecuteReader();
            while (reader.Read())
            {
                string country = reader["country"].ToString();
                CountryLiteral.Text = $"<a href='#'><span class='on1'>{country}</span></a>";
                CountryTilteLiteral.Text = country;
                string idStr = reader["id"].ToString();
                string areaStr = reader["area"].ToString();
                string imgPathStr = reader["dealerImg"].ToString();
                string nameStr = reader["name"].ToString();
                string contactStr = reader["contact"].ToString();
                string addressStr = reader["address"].ToString();
                string telStr = reader["tel"].ToString();
                string cellStr = reader["cell"].ToString();
                string faxStr = reader["fax"].ToString();
                string emailStr = reader["email"].ToString();
                string linkStr = reader["link"].ToString();

                dealerListHtml.Append("<li><div class='list02'><ul><li class='list02li'><div>" +
                    $"<p><img id='Image{idStr}' src='{imgPathStr}' style='border-width:0px;' Width='209px' /> </p></div></li>" +
                    $"<li class='list02li02'> <span>{areaStr}</span><br />");

                if (!string.IsNullOrEmpty(nameStr))
                {
                    dealerListHtml.Append($"{nameStr}<br />");
                }

                if (!string.IsNullOrEmpty(contactStr))
                {
                    dealerListHtml.Append($"Contact：{contactStr}<br />");
                }

                if (!string.IsNullOrEmpty(addressStr))
                {
                    dealerListHtml.Append($"Address：{addressStr}<br />");
                }

                if (!string.IsNullOrEmpty(telStr))
                {
                    dealerListHtml.Append($"TEL：{telStr}<br />");
                }
                if (!string.IsNullOrEmpty(cellStr))
                {
                    dealerListHtml.Append($"Cell：{cellStr}<br />");
                }

                if (!string.IsNullOrEmpty(faxStr))
                {
                    dealerListHtml.Append($"FAX：{faxStr}<br />");
                }

                if (!string.IsNullOrEmpty(emailStr))
                {
                    dealerListHtml.Append($"E-Mail：{emailStr}<br />");
                }

                if (!string.IsNullOrEmpty(linkStr))
                {
                    dealerListHtml.Append($"<a href='{linkStr}' target='_blank'>{linkStr}</a>");
                }

                dealerListHtml.Append("</li></ul></div></li>");
            }
            reader.Close();
            connection.Close();

            DealerListLiteral.Text = dealerListHtml.ToString();
        }
    }
}