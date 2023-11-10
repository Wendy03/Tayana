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
    public partial class Admin_Dealers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string countryId = Request.QueryString["id"];
            if (string.IsNullOrEmpty(countryId))
            {
                Response.Redirect("/Admin/Admin_DealerCountry.aspx");
            }
            if (!IsPostBack)
            {
                ShowDealers();
            }
        }
        private void ShowDealers()
        {
            string countryId = Request.QueryString["id"];
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["TayanaConnectionString"].ConnectionString);
            string sql = "SELECT Dealers.*, Countries.country FROM Dealers INNER JOIN Countries ON Dealers.countryId = Countries.id WHERE Dealers.countryId = @countryId";
            SqlCommand command = new SqlCommand(sql, connection);
            command.Parameters.AddWithValue("@countryId", countryId);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            DealersGridView.DataSource = reader;
            DealersGridView.DataBind();
            connection.Close();
        }

        protected void AddDealerButton_Click(object sender, EventArgs e)
        {
            string countryId = Request.QueryString["id"];
            Response.Redirect($"Admin_Dealer.aspx?countryId={countryId}");
        }

        protected void DealersGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                string countryId = Request.QueryString["id"];
                string id = e.CommandArgument.ToString();
                Response.Redirect($"Admin_Dealer.aspx?countryId={countryId}&mode=edit&id={id}");
            }else if (e.CommandName == "Del")
            {
                string id = e.CommandArgument.ToString();
                SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["TayanaConnectionString"].ConnectionString);
                string sqlFaq = $"DELETE FROM Dealers WHERE id = {id}";
                SqlCommand commandFaq = new SqlCommand(sqlFaq, connection);
                connection.Open();
                commandFaq.ExecuteNonQuery();
                connection.Close();
                ToastUserControl.Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowSuccessMessage", "showMessageBox('刪除成功', 'success');", true);
                ShowDealers();
            }
        }
    }
}