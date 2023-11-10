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
    public partial class Admin_NewsList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ShowNewsList();
            }
        }
        private void ShowNewsList()
        {
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["TayanaConnectionString"].ConnectionString);
            string sql = "SELECT * FROM News ORDER BY isTop DESC, publishDate DESC";
            SqlCommand command = new SqlCommand(sql, connection);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            NewsGridView.DataSource = reader;
            NewsGridView.DataBind();
            connection.Close();
        }

        protected void NewsGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                string id = e.CommandArgument.ToString();
                Response.Redirect($"Admin_News.aspx?id={id}&mode=edit");
            }
            else if (e.CommandName == "Del")
            {
                string id = e.CommandArgument.ToString();
                SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["TayanaConnectionString"].ConnectionString);
                string sqlFaq = $"DELETE FROM News WHERE id = {id}";
                SqlCommand commandFaq = new SqlCommand(sqlFaq, connection);
                connection.Open();
                commandFaq.ExecuteNonQuery();
                connection.Close();
                ToastUserControl.Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowSuccessMessage", "showMessageBox('刪除成功', 'success');", true);
                ShowNewsList();
            }
        }

        protected void AddNewsButton_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"];
            Response.Redirect($"Admin_News.aspx");
        }
    }
}