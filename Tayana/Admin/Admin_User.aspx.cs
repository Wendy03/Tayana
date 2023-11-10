using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;
using System.Data.SqlClient;
using System.Web.Configuration;
using Konscious.Security.Cryptography;
using System.Web.Security;
using System.IO;

namespace Tayana
{
    public partial class Admin_User : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!HttpContext.Current.User.Identity.IsAuthenticated)
            {
                Response.Redirect("Admin_SignIn.aspx"); //導回登入頁;

            }
            else
            {
                string ticketUserData = ((FormsIdentity)(HttpContext.Current.User.Identity)).Ticket.UserData;
                string[] ticketUserDataArr = ticketUserData.Split(';');
                bool haveRight = HttpContext.Current.User.Identity.IsAuthenticated;
                //依管理權限導頁
                if (haveRight)
                {
                    if (ticketUserDataArr[0].Equals("True"))
                    {
                        UserListPanel.Visible = true;
                        WarningLabel.Visible = false;
                        if (!IsPostBack)
                        {
                            ShowUsersData();
                        }
                    }
                    else
                    {

                        UserListPanel.Visible = false;
                        WarningLabel.Text = "您無權限";
                    }
                }
            }
        }
        private void ShowUsersData()
        {
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["TayanaConnectionString"].ConnectionString);
            string sql = "SELECT id, avatar, email, name, isAdmin, initDate FROM Users ORDER BY isAdmin DESC, initDate DESC";
            SqlCommand command = new SqlCommand(sql, connection);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            UsersGridView.DataSource = reader;
            UsersGridView.DataBind();
            connection.Close();
        }

        protected void AddUserButton_Click(object sender, EventArgs e)
        {
            string username = AddUserNameTextBox.Text;
            string userEmail = AddEmailTextBox.Text;
            string password = AddPasswordTextBox.Text;

            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(userEmail) || string.IsNullOrEmpty(password))
            {
                AddUserMessage.Visible = true;
                AddUserMessage.Text = "姓名、E-mail、密碼必填寫";
                return;
            }
            if (!Validator.IsValidEmail(userEmail))
            {
                AddUserMessage.Visible = true;
                AddUserMessage.Text = "E-mail格式錯誤";
                return;
            }
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["TayanaConnectionString"].ConnectionString); ;
            string findEmail = "SELECT * FROM Users WHERE email=@email";
            SqlCommand findEmailCommand = new SqlCommand(findEmail, connection);
            findEmailCommand.Parameters.AddWithValue("@email", userEmail);
            connection.Open();
            SqlDataReader reader = findEmailCommand.ExecuteReader();
            bool emailExists = reader.HasRows;
            connection.Close();

            if (!emailExists)
            {
                var salt = CreateSalt();
                string saltStr = Convert.ToBase64String(salt);
                var hash = HashPassword(password, salt);
                string hashPassword = Convert.ToBase64String(hash);
                string sql = "INSERT INTO Users(avatar, name, email, password, salt, isAdmin) VALUES (@avatar, @name, @email, @password, @salt, @isAdmin)";
                SqlCommand command = new SqlCommand(sql, connection);
                command.Parameters.AddWithValue("@avatar", "/upload/images/avatar.png");
                command.Parameters.AddWithValue("@name", username);
                command.Parameters.AddWithValue("@email", userEmail);
                command.Parameters.AddWithValue("@password", hashPassword);
                command.Parameters.AddWithValue("@salt", saltStr);
                command.Parameters.AddWithValue("@isAdmin", false);
                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();
                Response.Redirect("Admin_User.aspx");
                AddUserNameTextBox.Text = "";
                AddEmailTextBox.Text = "";
                AddPasswordTextBox.Text = "";
            }
            else
            {

                AddUserMessage.Visible = true;
                AddUserMessage.Text = "E-mail 重複";
                return;
            }


        }
        private byte[] CreateSalt()
        {
            var buffer = new byte[16];
            var rng = new RNGCryptoServiceProvider();
            rng.GetBytes(buffer);
            return buffer;
        }
        // Hash 處理加鹽的密碼功能
        private byte[] HashPassword(string password, byte[] salt)
        {
            var argon2 = new Argon2id(Encoding.UTF8.GetBytes(password));
            argon2.Salt = salt;
            argon2.DegreeOfParallelism = 8; // 4 核心就設成 8
            argon2.Iterations = 4; // 迭代運算次數
            argon2.MemorySize = 1024 * 1024; // 1 GB

            return argon2.GetBytes(16);
        }

        protected void UsersGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string id = UsersGridView.DataKeys[e.RowIndex].Value.ToString();
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["TayanaConnectionString"].ConnectionString);
            string sql = $"DELETE FROM Users WHERE id = {id}";
            SqlCommand commandCategories = new SqlCommand(sql, connection);
            connection.Open();
            commandCategories.ExecuteNonQuery();
            connection.Close();
            ToastUserControl.Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowSuccessMessage", "showMessageBox('刪除成功', 'success');", true);
            ShowUsersData();
        }

        protected void UsersGridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            UsersGridView.EditIndex = e.NewEditIndex;
            ShowUsersData();
        }

        protected void UsersGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            UsersGridView.EditIndex = -1;
            ShowUsersData();
        }

        protected void UsersGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string id = UsersGridView.DataKeys[e.RowIndex].Value.ToString();
            GridViewRow row = UsersGridView.Rows[e.RowIndex];
            FileUpload EditAvatarFileUpload = (FileUpload)row.FindControl("EditAvatarFileUpload");
            TextBox NameTextBox = (TextBox)row.FindControl("NameTextBox");
            TextBox EditEmailTextBox = (TextBox)row.FindControl("EditEmailTextBox");
            CheckBox EditAdminCheckBox = (CheckBox)row.FindControl("EditAdminCheckBox");
            string imagePath = string.Empty;
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["TayanaConnectionString"].ConnectionString);
            if (EditAvatarFileUpload.HasFile)
            {
                if (ImageValidator.IsValidFile(EditAvatarFileUpload.FileName))
                {
                    if (ImageValidator.IsValidFileSize(EditAvatarFileUpload.FileContent.Length))
                    {
                        string fileName = ImageValidator.SaveImage(EditAvatarFileUpload.FileName);
                        imagePath = "/upload/images/" + fileName;
                        EditAvatarFileUpload.SaveAs(Server.MapPath(String.Format("/upload/images/{0}", fileName)));
                        string selectSql = "SELECT avatar FROM Users WHERE id=@id";
                        SqlCommand selectCommand = new SqlCommand(selectSql, connection);
                        selectCommand.Parameters.AddWithValue("@id", id);
                        connection.Open();
                        SqlDataReader reader = selectCommand.ExecuteReader();
                        if (reader.Read())
                        {
                            string delFileName = reader["avatar"].ToString();
                            if (!String.IsNullOrEmpty(delFileName) && !String.Equals(delFileName, "/upload/images/avatar.png", StringComparison.OrdinalIgnoreCase))
                            {
                                File.Delete(Server.MapPath(delFileName));
                            }
                        }
                        reader.Close();
                        connection.Close();
                        string sql = $"UPDATE Users SET avatar=@avatar, name=@name, email=@email, isAdmin=@isAdmin WHERE id={id}";
                        SqlCommand command = new SqlCommand(sql, connection);
                        command.Parameters.AddWithValue("@avatar", imagePath);
                        command.Parameters.AddWithValue("@name", NameTextBox.Text);
                        command.Parameters.AddWithValue("@email", EditEmailTextBox.Text);
                        command.Parameters.AddWithValue("@isAdmin", EditAdminCheckBox.Checked);
                        connection.Open();
                        command.ExecuteNonQuery();
                        connection.Close();

                    }
                    else
                    {
                        ToastUserControl.Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowErrorMessage", "showMessageBox('上傳檔案過大', 'error');", true);
                        return;
                    }
                }
                else
                {
                    ToastUserControl.Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowErrorMessage", "showMessageBox('只能夠上傳字尾為.gif,.jpg,.bmp,.png的檔案', 'error');", true);
                    return;
                }
            }
            else
            {
                string sql = $"UPDATE Users SET  name=@name, email=@email, isAdmin=@isAdmin WHERE id={id}";
                SqlCommand command = new SqlCommand(sql, connection);
                command.Parameters.AddWithValue("@name", NameTextBox.Text);
                command.Parameters.AddWithValue("@email", EditEmailTextBox.Text);
                command.Parameters.AddWithValue("@isAdmin", EditAdminCheckBox.Checked); ;
                try
                {
                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();
                }
                catch (Exception ex)
                {
                    Console.Write(ex);
                }
            }
            UsersGridView.EditIndex = -1;
            Response.Redirect("Admin_User.aspx");
        }

        protected void UsersGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string ticketUserData = ((FormsIdentity)(HttpContext.Current.User.Identity)).Ticket.UserData;
                string[] ticketUserDataArr = ticketUserData.Split(';');
                LinkButton DelUserLinkButton = (LinkButton)e.Row.FindControl("DelUserLinkButton");
                CheckBox EditIsAdminCheckBox = (CheckBox)e.Row.FindControl("EditAdminCheckBox");

                if (DelUserLinkButton != null)
                {
                    string userId = UsersGridView.DataKeys[e.Row.RowIndex].Value.ToString();
                    if (ticketUserDataArr[0].Equals("True") && userId != (ticketUserDataArr[1]))
                    {
                        DelUserLinkButton.Visible = true;

                    }
                    else
                    {
                        DelUserLinkButton.Visible = false;
                        if (EditIsAdminCheckBox != null)
                        {
                            EditIsAdminCheckBox.Visible = false;
                        }

                    }
                }
            }

        }
    }
}
