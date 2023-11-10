<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Admin_NewsList.aspx.cs" Inherits="Tayana.Admin_NewsList" %>

<%@ Register Src="~/ToastUserControl.ascx" TagPrefix="uc1" TagName="ToastUserControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminContentPlaceHolder" runat="server">
    <uc1:ToastUserControl runat="server" ID="ToastUserControl" />
    <h2 class="mb-4">News 管理</h2>
    <asp:Button ID="AddNewsButton" runat="server" Text="新增 News" OnClick="AddNewsButton_Click" />
    <br />
    <br />
    <div class="table-responsive">
        <asp:GridView ID="NewsGridView" class="table table-striped" runat="server" AutoGenerateColumns="False" DataKeyNames="id" OnRowCommand="NewsGridView_RowCommand">
            <Columns>
                <asp:TemplateField HeaderText="#" InsertVisible="False" SortExpression="id">
                    <ItemTemplate>
                        <%#Container.DataItemIndex+1%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="封面" SortExpression="coverImg">
                    <ItemTemplate>
                        <asp:Image ID="DealerImage" runat="server" ImageUrl='<%# Eval("coverImg") %>' Width="150px" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="title" HeaderText="標題" SortExpression="title" />
                <asp:TemplateField HeaderText="是否至頂" SortExpression="isTop">
                    <ItemTemplate>
                        <asp:CheckBox ID="IsTopCheckBox" runat="server" Checked='<%# Eval("isTop") %>' Enabled="false" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="publishDate" HeaderText="發布日期" SortExpression="publishDate" DataFormatString="{0:yyyy/MM/dd}" />
                <asp:BoundField DataField="initDate" HeaderText="新增日期" SortExpression="initDate" DataFormatString="{0:yyyy/MM/dd}" />
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="EditNewsButton" runat="server" Text="編輯" CommandName="Edit" CommandArgument='<%# Eval("id") %>' CssClass="btn btn-mat waves-effect waves-light btn-primary" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="DelNewsButton" runat="server" Text="刪除" CommandName="Del" CommandArgument='<%# Eval("id") %>' CssClass="btn btn-mat waves-effect waves-light btn-danger" OnClientClick="return confirm('確定要刪除嗎？');" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
