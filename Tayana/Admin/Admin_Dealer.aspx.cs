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
    public partial class Admin_Dealer : System.Web.UI.Page
    {
        public object CountryGridView { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ShowDealer();
            }
        }

        private void ShowDealer()
        {
            string countryId = Request.QueryString["countryId"];
            string mode = Request.QueryString["mode"];
            string id = Request.QueryString["id"];
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["TayanaConnectionString"].ConnectionString);
            if (mode == "edit" && !string.IsNullOrEmpty(id))
            {
                string sql = "SELECT Dealers.*, Countries.country FROM Dealers INNER JOIN Countries ON Dealers.countryId = Countries.id WHERE Dealers.countryId = @countryId AND Dealers.id = @id";
                SqlCommand command = new SqlCommand(sql, connection);
                command.Parameters.AddWithValue("@countryId", countryId);
                command.Parameters.AddWithValue("@id", id);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                if (reader.Read())
                {
                    string imgPath = reader["dealerImg"].ToString();
                    ImgLiteral.Text = $"<img alt='Dealer Image' src='{imgPath}' Width='200px'/>";
                    AreaTextBox.Text = reader["area"].ToString();
                    CountryTextBox.Text = reader["country"].ToString();
                    NameTextBox.Text = reader["name"].ToString();
                    ContactTextBox.Text = reader["contact"].ToString();
                    AddTextBox.Text = reader["address"].ToString();
                    TelTextBox.Text = reader["tel"].ToString();
                    CellTextBox.Text = reader["cell"].ToString();
                    FaxTextBox.Text = reader["fax"].ToString();
                    EmailTextBox.Text = reader["email"].ToString();
                    LinkTextBox.Text = reader["link"].ToString();
                }
            }
            else
            {
                string sql = "SELECT country FROM Countries WHERE id = @countryId";
                SqlCommand command = new SqlCommand(sql, connection);
                command.Parameters.AddWithValue("@countryId", countryId);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                if (reader.Read())
                {
                    CountryTextBox.Text = reader["country"].ToString();
                }
            }
            connection.Close();
        }

        protected void SaveDealerButton_Click(object sender, EventArgs e)
        {
            string mode = Request.QueryString["mode"];
            string countryId = Request.QueryString["countryId"];
            string id = Request.QueryString["id"];
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["TayanaConnectionString"].ConnectionString);
            string sql = string.Empty;
            SqlCommand command = new SqlCommand(sql, connection);
            MessageLabel.Visible = false;
            NameErrMsg.Visible = false;

            if (mode == "edit")
            {
                if (DealerImgFileUpload.HasFile)
                {
                    if (ImageValidator.IsValidFile(DealerImgFileUpload.FileName) && ImageValidator.IsValidFileSize(DealerImgFileUpload.FileContent.Length))
                    {
                        string fileName = ImageValidator.SaveImage(DealerImgFileUpload.FileName);
                        string imagePath = "/upload/images/" + fileName;
                        DealerImgFileUpload.SaveAs(Server.MapPath(String.Format("/upload/images/{0}", fileName)));
                        sql = $"UPDATE Dealers SET area = @area, dealerImg = @dealerImg, name = @name, contact = @contact, address = @address, tel = @tel, cell = @cell, fax = @fax, email = @email, link = @link WHERE id = {id}";
                        command.Parameters.AddWithValue("@dealerImg", imagePath);
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

                    sql = $"UPDATE Dealers SET area = @area, name = @name, contact = @contact, address = @address, tel = @tel, cell = @cell, fax = @fax, email = @email, link = @link WHERE id = {id}";
                }
            }
            else
            {
                sql = "INSERT INTO Dealers (countryId, area, dealerImg, name, contact, address, tel, cell, fax, email, link) VALUES (@countryId, @area, @dealerImg, @name, @contact, @address, @tel, @cell, @fax, @email, @link)";
                if (DealerImgFileUpload.HasFile)
                {
                    if (ImageValidator.IsValidFile(DealerImgFileUpload.FileName) && ImageValidator.IsValidFileSize(DealerImgFileUpload.FileContent.Length))
                    {
                        string fileName = ImageValidator.SaveImage(DealerImgFileUpload.FileName);
                        string imagePath = "/upload/images/" + fileName;
                        DealerImgFileUpload.SaveAs(Server.MapPath(String.Format("/upload/images/{0}", fileName)));
                        command.Parameters.AddWithValue("@dealerImg", imagePath);
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
                    command.Parameters.AddWithValue("@dealerImg", "/upload/images/noimage.jpg");
                }
                command.Parameters.AddWithValue("@countryId", countryId);
            }
            if (string.IsNullOrEmpty(NameTextBox.Text))
            {
                NameErrMsg.Visible = true;
                NameErrMsg.Text = "公司名稱為必填";
                return;
            }

            command.Parameters.AddWithValue("@area", AreaTextBox.Text);
            command.Parameters.AddWithValue("@name", NameTextBox.Text);
            command.Parameters.AddWithValue("@contact", ContactTextBox.Text);
            command.Parameters.AddWithValue("@address", AddTextBox.Text);
            command.Parameters.AddWithValue("@tel", TelTextBox.Text);
            command.Parameters.AddWithValue("@cell", CellTextBox.Text);
            command.Parameters.AddWithValue("@fax", FaxTextBox.Text);
            command.Parameters.AddWithValue("@email", EmailTextBox.Text);
            command.Parameters.AddWithValue("@link", LinkTextBox.Text);
            
            connection.Open();
            command.CommandText = sql;
            command.ExecuteNonQuery();
            connection.Close();
            ToastUserControl.Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowSuccessMessage", "showMessageBox('更新成功', 'success');", true);
            Response.Redirect($"Admin_Dealers.aspx?id={countryId}");
        }

        protected void CancelButton_Click(object sender, EventArgs e)
        {
            string countryId = Request.QueryString["countryId"];
            Response.Redirect($"Admin_Dealers.aspx?id={countryId}");
        }
    }
}