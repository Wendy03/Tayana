<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Admin_Dealer.aspx.cs" Inherits="Tayana.Admin_Dealer" %>

<%@ Register Src="~/ToastUserControl.ascx" TagPrefix="uc1" TagName="ToastUserControl" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminContentPlaceHolder" runat="server">
    <uc1:ToastUserControl runat="server" ID="ToastUserControl" />
    <h3>代理商</h3>
    <div class="card p-4">
        <asp:Literal ID="ImgLiteral" runat="server"></asp:Literal>
        <br />
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">
                代理商圖片</label>
            <div class="col-sm-10">
                <asp:FileUpload ID="DealerImgFileUpload" runat="server" />
            </div>
            <asp:Label ID="MessageLabel" runat="server" Text="Label" ForeColor="Red" Visible="False"></asp:Label>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">國家</label>
            <div class="col-sm-10">
                <asp:TextBox ID="CountryTextBox" runat="server" CssClass="form-control" ReadOnly="True"></asp:TextBox>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">地區</label>
            <div class="col-sm-10">
                <asp:TextBox ID="AreaTextBox" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">公司名稱</label>
            <div class="col-sm-10">
                <asp:TextBox ID="NameTextBox" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:Label ID="NameErrMsg" runat="server" Text="Label" Visible="False" ForeColor="Red"></asp:Label>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">聯絡人</label>
            <div class="col-sm-10">
                <asp:TextBox ID="ContactTextBox" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">地址</label>
            <div class="col-sm-10">
                <asp:TextBox ID="AddTextBox" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">TEL</label>
            <div class="col-sm-10">
                <asp:TextBox ID="TelTextBox" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Cell</label>
            <div class="col-sm-10">
                <asp:TextBox ID="CellTextBox" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Fax</label>
            <div class="col-sm-10">
                <asp:TextBox ID="FaxTextBox" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">E-mail</label>
            <div class="col-sm-10">
                <asp:TextBox ID="EmailTextBox" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Link</label>
            <div class="col-sm-10">
                <asp:TextBox ID="LinkTextBox" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="d-grid gap-2 col-6 mx-auto">
            <asp:Button ID="SaveDealerButton" runat="server" Text="Save" OnClick="SaveDealerButton_Click" CssClass="btn btn-mat waves-effect waves-light btn-success" />
            <asp:Button ID="CancelButton" runat="server" Text="取消" OnClick="CancelButton_Click" CssClass="btn waves-effect waves-light btn-inverse btn-outline-inverse" />
        </div>
    </div>
</asp:Content>
