<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Admin_Compan.aspx.cs" Inherits="Tayana.Admin_Compan" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<%@ Register Src="~/ToastUserControl.ascx" TagPrefix="uc1" TagName="ToastUserControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminContentPlaceHolder" runat="server">
    <uc1:ToastUserControl runat="server" ID="ToastUserControl" />
    <h2 class="mb-4">公司介紹</h2>
    <h3>About</h3>
    <CKEditor:CKEditorControl ID="AboutCKEditorControl" runat="server" BasePath="/Scripts/ckeditor/"
        Toolbar="Bold|Italic|Underline|Strike|Subscript|Superscript|-|RemoveFormat
        NumberedList|BulletedList|-|Outdent|Indent|-|JustifyLeft|JustifyCenter|JustifyRight|JustifyBlock|-|BidiLtr|BidiRtl
        /
        Styles|Format|Font|FontSize
        TextColor|BGColor
        Link|Image">
    </CKEditor:CKEditorControl>
    <div class="d-grid gap-2 d-md-flex justify-content-md-end mt-4 ">
        <asp:Button ID="SaveAboutButton" runat="server" Text="Save" OnClick="SaveAboutButton_Click" CssClass="btn btn-success px-5" />
    </div>
    <br />
    <br />
    <h3>Certificat</h3>
    <CKEditor:CKEditorControl ID="CertificatCKEditorControl" runat="server" BasePath="/Scripts/ckeditor/"
        Toolbar="Bold|Italic|Underline|Strike|Subscript|Superscript|-|RemoveFormat
        NumberedList|BulletedList|-|Outdent|Indent|-|JustifyLeft|JustifyCenter|JustifyRight|JustifyBlock|-|BidiLtr|BidiRtl
        /
        Styles|Format|Font|FontSize
        TextColor|BGColor
        Link|Image">
    </CKEditor:CKEditorControl>
    <div class="d-grid gap-2 d-md-flex justify-content-md-end mt-4 ">
        <asp:Button ID="SavCertificateButton" runat="server" Text="Save" OnClick="SavCertificateButton_Click" CssClass="btn btn-success px-5" />
    </div>
    <br />
</asp:Content>
