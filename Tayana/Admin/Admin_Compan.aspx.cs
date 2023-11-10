using CKFinder;
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
    public partial class Admin_Compan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                About_CKBrowser();
                Certificat_CKBrowser();
                AboutContent();
                CertificatContent();
            }
        }

        private void About_CKBrowser()
        {
            FileBrowser fileBrowser = new FileBrowser();
            fileBrowser.BasePath = "/ckfinder";
            fileBrowser.SetupCKEditor(AboutCKEditorControl);
        }
        private void Certificat_CKBrowser()
        {
            FileBrowser fileBrowser = new FileBrowser();
            fileBrowser.BasePath = "/ckfinder";
            fileBrowser.SetupCKEditor(CertificatCKEditorControl);

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
                AboutCKEditorControl.Text = HttpUtility.HtmlDecode(reader["aboutContent"].ToString());
            }
            connection.Close();
        }

        protected void SaveAboutButton_Click(object sender, EventArgs e)
        {
            string aboutText = AboutCKEditorControl.Text;
            string connectionString = WebConfigurationManager.ConnectionStrings["TayanaConnectionString"].ConnectionString;
            string selectSql = "SELECT aboutContent FROM Compan";

            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();
            SqlCommand selectCommand = new SqlCommand(selectSql, connection);
            SqlDataReader reader = selectCommand.ExecuteReader();

            if (reader.Read())
            {
                // 資料已存在，執行更新操作
                string updateSql = "UPDATE Compan SET aboutContent=@aboutContent";
                SqlCommand updateCommand = new SqlCommand(updateSql, connection);
                updateCommand.Parameters.AddWithValue("@aboutContent", aboutText);
                updateCommand.ExecuteNonQuery();
            }
            else
            {
                // 資料不存在，執行新增操作
                string insertSql = "INSERT INTO Compan (aboutContent) VALUES (@aboutContent)";
                SqlCommand insertCommand = new SqlCommand(insertSql, connection);
                insertCommand.Parameters.AddWithValue("@aboutContent", aboutText);
                insertCommand.ExecuteNonQuery();
            }
            connection.Close();
            ToastUserControl.Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowSuccessMessage", "showMessageBox('更新成功', 'success');", true);
            AboutContent();
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
                CertificatCKEditorControl.Text = HttpUtility.HtmlDecode(reader["certificatContent"].ToString());
            }
            reader.Close();
            connection.Close();
        }

        protected void SavCertificateButton_Click(object sender, EventArgs e)
        {
            string CertificatText = CertificatCKEditorControl.Text;
            string connectionString = WebConfigurationManager.ConnectionStrings["TayanaConnectionString"].ConnectionString;
            string selectSql = "SELECT certificatContent FROM Compan";

            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();
            SqlCommand selectCommand = new SqlCommand(selectSql, connection);
            SqlDataReader reader = selectCommand.ExecuteReader();

            if (reader.Read())
            {
                // 資料已存在，執行更新操作
                string updateSql = "UPDATE Compan SET certificatContent=@certificatContent";
                SqlCommand updateCommand = new SqlCommand(updateSql, connection);
                updateCommand.Parameters.AddWithValue("@certificatContent", CertificatText);
                updateCommand.ExecuteNonQuery();
            }
            else
            {
                // 資料不存在，執行新增操作
                string insertSql = "INSERT INTO Compan (certificatContent) VALUES (@certificatContent)";
                SqlCommand insertCommand = new SqlCommand(insertSql, connection);
                insertCommand.Parameters.AddWithValue("@certificatContent", CertificatText);
                insertCommand.ExecuteNonQuery();
            }
            connection.Close();
            ToastUserControl.Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowSuccessMessage", "showMessageBox('更新成功', 'success');", true);
            CertificatContent();
        }
    }
}