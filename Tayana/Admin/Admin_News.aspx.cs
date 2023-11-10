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
    public partial class Admin_News : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                News_CKBrowser();
                ShowDealer();
                DateTextBox.Text = DateTime.Today.ToString("yyyy-MM-dd");
            }
        }
        private void News_CKBrowser()
        {
            FileBrowser fileBrowser = new FileBrowser();
            fileBrowser.BasePath = "/ckfinder";
            fileBrowser.SetupCKEditor(NewsCKEditorControl);
        }
        private void ShowDealer()
        {
            string id = Request.QueryString["id"];
            string mode = Request.QueryString["mode"];
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["TayanaConnectionString"].ConnectionString);
            if (mode == "edit" && !string.IsNullOrEmpty(id))
            {
                string sql = "SELECT * FROM News WHERE id = @id";
                SqlCommand command = new SqlCommand(sql, connection);
                command.Parameters.AddWithValue("@id", id);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                if (reader.Read())
                {
                    string imgPath = reader["coverImg"].ToString();
                    NewsCKEditorControl.Text = HttpUtility.HtmlDecode(reader["newsContent"].ToString());
                    TitleTextBox.Text = reader["title"].ToString();
                    SubtitleTextBox.Text = reader["subtitle"].ToString();
                    NewsImgLiteral.Text = $"<img alt='News Image' src='{imgPath}' Width='150px'/>"; ;
                    isTopCheckBox.Checked = (bool)reader["isTop"];
                }
            }
            connection.Close();
        }

        protected void SaveNewsButton_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"];
            string mode = Request.QueryString["mode"];
            string titleStr = TitleTextBox.Text;
            string subtitleStr = SubtitleTextBox.Text;
            bool isTopCheck = isTopCheckBox.Checked ? true : false;
            DateTime nowTime = DateTime.Now;
            string nowSec = nowTime.ToString("ff");
            string guid = Guid.NewGuid().ToString().Trim() + nowSec;
            DateTime selectedDate;
            if (DateTime.TryParse(DateTextBox.Text, out selectedDate))
            {
                if (selectedDate < DateTime.Today)
                {
                    selectedDate = DateTime.Today;
                    DateTextBox.Text = selectedDate.ToString("yyyy/MM/dd");
                }
            }
            else
            {
                ErrorMessageLabel.Text = "日期格式無效";
                ErrorMessageLabel.Visible = true;
                return;
            }

            if (string.IsNullOrEmpty(titleStr))
            {
                TitleMessage.Visible = true;
                return;
            }
            if (string.IsNullOrEmpty(subtitleStr))
            {
                subtitleStr = TitleTextBox.Text;
            }
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["TayanaConnectionString"].ConnectionString);
            string sql = string.Empty;
            SqlCommand command = new SqlCommand(sql, connection);
            if (mode == "edit")
            {
                if (NewsImgFileUpload.HasFile)
                {
                    if (ImageValidator.IsValidFile(NewsImgFileUpload.FileName) && ImageValidator.IsValidFileSize(NewsImgFileUpload.FileContent.Length))
                    {
                        string fileName = ImageValidator.SaveImage(NewsImgFileUpload.FileName);
                        string imagePath = "/upload/images/" + fileName;
                        sql = $"UPDATE News SET title = @title, subtitle = @subtitle, coverImg=@coverImg, newsContent = @newsContent, publishDate=@publishDate, isTop = @isTop WHERE id = {id}";
                        NewsImgFileUpload.SaveAs(Server.MapPath(String.Format("/upload/images/{0}", fileName)));
                        command.Parameters.AddWithValue("@coverImg", imagePath);
                    }
                    else
                    {
                        MessageLabel.Visible = true;
                        MessageLabel.Text = "上傳檔案過大或格式不正確";
                        return;
                    }
                }
                else
                {

                    sql = $"UPDATE News SET title = @title, subtitle = @subtitle, newsContent = @newsContent, publishDate=@publishDate, isTop = @isTop WHERE id = {id}";
                }
            }
            else
            {
                sql = "INSERT INTO News (guid,coverImg, title, subtitle, newsContent, publishDate, isTop) VALUES (@guid, @coverImg, @title, @subtitle, @newsContent, @publishDate, @isTop)";
                if (NewsImgFileUpload.HasFile)
                {
                    if (ImageValidator.IsValidFile(NewsImgFileUpload.FileName) && ImageValidator.IsValidFileSize(NewsImgFileUpload.FileContent.Length))
                    {
                        string fileName = ImageValidator.SaveImage(NewsImgFileUpload.FileName);
                        string imagePath = "/upload/images/" + fileName;
                        NewsImgFileUpload.SaveAs(Server.MapPath(String.Format("/upload/images/{0}", fileName)));
                        command.Parameters.AddWithValue("@coverImg", imagePath);
                    }
                    else
                    {
                        MessageLabel.Visible = true;
                        MessageLabel.Text = "上傳檔案過大或格式不正確";
                        return;
                    }
                }
                else
                {
                    command.Parameters.AddWithValue("@coverImg", "/upload/images/noimage.jpg");
                }
                command.Parameters.AddWithValue("@guid", guid);

            }
            command.Parameters.AddWithValue("@title", titleStr);
            command.Parameters.AddWithValue("@subtitle", subtitleStr);
            command.Parameters.AddWithValue("@newsContent", NewsCKEditorControl.Text);
            command.Parameters.AddWithValue("@isTop", isTopCheck);
            command.Parameters.AddWithValue("@publishDate", selectedDate);
            connection.Open();
            command.CommandText = sql;
            command.ExecuteNonQuery();
            connection.Close();
            ToastUserControl.Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowSuccessMessage", "showMessageBox('更新成功', 'success');", true);
            Response.Redirect("Admin_NewsList.aspx");
        }

        protected void CancelButton_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"];
            Response.Redirect($"Admin_NewsList.aspx?id={id}");
        }
    }
}