<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Admin_News.aspx.cs" Inherits="Tayana.Admin_News" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<%@ Register Src="~/ToastUserControl.ascx" TagPrefix="uc1" TagName="ToastUserControl" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminContentPlaceHolder" runat="server">
    <uc1:ToastUserControl runat="server" ID="ToastUserControl" />
    <h3>News</h3>
    <div class="form-group row mt-5">
        <label class="col-sm-2 col-form-label">標題</label>
        <div class="col-sm-10">
            <asp:TextBox ID="TitleTextBox" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <asp:Label ID="TitleMessage" runat="server" Text="標題必填" ForeColor="Red" Visible="False"></asp:Label>
    </div>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label">小標</label>
        <div class="col-sm-10">
            <asp:TextBox ID="SubtitleTextBox" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
    </div>
    <asp:Literal ID="CoverImg" runat="server"></asp:Literal>
        <br />
     <asp:Literal ID="NewsImgLiteral" runat="server"></asp:Literal>
        <div class="form-group row">
            <br />
            <label class="col-sm-2 col-form-label">
                封面圖</label>
            <div class="col-sm-10">
                <asp:FileUpload ID="NewsImgFileUpload" runat="server" />
            </div>
            <asp:Label ID="MessageLabel" runat="server" Text="Label" ForeColor="Red" Visible="False"></asp:Label>
        </div>
    <CKEditor:CKEditorControl ID="NewsCKEditorControl" runat="server" BasePath="/Scripts/ckeditor/"
        Toolbar="Bold|Italic|Underline|Strike|Subscript|Superscript|-|RemoveFormat
        NumberedList|BulletedList|-|Outdent|Indent|-|JustifyLeft|JustifyCenter|JustifyRight|JustifyBlock|-|BidiLtr|BidiRtl
        /
        Styles|Format|Font|FontSize
        TextColor|BGColor
        Link|Image">
    </CKEditor:CKEditorControl>
     <div class="form-group row mt-4">
        <label class="col-sm-2 col-form-label">發布日期</label>
        <div class="col-sm-10">
            <asp:TextBox ID="DateTextBox" runat="server" TextMode="Date"></asp:TextBox>
            <asp:Label ID="ErrorMessageLabel" runat="server" Text="Label" Visible="False" ForeColor="Red"></asp:Label>
        </div>
    </div>
    <div class="my-4">
        <asp:CheckBox ID="isTopCheckBox" runat="server" />
         <label>是否至頂</label>
    </div>
    <div class="d-grid gap-2 col-6 mx-auto">
        <asp:Button ID="SaveNewsButton" runat="server" Text="Save" OnClick="SaveNewsButton_Click" CssClass="btn btn-mat waves-effect waves-light btn-success" />
        <asp:Button ID="CancelButton" runat="server" Text="取消" OnClick="CancelButton_Click" CssClass="btn waves-effect waves-light btn-inverse btn-outline-inverse" />
    </div>
</asp:Content>
