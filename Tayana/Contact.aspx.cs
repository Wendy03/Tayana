using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MailKit.Net.Smtp;
using MimeKit;

namespace Tayana
{
    public partial class Contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public void sendMail()
        {

            //宣告使用 MimeMessage
            var message = new MimeMessage();
            //設定發信地址 ("發信人", "發信 email")
            message.From.Add(new MailboxAddress("Yachts", "wendysu03@gmail.com"));
            //設定收信地址 ("收信人", "收信 email")
            message.To.Add(new MailboxAddress(Name.Text.Trim(), Email.Text.Trim()));
            //寄件副本email
            message.Cc.Add(new MailboxAddress("收信人名稱", "wendysu03@gmail.com"));
            //設定優先權
            //message.Priority = MessagePriority.Normal;
            //信件標題
            message.Subject = "Yachts Auto Email";
            //建立 html 郵件格式
            BodyBuilder bodyBuilder = new BodyBuilder();
            bodyBuilder.HtmlBody =
                "<h1>Thank you for contacting us!</h1>" +
                $"<h3>Name : {Name.Text.Trim()}</h3>" +
                $"<h3>Email : {Email.Text.Trim()}</h3>" +
                $"<h3>Phone : {Phone.Text.Trim()}</h3>" +
                $"<h3>Country : {country.SelectedValue}</h3>" +
                $"<h3>Type : {yacht.SelectedValue}</h3>" +
                $"<h3>Comments : </h3>" +
                $"<p>{Comments.Text.Trim()}</p>";
            //設定郵件內容
            message.Body = bodyBuilder.ToMessageBody(); //轉成郵件內容格式
            try
            {
                using (var client = new SmtpClient())
                {
                    //有開防毒時需設定 false 關閉檢查
                    client.CheckCertificateRevocation = false;
                    //設定連線 gmail ("smtp Server", Port, SSL加密) 
                    client.Connect("smtp.gmail.com", 587, false); // localhost 測試使用加密需先關閉 

                    // Note: only needed if the SMTP server requires authentication
                    client.Authenticate("wendysu03@gmail.com", "");
                    //發信
                    client.Send(message);
                    //結束連線
                    client.Disconnect(true);
                }
            }
            catch (Exception ex)
            {
                ToastUserControl.Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowErrorMessage", $"showMessageBox({ex}, 'error');", true);
            }
        }

        protected void SubmitButton_Click(object sender, ImageClickEventArgs e)
        {
            if (String.IsNullOrEmpty(Recaptcha1.Response))
            {
                lblMessage.Visible = true;
                lblMessage.Text = "Captcha cannot be empty.";
            }
            else
            {
                var result = Recaptcha1.Verify();
                if (result.Success)
                {
                    sendMail();
                    ToastUserControl.Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowSuccessMessage", "showMessageBox('Thank you for contacting us!', 'success');", true);
                }
                else
                {
                    lblMessage.Text = "Error(s): ";
                    foreach (var err in result.ErrorCodes)
                    {
                        lblMessage.Text = lblMessage.Text + err;
                    }
                }
            }
            
            //送出信件後清空資料表
            Name.Text = string.Empty;
            Email.Text = string.Empty;
            Phone.Text = string.Empty;
            country.ClearSelection();
            yacht.ClearSelection();
            Comments.Text = string.Empty;
        }
    }
}