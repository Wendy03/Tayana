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
    public partial class Admin_Yachts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ShowModels();
            }
        }
        private void ShowModels()
        {
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["TayanaConnectionString"].ConnectionString);
            string sql = "SELECT * FROM Yachts  ORDER BY initDate DESC";
            SqlCommand command = new SqlCommand(sql, connection);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            ModelsGridView.DataSource = reader;
            ModelsGridView.DataBind();
            connection.Close();
        }
       
        protected void AddModelButton_Click(object sender, EventArgs e)
        {
            MessageLabel.Visible = false;
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["TayanaConnectionString"].ConnectionString);
            string brandName = BrandTextBox.Text;
            string modelNum = ModelTextBox.Text;
            string model = brandName + " " + modelNum;
            string findModel = "SELECT * FROM Yachts WHERE model=@model";
            SqlCommand findModelCommand = new SqlCommand(findModel, connection);
            findModelCommand.Parameters.AddWithValue("@model", model);
            connection.Open();
            SqlDataReader reader = findModelCommand.ExecuteReader();
            bool modelExists = reader.HasRows;
            ToastUserControl.Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowSuccessMessage", "showMessageBox('新增成功', 'success');", true);
            connection.Close();

            if (!modelExists)
            {
                if(string.IsNullOrEmpty(brandName) || string.IsNullOrEmpty(modelNum))
                {
                    MessageLabel.Visible = true;
                    MessageLabel.Text = "船名或型號為必填";
                    return;
                }
                DateTime nowTime = DateTime.Now;
                string nowSec = nowTime.ToString("ff");
                string guid = Guid.NewGuid().ToString().Trim() + nowSec;
                string insertSql = "INSERT INTO Yachts (model, guid, isNewBuild, isNewDesign) VALUES (@model, @guid, @isNewBuild, @isNewDesign)";
                SqlCommand insertCommand = new SqlCommand(insertSql, connection);
                insertCommand.Parameters.AddWithValue("@model", model);
                insertCommand.Parameters.AddWithValue("@guid", guid);
                insertCommand.Parameters.AddWithValue("@isNewBuild", false);
                insertCommand.Parameters.AddWithValue("@isNewDesign", false);
                connection.Open();
                insertCommand.ExecuteNonQuery();
                connection.Close();
                ToastUserControl.Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowSuccessMessage", "showMessageBox('新增成功', 'success');", true);
                ModelTextBox.Text = "";
                Response.Redirect("Admin_Yachts.aspx");
            }
            else
            {
                MessageLabel.Visible = true;
                MessageLabel.Text = "遊艇型號重複";
                ToastUserControl.Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowErrorMessage", "showMessageBox('新增失敗', 'error');", true);
                return;
            }
        }

        protected void ModelsGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string id = ModelsGridView.DataKeys[e.RowIndex].Value.ToString();
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["TayanaConnectionString"].ConnectionString);
            string sqlImage = $"DELETE FROM Images WHERE yachtId = {id}";
            SqlCommand commandImage = new SqlCommand(sqlImage, connection);
            connection.Open();
            commandImage.ExecuteNonQuery();
            connection.Close();
            string sqlYacht = $"DELETE FROM Yachts WHERE id = {id}";
            SqlCommand commandYacht = new SqlCommand(sqlYacht, connection);
            connection.Open();
            commandYacht.ExecuteNonQuery();
            connection.Close();
            ToastUserControl.Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowSuccessMessage", "showMessageBox('刪除成功', 'success');", true);
            ShowModels();
        }

        protected void ModelsGridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            ModelsGridView.EditIndex = e.NewEditIndex;
            ShowModels();
        }
        protected void ModelsGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            ModelsGridView.EditIndex = -1;
            ShowModels();
        }

        protected void ModelsGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string id = ModelsGridView.DataKeys[e.RowIndex].Value.ToString();
            GridViewRow row = ModelsGridView.Rows[e.RowIndex];
            TextBox ModelTextBox = (TextBox)row.FindControl("ModelTextBox");
            CheckBox EditNewBuildCheckBox = (CheckBox)row.FindControl("EditNewBuildCheckBox");
            CheckBox EditNewDesignCheckBox = (CheckBox)row.FindControl("EditNewDesignCheckBox");
            string modelStr = ModelTextBox.Text;
            if (!string.IsNullOrEmpty(modelStr))
            {
                
                SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["TayanaConnectionString"].ConnectionString);
                string sql = $"UPDATE Yachts SET model=@model, isNewBuild=@isNewBuild, isNewDesign=@isNewDesign WHERE id={id}";
                SqlCommand command = new SqlCommand(sql, connection);
                command.Parameters.AddWithValue("@model", modelStr);
                command.Parameters.AddWithValue("@isNewBuild", EditNewBuildCheckBox.Checked);
                command.Parameters.AddWithValue("@isNewDesign", EditNewDesignCheckBox.Checked);
                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();
                ModelsGridView.EditIndex = -1;
                ToastUserControl.Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowSuccessMessage", "showMessageBox('更新成功', 'success');", true);
                ShowModels();
            }
        }
    }
}