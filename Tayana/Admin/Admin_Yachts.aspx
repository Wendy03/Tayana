<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Admin_Yachts.aspx.cs" Inherits="Tayana.Admin_Yachts" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<%@ Register Src="~/ToastUserControl.ascx" TagPrefix="uc1" TagName="ToastUserControl" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminContentPlaceHolder" runat="server">
    <uc1:ToastUserControl runat="server" ID="ToastUserControl" />
    <div class="mb-4">
        <h2 class="mb-4">遊艇管理</h2>
        <div class="row">
            <div class="col-md-6">
                <div class="input-group mb-3">
                    <asp:TextBox ID="BrandTextBox" runat="server" placeholder="輸入船名"></asp:TextBox>
                    <asp:TextBox ID="ModelTextBox" runat="server" CssClass="form-control" placeholder="輸入船型號"></asp:TextBox>
                    <asp:Button ID="AddModelButton" runat="server" Text="新增型號" CssClass="btn btn-outline-secondary" OnClick="AddModelButton_Click" />
                </div>
            </div>
        </div>
        <asp:Label ID="MessageLabel" runat="server" Text="Label" Visible="False" ForeColor="Red"></asp:Label>
    </div>
    <br />
    <br />
    <asp:GridView ID="ModelsGridView" class="table table-striped" runat="server" AutoGenerateColumns="False" DataKeyNames="id" OnRowCancelingEdit="ModelsGridView_RowCancelingEdit" OnRowDeleting="ModelsGridView_RowDeleting" OnRowEditing="ModelsGridView_RowEditing" OnRowUpdating="ModelsGridView_RowUpdating">
        <Columns>
            <asp:TemplateField HeaderText="#" SortExpression="id">
                <ItemTemplate>
                    <%#Container.DataItemIndex+1%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="model" SortExpression="model">
                <EditItemTemplate>
                    <asp:TextBox ID="ModelTextBox" runat="server" Text='<%# Bind("model") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:HyperLink ID="ModelHyperLink" runat="server" Text='<%# Bind("model") %>' NavigateUrl='<%# "~/Admin//Admin_YachtDetail.aspx?id="+Eval("id") %>' style="text-decoration: underline"></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="New Build" SortExpression="isNewBuild">
                <EditItemTemplate>
                    <asp:CheckBox ID="EditNewBuildCheckBox" runat="server" Checked='<%# Bind("isNewBuild") %>' />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="NewBuildCheckBox" runat="server" Checked='<%#  Convert.ToBoolean(Eval("isNewBuild")) %>' Enabled="false" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="New Design" SortExpression="isNewDesign">
                <EditItemTemplate>
                    <asp:CheckBox ID="EditNewDesignCheckBox" runat="server" Checked='<%# Bind("isNewDesign") %>' />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="NewDesignCheckBox" runat="server" Checked='<%#  Convert.ToBoolean(Eval("isNewDesign")) %>' Enabled="false" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="initDate" HeaderText="新增日期" SortExpression="initDate" ReadOnly="True" DataFormatString="{0:yyyy/MM/dd}" />
            <asp:CommandField ShowEditButton="True" ControlStyle-CssClass="btn btn-primary" />
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="刪除" CssClass="btn btn-danger" OnClientClick="return confirm('確定要刪除嗎？');"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

</asp:Content>
