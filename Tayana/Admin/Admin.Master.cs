using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Tayana
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetNoStore();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!HttpContext.Current.User.Identity.IsAuthenticated)
            {
                Response.Redirect("Admin_SignIn.aspx"); //導回登入頁;
                AdminContentPlaceHolder.Visible = false;
            }
            else
            {
                //取得驗證票夾帶資訊
                string ticketUserData = ((FormsIdentity)(HttpContext.Current.User.Identity)).Ticket.UserData;
                string[] ticketUserDataArr = ticketUserData.Split(';');
                bool haveRight = HttpContext.Current.User.Identity.IsAuthenticated;
                //依管理權限導頁
                if (haveRight)
                {
                    if (ticketUserDataArr[0].Equals("True"))
                    {
                        UserListPanel.Visible = true;
                    }
                    else
                    {

                        UserListPanel.Visible = false;
                    }
                    ShowUsersData();
            
                }
            }
        }
        private void ShowUsersData()
        {
            string ticketUserData = ((FormsIdentity)(HttpContext.Current.User.Identity)).Ticket.UserData;
            string[] ticketUserDataArr = ticketUserData.Split(';');
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["TayanaConnectionString"].ConnectionString);
            string sql = "SELECT id, avatar, name FROM Users WHERE id=@id";
            SqlCommand command = new SqlCommand(sql, connection);
            command.Parameters.AddWithValue("@id", ticketUserDataArr[1]);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            if (reader.Read())
            {
                NavAvatar.ImageUrl = reader["avatar"].ToString();
                NavUserName.Text = reader["name"].ToString();
                SideAvatar.ImageUrl = reader["avatar"].ToString();
                SideUserName.Text = reader["name"].ToString();
            }
            reader.Close();
            connection.Close();
        }
    }
}