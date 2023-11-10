using Konscious.Security.Cryptography;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Tayana
{
    public partial class Admin_SignIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SignInButton_Click(object sender, EventArgs e)
        {
            string password = PasswordTextBox.Text;
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["TayanaConnectionString"].ConnectionString);
            string sql = "SELECT * FROM Users WHERE email = @email";
            SqlCommand command = new SqlCommand(sql, connection);
            command.Parameters.AddWithValue("@email", EmailTextBox.Text);
            SqlDataAdapter dataAdapter = new SqlDataAdapter(command);
            DataTable dataTable = new DataTable();
            dataAdapter.Fill(dataTable);
            if (dataTable.Rows.Count > 0)
            {
                byte[] hash = Convert.FromBase64String(dataTable.Rows[0]["password"].ToString());
                byte[] salt = Convert.FromBase64String(dataTable.Rows[0]["salt"].ToString());
                bool success = VerifyHash(password, salt, hash);

                if (success)
                {
                    string userData = dataTable.Rows[0]["isAdmin"].ToString() + ";" + dataTable.Rows[0]["id"].ToString();
                    //設定驗證票(夾帶資料，cookie 命名) // 需額外引入using System.Web.Configuration;
                    string userId = dataTable.Rows[0]["id"].ToString();
                    SetAuthenTicket(userData, userId);
                    //導頁至權限分流頁
                    Response.Redirect("CheckAccount.ashx");
                }
                else
                {
                    LoginErrorMsg.Text = "password error, login failed!";
                    LoginErrorMsg.Visible = true;
                    connection.Close();
                    return;
                }
            }
            else
            {
                //資料庫裡找不到相同資料時，表示帳號有誤!
                LoginErrorMsg.Text = "Account error, login failed!";
                LoginErrorMsg.Visible = true;
                //終止程式
                //Response.End(); //會清空頁面
                return;
            }
            connection.Close();
        }

        private byte[] HashPassword(string password, byte[] salt)
        {
            var argon2 = new Argon2id(Encoding.UTF8.GetBytes(password));

            //底下這些數字會影響運算時間，而且驗證時要用一樣的值
            argon2.Salt = salt;
            argon2.DegreeOfParallelism = 8; // 4 核心就設成 8
            argon2.Iterations = 4; //迭代運算次數
            argon2.MemorySize = 1024 * 1024; // 1 GB

            return argon2.GetBytes(16);
        }
        //驗證
        private bool VerifyHash(string password, byte[] salt, byte[] hash)
        {
            var newHash = HashPassword(password, salt);
            return hash.SequenceEqual(newHash); // LINEQ
        }
        private void SetAuthenTicket(string userData, string userId)
        {
            //宣告一個驗證票 //需額外引入 using System.Web.Security;
            FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(1, userId, DateTime.Now, DateTime.Now.AddHours(3), false, userData);
            //加密驗證票
            string encryptedTicket = FormsAuthentication.Encrypt(ticket);
            //建立 Cookie
            HttpCookie authenticationCookie = new HttpCookie(FormsAuthentication.FormsCookieName, encryptedTicket);
            //將 Cookie 寫入回應
            Response.Cookies.Add(authenticationCookie);
        }
    }
}