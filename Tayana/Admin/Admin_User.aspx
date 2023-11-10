<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Admin_User.aspx.cs" Inherits="Tayana.Admin_User" %>

<%@ Register Src="~/ToastUserControl.ascx" TagPrefix="uc1" TagName="ToastUserControl" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminContentPlaceHolder" runat="server">
    <uc1:ToastUserControl runat="server" ID="ToastUserControl" />
    <asp:Label ID="WarningLabel" runat="server" Visible="False" ForeColor="#FF3300"></asp:Label>
    <asp:Panel ID="UserListPanel" runat="server">
        <div class="mb-4">
            <h3>新增人員</h3>
            <asp:TextBox ID="AddUserNameTextBox" runat="server" placeholder="Name"></asp:TextBox>
            <asp:TextBox ID="AddEmailTextBox" runat="server" placeholder="Email" TextMode="Email"></asp:TextBox>
            <asp:TextBox ID="AddPasswordTextBox" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
            <asp:Button ID="AddUserButton" runat="server" Text="新增人員" Style="height: 33px" OnClick="AddUserButton_Click" />
            <asp:Label ID="AddUserMessage" runat="server" Text="Label" ForeColor="Red" Visible="False"></asp:Label>
        </div>
        <div>
            <h3>員工資料</h3>
            <div class="table-responsive">
                <asp:GridView ID="UsersGridView" class="table table-striped" runat="server" AutoGenerateColumns="False" OnRowCancelingEdit="UsersGridView_RowCancelingEdit" OnRowDeleting="UsersGridView_RowDeleting" OnRowEditing="UsersGridView_RowEditing" OnRowUpdating="UsersGridView_RowUpdating" DataKeyNames="id" OnRowDataBound="UsersGridView_RowDataBound">
                    <Columns>
                        <asp:TemplateField HeaderText="#" InsertVisible="False" SortExpression="id">
                            <ItemTemplate>
                                <%#Container.DataItemIndex+1%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Avatar" SortExpression="avatar">
                            <EditItemTemplate>
                                <asp:FileUpload ID="EditAvatarFileUpload" runat="server" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Image ID="AvatarImage" runat="server" ImageUrl='<%# Eval("avatar") %>' Width="100px" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="E-mail" SortExpression="email">
                            <EditItemTemplate>
                                <asp:TextBox ID="EditEmailTextBox" runat="server" Text='<%# Bind("email") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="EmailLabel" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="姓名" SortExpression="name">
                            <EditItemTemplate>
                                <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="NameLabel" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="最高管理者" SortExpression="isAdmin">
                            <EditItemTemplate>
                                <asp:CheckBox ID="EditAdminCheckBox" runat="server" Checked='<%# Bind("isAdmin") %>' />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="IsAdminCheckBox" runat="server" Checked='<%# Bind("isAdmin") %>' Enabled="false" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="initDate" HeaderText="新增日期" SortExpression="initDate" ReadOnly="True" DataFormatString="{0:yyyy/MM/dd}" />
                        <asp:CommandField ShowEditButton="True" ControlStyle-CssClass="btn btn-primary">
                            <ControlStyle CssClass="btn btn-primary" />
                        </asp:CommandField>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="DelUserLinkButton" runat="server" CausesValidation="False" CommandName="Delete" Text="刪除" CssClass="btn btn-danger" OnClientClick="return confirm('確定要刪除嗎？');"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </asp:Panel>
</asp:Content>
