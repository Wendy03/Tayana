using CKEditor.NET;
using CKFinder;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Tayana
{
    public partial class Admin_YachtDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string id = Request.QueryString["id"];
                if (string.IsNullOrEmpty(id))
                {
                    Response.Redirect("Admin_Yachts.aspx");
                    return;
                }
                OverView_CKBrowser();
                Dim_CKBrowser();
                Specs_CKBrowser();
                ShowYachtContent();
                ShowImages();
                ShowLayoutImg();
                ShowDeckImg();
                ShowSpecsData();
                ShowVideo();
                ShowPdf();
            }
        }
        private void OverView_CKBrowser()
        {
            FileBrowser fileBrowser = new FileBrowser();
            fileBrowser.BasePath = "/ckfinder";
            fileBrowser.SetupCKEditor(OverviewCKEditorControl);
        }
        private void Dim_CKBrowser()
        {
            FileBrowser fileBrowser = new FileBrowser();
            fileBrowser.BasePath = "/ckfinder";
            fileBrowser.SetupCKEditor(DimCKEditorControl);
        }
        private void Specs_CKBrowser()
        {
            FileBrowser fileBrowser = new FileBrowser();
            fileBrowser.BasePath = "/ckfinder";
            fileBrowser.SetupCKEditor(SpecsCKEditorControl);
        }
        protected void ModeButton_Click(object sender, EventArgs e)
        {
            LinkButton modeButton = (LinkButton)sender;
            string mode = modeButton.CommandArgument;
            ContentPanel.Visible = false;
            ImagePanel.Visible = false;
            LayoutPanel.Visible = false;
            SpecsPanel.Visible = false;
            VideoPanel.Visible = false;
            PdfPanel.Visible = false;
            if (mode == "content")
            {
                ContentPanel.Visible = true;
            }
            else if (mode == "image")
            {
                ImagePanel.Visible = true;
            }
            else if (mode == "layout")
            {
                LayoutPanel.Visible = true;
            }
            else if (mode == "specs")
            {
                SpecsPanel.Visible = true;
            }
            else if (mode == "video")
            {
                VideoPanel.Visible = true;
            }
            else if (mode == "pdf")
            {
                PdfPanel.Visible = true;
            }

        }
        private void ShowYachtContent()
        {
            string id = Request.QueryString["id"];
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["TayanaConnectionString"].ConnectionString);
            string sql = "SELECT model, overview, dim FROM Yachts WHERE id=@id";
            SqlCommand command = new SqlCommand(sql, connection);
            command.Parameters.AddWithValue("@id", id);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                string modleStr = reader["model"].ToString();
                ModelLiteral.Text = $" <h2> { modleStr} </h2> ";
                OverviewCKEditorControl.Text = HttpUtility.HtmlDecode(reader["overview"].ToString());
                DimCKEditorControl.Text = HttpUtility.HtmlDecode(reader["dim"].ToString()); ;
            }
            reader.Close();
            connection.Close();

        }
        private void ShowImages()
        {
            string id = Request.QueryString["id"];
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["TayanaConnectionString"].ConnectionString);
            string sql = "SELECT * FROM Images WHERE yachtId = @id";
            SqlCommand command = new SqlCommand(sql, connection);
            command.Parameters.AddWithValue("@id", id);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            ImgGridView.DataSource = reader;
            ImgGridView.DataBind();
            connection.Close();
        }
        private void ShowLayoutImg()
        {
            string id = Request.QueryString["id"];
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["TayanaConnectionString"].ConnectionString);
            string sql = "SELECT id, layoutImg FROM Yachts WHERE id = @id";
            SqlCommand command = new SqlCommand(sql, connection);
            command.Parameters.AddWithValue("@id", id);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            if (reader.Read())
            {
                string idStr = reader["id"].ToString();
                string layoutImg = reader["layoutImg"].ToString();
                if (!string.IsNullOrEmpty(layoutImg))
                {
                    DelLayoutButton.Visible = true;
                    LayoutLiteral.Visible = true;
                    LayoutLiteral.Text = $"<img id='Image{idStr}' src='{layoutImg}' style='border-width:0px;' Width='150px' />";
                }
                else
                {
                    DelLayoutButton.Visible = false;
                    LayoutLiteral.Visible = false;
                }

            }
            reader.Close();
            connection.Close();
        }
        private void ShowDeckImg()
        {
            string id = Request.QueryString["id"];
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["TayanaConnectionString"].ConnectionString);
            string sql = "SELECT id, deckImg FROM Yachts WHERE id = @id";
            SqlCommand command = new SqlCommand(sql, connection);
            command.Parameters.AddWithValue("@id", id);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            if (reader.Read())
            {
                string idStr = reader["id"].ToString();
                string deckImg = reader["deckImg"].ToString();
                if (!string.IsNullOrEmpty(deckImg))
                {
                    DelDeckButton.Visible = true;
                    DeckPlanLiteral.Visible = true;
                    DeckPlanLiteral.Text = $"<img id='Image{idStr}' src='{deckImg}' style='border-width:0px;' Width='150px' />";
                }
                else
                {
                    DelDeckButton.Visible = false;
                    DeckPlanLiteral.Visible = false;
                }

            }
            reader.Close();
            connection.Close();
        }
        private void ShowSpecsData()
        {
            string id = Request.QueryString["id"];
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["TayanaConnectionString"].ConnectionString);
            string sql = "SELECT specs FROM Yachts WHERE id = @id";
            SqlCommand command = new SqlCommand(sql, connection);
            command.Parameters.AddWithValue("@id", id);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            if (reader.Read())
            {
                SpecsCKEditorControl.Text = HttpUtility.HtmlDecode(reader["specs"].ToString());
            }
            reader.Close();
            connection.Close();
        }
        private void ShowVideo()
        {
            string id = Request.QueryString["id"];
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["TayanaConnectionString"].ConnectionString);
            string sql = "SELECT video FROM Yachts WHERE id = @id";
            SqlCommand command = new SqlCommand(sql, connection);
            command.Parameters.AddWithValue("@id", id);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            if (reader.Read())
            {
                string videoStr = reader["video"].ToString();
                if (!string.IsNullOrEmpty(videoStr))
                {
                    DelVideoButton.Visible = true;
                    VideoLiteral.Visible = true;
                    string youtubeLink = @"https://www.youtube.com/embed/";
                    VideoLiteral.Text = $"<div><iframe src='{youtubeLink}{videoStr}' title='YouTube video player' frameborder='0' allow='accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture' allowfullscreen></iframe></div>";
                }
                else
                {
                    DelVideoButton.Visible = false;
                    VideoLiteral.Visible = false;
                }
            }
            reader.Close();
            connection.Close();
        }
        private void ShowPdf()
        {
            string id = Request.QueryString["id"];
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["TayanaConnectionString"].ConnectionString);
            string sql = "SELECT model, pdfFile FROM Yachts WHERE id = @id";
            SqlCommand command = new SqlCommand(sql, connection);
            command.Parameters.AddWithValue("@id", id);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            if (reader.Read())
            {
                string pdfStr = reader["pdfFile"].ToString();
                string modelStr = reader["model"].ToString();
                if (!string.IsNullOrEmpty(pdfStr))
                {
                    PdfLiteral.Visible = true;
                    PdfLiteral.Text = $"<div class='px-4'><a href='{pdfStr}' target='_blank'>{modelStr}-STANDARD SPECIFICATIONS</a></div>";
                    DelPdfButton.Visible = true;
                }
                else
                {
                    PdfLiteral.Visible = false;
                    DelPdfButton.Visible = false;
                }
            }
            reader.Close();
            connection.Close();
        }
        protected void AddImgButton_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"];
            ImgErrorMsgLabel.Visible = false;
            if (YachtImgFileUpload.HasFile)
            {
                if (ImageValidator.IsValidFile(YachtImgFileUpload.FileName) && ImageValidator.IsValidFileSize(YachtImgFileUpload.FileContent.Length))
                {
                    SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["TayanaConnectionString"].ConnectionString);
                    string sql = "INSERT INTO Images (yachtId, image) VALUES (@yachtId, @image)";
                    SqlCommand command = new SqlCommand(sql, connection);
                    command.Parameters.AddWithValue("@yachtId", id);
                    string fileName = ImageValidator.SaveImage(YachtImgFileUpload.FileName);
                    string imagePath = "/upload/images/" + fileName;
                    YachtImgFileUpload.SaveAs(Server.MapPath(String.Format("/upload/images/{0}", fileName)));
                    command.Parameters.AddWithValue("@image", imagePath);
                    connection.Open();
                    command.ExecuteNonQuery();
                    ToastUserControl.Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowSuccessMessage", "showMessageBox('照片新增成功', 'success');", true);
                    connection.Close();
                }
                else
                {
                    ImgErrorMsgLabel.Visible = true;
                    ImgErrorMsgLabel.Text = "上傳檔案過大或格式不正確";
                    return;
                }
            }
            else
            {
                ImgErrorMsgLabel.Visible = true;
                ImgErrorMsgLabel.Text = "尚未選擇圖片";
                return;
            }
            ShowImages();
        }
        protected void SaveModelButton_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"];
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["TayanaConnectionString"].ConnectionString);
            SqlCommand command = new SqlCommand();
            string sql = "UPDATE Yachts SET ";
            string overviewStr = OverviewCKEditorControl.Text;
            string dimStr = DimCKEditorControl.Text;
            if (!string.IsNullOrEmpty(overviewStr))
            {
                sql += "overview = @overview, ";
                command.Parameters.AddWithValue("@overview", overviewStr);
            }
            if (!string.IsNullOrEmpty(dimStr))
            {
                sql += "dim = @dim, ";
                command.Parameters.AddWithValue("@dim", dimStr);
            }
            sql = sql.TrimEnd(',', ' ');
            sql += " WHERE id = @id";
            command.Parameters.AddWithValue("@id", id);

            command.Connection = connection;
            command.CommandText = sql;

            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();
            ToastUserControl.Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowSuccessMessage", "showMessageBox('編輯成功', 'success');", true);
            ShowYachtContent();
        }

        protected void ImgGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            string id = ImgGridView.DataKeys[e.RowIndex].Value.ToString();
            bool isCover = false;
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["TayanaConnectionString"].ConnectionString);
            string sqlOrigin = $"SELECT isCover, image FROM Images WHERE id = {id}";

            SqlCommand commandOrigin = new SqlCommand(sqlOrigin, connection);
            connection.Open();
            SqlDataReader reader = commandOrigin.ExecuteReader();
            if (reader.Read())
            {
                isCover = Convert.ToBoolean(reader["isCover"]);
                string delFileName = reader["image"].ToString();
                if (!String.IsNullOrEmpty(delFileName))
                {
                    File.Delete(Server.MapPath(delFileName));
                }
            }
            reader.Close();
            connection.Close();

            string sqlDel = $"DELETE FROM Images WHERE id = {id}";
            SqlCommand commandDel = new SqlCommand(sqlDel, connection);
            connection.Open();
            commandDel.ExecuteNonQuery();
            connection.Close();

            if (isCover)
            {
                string YachtId = Request.QueryString["id"];
                string sqlUpdate = $"UPDATE Yachts SET coverImg=NULL WHERE id={YachtId}";
                SqlCommand commandUpdate = new SqlCommand(sqlUpdate, connection);
                connection.Open();
                commandUpdate.ExecuteNonQuery();
                connection.Close();
            }
            ToastUserControl.Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowSuccessMessage", "showMessageBox('刪除成功', 'success');", true);
            ShowImages();
        }

        protected void ImgGridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            ImgGridView.EditIndex = e.NewEditIndex;
            ShowImages();
        }

        protected void ImgGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            ImgGridView.EditIndex = -1;
            ShowImages();
        }

        protected void ImgGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string id = ImgGridView.DataKeys[e.RowIndex].Value.ToString();
            GridViewRow row = ImgGridView.Rows[e.RowIndex];
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["TayanaConnectionString"].ConnectionString);
            string sqlOrigin = $"SELECT image FROM Images WHERE id = {id}";
            SqlCommand commandOrigin = new SqlCommand(sqlOrigin, connection);
            connection.Open();
            SqlDataReader reader = commandOrigin.ExecuteReader();
            string originalPhoto = string.Empty;
            if (reader.Read())
            {
                originalPhoto = reader["image"].ToString();
            }
            reader.Close();
            connection.Close();

            CheckBox EditCoverCheckBox = (CheckBox)row.FindControl("EditCoverCheckBox");

            bool isCover = EditCoverCheckBox.Checked;
            string sqlUpdateIsCover = $"UPDATE Images SET isCover = CASE WHEN id = {id} THEN @isCover ELSE 0 END";
            SqlCommand commandUpdateIsCover = new SqlCommand(sqlUpdateIsCover, connection);
            commandUpdateIsCover.Parameters.AddWithValue("@isCover", isCover);
            connection.Open();
            commandUpdateIsCover.ExecuteNonQuery();
            connection.Close();

            if (!isCover)
            {
                string YachtId = Request.QueryString["id"];
                string sqlUpdateYacht = $"UPDATE Yachts SET coverImg=NULL WHERE id={YachtId}";
                SqlCommand commandUpdateYacht = new SqlCommand(sqlUpdateYacht, connection);
                connection.Open();
                commandUpdateYacht.ExecuteNonQuery();
                connection.Close();
            }
            else
            {
                string YachtId = Request.QueryString["id"];
                string sqlUpdateYacht = $"UPDATE Yachts SET coverImg=@coverImg WHERE id={YachtId}";
                SqlCommand commandUpdateYacht = new SqlCommand(sqlUpdateYacht, connection);
                commandUpdateYacht.Parameters.AddWithValue("@coverImg", originalPhoto);
                connection.Open();
                commandUpdateYacht.ExecuteNonQuery();
                connection.Close();
            }

            string sqlUpdateImage = $"UPDATE Images SET isCover=@isCover WHERE id={id}";
            SqlCommand commandUpdateImage = new SqlCommand(sqlUpdateImage, connection);
            commandUpdateImage.Parameters.AddWithValue("@isCover", isCover);
            connection.Open();
            commandUpdateImage.ExecuteNonQuery();
            connection.Close();

            ImgGridView.EditIndex = -1;
            ShowImages();
        }

        protected void AddLayoutButton_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"];
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["TayanaConnectionString"].ConnectionString);
            string sql = $"UPDATE Yachts SET layoutImg=@layoutImg WHERE id=@id";
            SqlCommand command = new SqlCommand(sql, connection);
            command.Parameters.AddWithValue("@id", id);
            if (LayoutFileUpload.HasFile)
            {
                if (ImageValidator.IsValidFile(LayoutFileUpload.FileName) && ImageValidator.IsValidFileSize(LayoutFileUpload.FileContent.Length))
                {
                    string fileName = ImageValidator.SaveImage(LayoutFileUpload.FileName);
                    string imagePath = "/upload/images/" + fileName;
                    LayoutFileUpload.SaveAs(Server.MapPath(String.Format("/upload/images/{0}", fileName)));
                    command.Parameters.AddWithValue("@layoutImg", imagePath);
                }
                else
                {
                    LayoutLiteral.Visible = true;
                    LayoutLiteral.Text = "上傳檔案過大或格式不正確";
                    return;
                }
            }
            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();
            ToastUserControl.Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowSuccessMessage", "showMessageBox('Layout圖片新增', 'success');", true);
            ShowLayoutImg();
        }
        protected void DelLayoutButton_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"];
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["TayanaConnectionString"].ConnectionString);
            string selectSql = "SELECT layoutImg FROM Yachts WHERE id=@id";
            SqlCommand selectCommand = new SqlCommand(selectSql, connection);
            selectCommand.Parameters.AddWithValue("@id", id);
            connection.Open();
            SqlDataReader reader = selectCommand.ExecuteReader();
            if (reader.Read())
            {
                string delFileName = reader["layoutImg"].ToString();
                if (!String.IsNullOrEmpty(delFileName))
                {
                    File.Delete(Server.MapPath(delFileName));
                }
            }
            reader.Close();
            connection.Close();
            string updateSql = "UPDATE Yachts SET layoutImg=NULL WHERE id=@id";
            SqlCommand updateCommand = new SqlCommand(updateSql, connection);
            updateCommand.Parameters.AddWithValue("@id", id);
            connection.Open();
            updateCommand.ExecuteNonQuery();
            connection.Close();
            ShowLayoutImg();
        }
        protected void AddDeckPlanButton_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"];
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["TayanaConnectionString"].ConnectionString);
            string sql = $"UPDATE Yachts SET deckImg=@deckImg WHERE id=@id";
            SqlCommand command = new SqlCommand(sql, connection);
            command.Parameters.AddWithValue("@id", id);
            if (DeckPlanFileUpload.HasFile)
            {
                if (ImageValidator.IsValidFile(DeckPlanFileUpload.FileName) && ImageValidator.IsValidFileSize(DeckPlanFileUpload.FileContent.Length))
                {
                    string fileName = ImageValidator.SaveImage(DeckPlanFileUpload.FileName);
                    string imagePath = "/upload/images/" + fileName;
                    DeckPlanFileUpload.SaveAs(Server.MapPath(String.Format("/upload/images/{0}", fileName)));
                    command.Parameters.AddWithValue("@deckImg", imagePath);
                }
                else
                {
                    DeckPlanLabel.Visible = true;
                    DeckPlanLabel.Text = "上傳檔案過大或格式不正確";
                    return;
                }
            }
            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();
            ToastUserControl.Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowSuccessMessage", "showMessageBox('新增成功', 'success');", true);
            ShowDeckImg();
        }


        protected void DelDeckButton_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"];
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["TayanaConnectionString"].ConnectionString);
            string selectSql = "SELECT deckImg FROM Yachts WHERE id=@id";
            SqlCommand selectCommand = new SqlCommand(selectSql, connection);
            selectCommand.Parameters.AddWithValue("@id", id);
            connection.Open();
            SqlDataReader reader = selectCommand.ExecuteReader();
            if (reader.Read())
            {
                string delFileName = reader["deckImg"].ToString();
                if (!String.IsNullOrEmpty(delFileName))
                {
                    File.Delete(Server.MapPath(delFileName));
                }
            }
            reader.Close();
            connection.Close();
            string updateSql = "UPDATE Yachts SET deckImg=NULL WHERE id=@id";
            SqlCommand updateCommand = new SqlCommand(updateSql, connection);
            updateCommand.Parameters.AddWithValue("@id", id);
            connection.Open();
            updateCommand.ExecuteNonQuery();
            connection.Close();
            ToastUserControl.Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowSuccessMessage", "showMessageBox('刪除成功', 'success');", true);
            ShowDeckImg();
        }

        protected void SaveSpecsButton_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"];
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["TayanaConnectionString"].ConnectionString);
            string sql = "UPDATE Yachts SET specs=@specs WHERE id=@id";
            SqlCommand command = new SqlCommand();
            command.Parameters.AddWithValue("@id", id);
            string specsStr = SpecsCKEditorControl.Text;
            string newSpecsStr = specsStr.Replace("<div>", "").Replace("</div>", "");
            command.Parameters.AddWithValue("@specs", newSpecsStr);
            command.Connection = connection;
            command.CommandText = sql;
            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();
            ToastUserControl.Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowSuccessMessage", "showMessageBox('更新成功', 'success');", true);
            ShowSpecsData();
        }

        protected void AddVideoButton_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"];
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["TayanaConnectionString"].ConnectionString);
            string sql = "UPDATE Yachts SET video=@video WHERE id=@id";
            SqlCommand command = new SqlCommand(sql, connection);
            command.Parameters.AddWithValue("@id", id);
            string pattern = @"(?:v=|youtu.be/)([\w-]+)";
            string inputUrl = VideoTextBox.Text;
            Match match = Regex.Match(inputUrl, pattern);
            string videoId = "";
            UrlMessageLabel.Visible = false;
            if (inputUrl.Contains("youtu.be/"))
            {
                videoId = inputUrl.Split(new string[] { "youtu.be/" }, StringSplitOptions.RemoveEmptyEntries)[1];
            }
            else if (inputUrl.Contains("watch?v="))
            {
                videoId = inputUrl.Split(new string[] { "watch?v=" }, StringSplitOptions.RemoveEmptyEntries)[1];
            }
            else
            {
                UrlMessageLabel.Visible = true;
                UrlMessageLabel.Text = "資料格式錯誤";
                return;
            }
            command.Parameters.AddWithValue("@video", videoId);
            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();
            ToastUserControl.Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowSuccessMessage", "showMessageBox('更新成功', 'success');", true);
            ShowVideo();
        }
        protected void DelVideoButton_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"];
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["TayanaConnectionString"].ConnectionString);
            string sqlImage = "UPDATE Yachts SET video=NULL WHERE id=@id";
            SqlCommand commandImage = new SqlCommand(sqlImage, connection);
            commandImage.Parameters.AddWithValue("@id", id);
            connection.Open();
            commandImage.ExecuteNonQuery();
            connection.Close();
            ToastUserControl.Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowSuccessMessage", "showMessageBox('刪除成功', 'success');", true);
            ShowVideo();
        }

        protected void UploadPdfButton_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"];
            if (PdfFileUpload.HasFile)
            {

                string fileExtension = Path.GetExtension(PdfFileUpload.FileName).ToLower();
                string newFileName = string.Format("{0:yyyyMMddhhmmsss}{1}", DateTime.Now, fileExtension);
                if (fileExtension.Equals(".pdf", StringComparison.OrdinalIgnoreCase))
                {
                    SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["TayanaConnectionString"].ConnectionString);
                    string sqlSelect = "SELECT pdfFile FROM Yachts WHERE id = @id";
                    SqlCommand commandSelect = new SqlCommand(sqlSelect, connection);
                    commandSelect.Parameters.AddWithValue("@id", id);
                    connection.Open();
                    SqlDataReader reader = commandSelect.ExecuteReader();
                    if (reader.Read())
                    {
                        string delFileName = reader["pdfFile"].ToString();
                        if (!String.IsNullOrEmpty(delFileName))
                        {
                            File.Delete(Server.MapPath(delFileName));
                        }
                    }
                    reader.Close();
                    connection.Close();
                    string sqlUpdate = "UPDATE Yachts SET pdfFile = @pdfFile WHERE id = @id";
                    SqlCommand commandUpdate = new SqlCommand(sqlUpdate, connection);
                    string filePath = "/upload/files/" + newFileName;
                    PdfFileUpload.SaveAs(Server.MapPath(String.Format("/upload/files/{0}", newFileName)));
                    commandUpdate.Parameters.AddWithValue("@pdfFile", filePath);
                    commandUpdate.Parameters.AddWithValue("@id", id);
                    connection.Open();
                    commandUpdate.ExecuteNonQuery();
                    connection.Close();
                    ToastUserControl.Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowSuccessMessage", "showMessageBox('更新成功', 'success');", true);
                    ShowPdf();
                }
                else
                {
                    PdfErrorMsgLabel.Visible = true;
                    PdfErrorMsgLabel.Text = "上傳檔案過大或格式不正確";
                    return;
                }
            }
        }

        protected void DelPdfButton_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"];
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["TayanaConnectionString"].ConnectionString);
            string selectSql = "SELECT pdfFile FROM Yachts WHERE id=@id";
            SqlCommand selectCommand = new SqlCommand(selectSql, connection);
            selectCommand.Parameters.AddWithValue("@id", id);
            connection.Open();
            SqlDataReader reader = selectCommand.ExecuteReader();
            if (reader.Read())
            {
                string delFileName = reader["pdfFile"].ToString();
                if (!String.IsNullOrEmpty(delFileName))
                {
                    File.Delete(Server.MapPath(delFileName));
                }
            }
            reader.Close();
            connection.Close();

            string updateSql = "UPDATE Yachts SET pdfFile=NULL WHERE id=@id";
            SqlCommand updateCommand = new SqlCommand(updateSql, connection);
            updateCommand.Parameters.AddWithValue("@id", id);
            connection.Open();
            updateCommand.ExecuteNonQuery();
            connection.Close();
            ToastUserControl.Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowSuccessMessage", "showMessageBox('刪除成功', 'success');", true);
            ShowPdf();
        }
    }
}