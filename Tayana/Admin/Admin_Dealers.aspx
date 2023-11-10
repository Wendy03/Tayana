<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Admin_Dealers.aspx.cs" Inherits="Tayana.Admin_Dealers" %>

<%@ Register Src="~/ToastUserControl.ascx" TagPrefix="uc1" TagName="ToastUserControl" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminContentPlaceHolder" runat="server">
    <uc1:ToastUserControl runat="server" ID="ToastUserControl" />
    <h2 class="mb-4">代理商管理</h2>
    <asp:Button ID="AddDealerButton" runat="server" Text="新增代理商" OnClick="AddDealerButton_Click" />
    <br />
    <br />
    <asp:HyperLink ID="CountriesHyperLink" runat="server" NavigateUrl="~/Admin/Admin_Dealers.aspx"><i class="ti-angle-double-left"> Back</i></asp:HyperLink>
    <br />
    <div class="table-responsive mt-4">
        <asp:GridView ID="DealersGridView" class="table table-striped" runat="server" AutoGenerateColumns="False" OnRowCommand="DealersGridView_RowCommand">
            <Columns>
                <asp:TemplateField HeaderText="#" InsertVisible="False" SortExpression="id">
                    <ItemTemplate>
                        <%#Container.DataItemIndex+1%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="國家" SortExpression="countryId">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("country") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="area" HeaderText="城市" SortExpression="area" />
                <asp:TemplateField HeaderText="代理商圖" SortExpression="dealerImg">
                    <ItemTemplate>
                        <asp:Image ID="DealerImage" runat="server" ImageUrl='<%# Eval("dealerImg") %>' Width="150px" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="name" HeaderText="公司名稱" SortExpression="name" />
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="EditDealerButton" runat="server" Text="編輯" CommandName="Edit" CommandArgument='<%# Eval("id") %>' CssClass="btn btn-mat waves-effect waves-light btn-primary" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="DelDealerButton" runat="server" Text="刪除" CommandName="Del" CommandArgument='<%# Eval("id") %>' CssClass="btn btn-mat waves-effect waves-light btn-danger" OnClientClick="return confirm('確定要刪除嗎？');" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
