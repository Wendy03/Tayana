<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Admin_DealerCountry.aspx.cs" Inherits="Tayana.Admin_DealerCountry" %>

<%@ Register Src="~/ToastUserControl.ascx" TagPrefix="uc1" TagName="ToastUserControl" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminContentPlaceHolder" runat="server">
    <uc1:ToastUserControl runat="server" ID="ToastUserControl" />
    <div class="row justify-content-center">
        <div class="col-md-10">
            <h2 class="mb-4">代理商國家</h2>
            <div class="row">
                <div class="col-6">
                    <div class="input-group mb-3">
                        <asp:TextBox ID="CountryTextBox" runat="server" CssClass="form-control" placeholder="請輸入國家"></asp:TextBox>
                        <asp:Button ID="AddCountyButton" runat="server" Text="Add" CssClass="btn btn-primary waves-effect waves-light" OnClick="AddCountyButton_Click" />
                    </div>
                    <br />
                    <asp:Label ID="MessageLabel" runat="server" Text="Label" ForeColor="Red" Visible="False"></asp:Label>
                </div>
            </div>
            <br />
            <br />

            <asp:GridView ID="CountryGridView" class="table table-striped" runat="server" AutoGenerateColumns="False" DataKeyNames="id" OnRowCancelingEdit="CountryGridView_RowCancelingEdit" OnRowDeleting="CountryGridView_RowDeleting" OnRowEditing="CountryGridView_RowEditing" OnRowUpdating="CountryGridView_RowUpdating">
                <Columns>
                    <asp:TemplateField HeaderText="編號" InsertVisible="False" SortExpression="id">
                        <ItemTemplate>
                            <%#Container.DataItemIndex+1%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="國家" SortExpression="country" ControlStyle-Width="150px">
                        <EditItemTemplate>
                            <asp:TextBox ID="EditCountryTextBox" runat="server" Text='<%# Bind("country") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:HyperLink ID="CountryHyperLink" runat="server" Text='<%# Bind("country") %>' NavigateUrl='<%# "~/Admin/Admin_Dealers.aspx?id="+Eval("id") %>' Style="text-decoration: underline"></asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="initDate" HeaderText="新增日期" SortExpression="initDate" Visible="False" />
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton ID="UpdateLinkButton" runat="server" CausesValidation="True" CommandName="Update" Text="更新"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="CancelLinkButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消"></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="EditLinkButton" runat="server" CausesValidation="False" CommandName="Edit" Text="編輯" CssClass="btn btn-primary waves-effect waves-light">
                        <i class="ti-pencil">編輯國家</i>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="刪除" CssClass="btn waves-effect waves-light btn-danger" OnClientClick="return confirm('確定要刪除嗎？');">
                        <i class="ti-trash"></i>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
