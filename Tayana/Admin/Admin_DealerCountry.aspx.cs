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
    public partial class Admin_DealerCountry : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ShowCountries();
            }
        }
        private void ShowCountries()
        {
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["TayanaConnectionString"].ConnectionString);
            string sql = "SELECT * FROM Countries";
            SqlCommand command = new SqlCommand(sql, connection);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            CountryGridView.DataSource = reader;
            CountryGridView.DataBind();
            connection.Close();
        }

        protected void AddCountyButton_Click(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["TayanaConnectionString"].ConnectionString);
            string country = CountryTextBox.Text;
            string findCountry = "SELECT * FROM Countries WHERE country=@country";
            SqlCommand findCountryCommand = new SqlCommand(findCountry, connection);
            findCountryCommand.Parameters.AddWithValue("@country", country);
            connection.Open();
            SqlDataReader reader = findCountryCommand.ExecuteReader();
            bool countryExists = reader.HasRows;
            connection.Close();

            if (!countryExists)
            {
                MessageLabel.Visible = false;
                if (string.IsNullOrEmpty(CountryTextBox.Text))
                {
                    MessageLabel.Visible = true;
                    MessageLabel.Text = "國家為必填";
                    return;
                }
                string insertSql = "INSERT INTO Countries (country) VALUES (@country)";
                SqlCommand insertCommand = new SqlCommand(insertSql, connection);
                insertCommand.Parameters.AddWithValue("@country", country);
                connection.Open();
                insertCommand.ExecuteNonQuery();
                connection.Close();
                ToastUserControl.Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowSuccessMessage", "showMessageBox('更新成功', 'success');", true);
                Response.Redirect("Admin_DealerCountry.aspx");
            }
            else
            {
                MessageLabel.Visible = true;
                MessageLabel.Text = "國家重複";
            }
            CountryTextBox.Text = "";
        }

        protected void CountryGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string id = CountryGridView.DataKeys[e.RowIndex].Value.ToString();
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["TayanaConnectionString"].ConnectionString);
            string sqlDealer = $"DELETE FROM Dealers WHERE countryId = {id}";
            SqlCommand commandDealer = new SqlCommand(sqlDealer, connection);
            connection.Open();
            commandDealer.ExecuteNonQuery();
            connection.Close();

            string sqlCountry = $"DELETE FROM Countries WHERE id = {id}";
            SqlCommand commandCountry = new SqlCommand(sqlCountry, connection);
            connection.Open();
            commandCountry.ExecuteNonQuery();
            connection.Close();
            ToastUserControl.Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowSuccessMessage", "showMessageBox('刪除成功', 'success');", true);
            ShowCountries();
        }

        protected void CountryGridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            CountryGridView.EditIndex = e.NewEditIndex;
            ShowCountries();
        }

        protected void CountryGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            CountryGridView.EditIndex = -1;
            ShowCountries();
        }

        protected void CountryGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string id = CountryGridView.DataKeys[e.RowIndex].Value.ToString();
            GridViewRow row = CountryGridView.Rows[e.RowIndex];
            TextBox EditCountryTextBox = (TextBox)row.FindControl("EditCountryTextBox");
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["TayanaConnectionString"].ConnectionString);
            string sql = $"UPDATE Countries SET country=@country WHERE id={id}";
            SqlCommand command = new SqlCommand(sql, connection);
            command.Parameters.AddWithValue("@country", EditCountryTextBox.Text);
            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();
            CountryGridView.EditIndex = -1;
            ToastUserControl.Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowSuccessMessage", "showMessageBox('更新成功', 'success');", true);
            ShowCountries();
        }
    }
}