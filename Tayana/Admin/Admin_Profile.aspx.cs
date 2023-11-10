using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.Configuration;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Tayana
{
    public partial class Admin_Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                string ticketUserData = ((FormsIdentity)(HttpContext.Current.User.Identity)).Ticket.UserData;
                string[] ticketUserDataArr = ticketUserData.Split(';');
                if (ticketUserDataArr.Length >= 2 && !string.IsNullOrEmpty(ticketUserDataArr[1]))
                {
                    ShowUsersData();
                    ErrorMessageLabel.Visible = false;
                }
                else
                {
                    ProfilePanel.Visible = false;
                    ErrorMessageLabel.Visible = true;
                    ErrorMessageLabel.Text = "您無權限";
                }
            }
        }
        private void ShowUsersData()
        {
            string ticketUserData = ((FormsIdentity)(HttpContext.Current.User.Identity)).Ticket.UserData;
            string[] ticketUserDataArr = ticketUserData.Split(';');
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["TayanaConnectionString"].ConnectionString);
            string sql = "SELECT id, avatar, name, email FROM [Users] WHERE id=@id";
            SqlCommand command = new SqlCommand(sql, connection);
            command.Parameters.AddWithValue("@id", ticketUserDataArr[1]);
            try
            {
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                UserDataList.DataSource = reader;
                UserDataList.DataBind();
            }
            catch
            {
                ToastUserControl.Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowErrorMessage", "showMessageBox('系統錯誤，稍後再試', 'error');", true);
            }
            finally
            {
                connection.Close();
            }
        }
        protected void UserDataList_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                UserDataList.EditItemIndex = e.Item.ItemIndex;
                ShowUsersData();
            }
            else if (e.CommandName == "Update")
            {

                DataListItem item = e.Item;
                TextBox EditNameTextBox = (TextBox)item.FindControl("EditNameTextBox");
                TextBox EditEmailTextBox = (TextBox)item.FindControl("EditEmailTextBox");
                FileUpload UpdateFileUpload = (FileUpload)item.FindControl("UpdateFileUpload");
                string imagePath = string.Empty;
                if (UpdateFileUpload.HasFile)
                {
                    if (ImageValidator.IsValidFile(UpdateFileUpload.FileName))
                    {
                        if (ImageValidator.IsValidFileSize(UpdateFileUpload.FileContent.Length))
                        {
                            string fileName = ImageValidator.SaveImage(UpdateFileUpload.FileName);
                            imagePath = "/images/" + fileName;
                            UpdateFileUpload.SaveAs(Server.MapPath(String.Format("/images/{0}", fileName)));
                            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["ProjectConnectionString"].ConnectionString);
                            string sql = "UPDATE Users SET avatar=@avatar, username=@username, email=@email WHERE id=@id";
                            SqlCommand command = new SqlCommand(sql, connection);
                            command.Parameters.AddWithValue("@id", Session["UserId"]);
                            command.Parameters.AddWithValue("@avatar", imagePath);
                            command.Parameters.AddWithValue("@username", EditNameTextBox.Text);
                            command.Parameters.AddWithValue("@email", EditEmailTextBox.Text);
                            connection.Open();
                            command.ExecuteNonQuery();
                            connection.Close();
                        }
                        else
                        {
                            ErrorMessageLabel.Visible = true;
                            ErrorMessageLabel.Text = "上傳檔案過大";
                            return;
                        }
                    }
                    else
                    {
                        ErrorMessageLabel.Visible = true;
                        ErrorMessageLabel.Text = "只能夠上傳字尾為.gif,.jpg,.bmp,.png的檔案";
                        return;
                    }
                }
                else
                {
                    SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["ProjectConnectionString"].ConnectionString);
                    string sql = "UPDATE Users SET username=@username, email=@email WHERE id=@id";
                    SqlCommand command = new SqlCommand(sql, connection);
                    command.Parameters.AddWithValue("@id", Session["UserId"]);
                    command.Parameters.AddWithValue("@username", EditNameTextBox.Text);
                    command.Parameters.AddWithValue("@email", EditEmailTextBox.Text);
                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();
                }
                UserDataList.EditItemIndex = -1;
                ToastUserControl.Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowSuccessMessage", "showMessageBox('更新成功', 'success');", true);
                Response.Redirect("Admin_Profile.aspx");
            }
            else if (e.CommandName == "Cancel")
            {
                UserDataList.EditItemIndex = -1;
                ShowUsersData();
            }

        }
    }
}