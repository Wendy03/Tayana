<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Admin_Profile.aspx.cs" Inherits="Tayana.Admin_Profile" %>

<%@ Register Src="~/ToastUserControl.ascx" TagPrefix="uc1" TagName="ToastUserControl" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminContentPlaceHolder" runat="server">
    <uc1:ToastUserControl runat="server" ID="ToastUserControl" />
    <asp:Label ID="ErrorMessageLabel" runat="server" Visible="False" ForeColor="Red"></asp:Label>
    <asp:Panel ID="ProfilePanel" runat="server">
        <div class="container my-5">
            <div class="row justify-content-center">
                <div class="col-8">
                    <h3>個人資料</h3>
                    <br />
                    <br />
                    <asp:DataList ID="UserDataList" runat="server" OnItemCommand="UserDataList_ItemCommand">
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("avatar") %>' Width="150px" CssClass="rounded-circle" />
                            <br />
                            <br />
                            姓名:
                            <asp:Label ID="usernameLabel" runat="server" Text='<%# Eval("name") %>' />
                            <br />
                            E-mail:
                            <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />
                            <br />
                            <br />
                            <asp:Button ID="EditButton" runat="server" Text="編輯" CommandName="Edit" Visible='<%# !((DataListItem)Container).ItemType.Equals(ListItemType.EditItem) %>' />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:FileUpload ID="UpdateFileUpload" runat="server" />
                            <br />
                            <asp:Label ID="EditNameLabel" runat="server" Text="姓名"></asp:Label>
                            <asp:TextBox ID="EditNameTextBox" runat="server" Text='<%# Eval("name") %>'></asp:TextBox>
                            <br />
                            <asp:Label ID="EditEmailLabel" runat="server" Text="E-mail"></asp:Label>
                            <asp:TextBox ID="EditEmailTextBox" runat="server" Text='<%# Eval("email") %>'></asp:TextBox>
                            <br />
                            <asp:Button ID="UpdateButton" runat="server" Text="更新" CommandName="Update" />
                            <asp:Button ID="CancelButton" runat="server" Text="取消" CommandName="Cancel" />
                        </EditItemTemplate>
                    </asp:DataList>
                </div>
            </div>
        </div>
    </asp:Panel>
</asp:Content>
