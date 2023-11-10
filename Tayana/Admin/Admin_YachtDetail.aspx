<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Admin_YachtDetail.aspx.cs" Inherits="Tayana.Admin_YachtDetail" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<%@ Register Src="~/ToastUserControl.ascx" TagPrefix="uc1" TagName="ToastUserControl" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminContentPlaceHolder" runat="server">
    <uc1:ToastUserControl runat="server" ID="ToastUserControl" />
    <asp:Literal ID="ModelLiteral" runat="server"></asp:Literal>
    <br />
    <br />
    <asp:HyperLink ID="YachtsHyperLink" runat="server" NavigateUrl="~/Admin/Admin_Yachts.aspx"><i class="ti-angle-double-left"> Back</i></asp:HyperLink>
    <div class="my-4">
        <ul class="nav">
            <li class="nav-item">
                <asp:LinkButton ID="ImageLinkButton" runat="server" Text="Yachts Image" OnClick="ModeButton_Click" CommandArgument="image" CssClass="nav-link"></asp:LinkButton>
            </li>
            <li class="nav-item">
                <asp:LinkButton ID="ContentLinkButton" runat="server" Text="Content" OnClick="ModeButton_Click" CommandArgument="content" CssClass="nav-link"></asp:LinkButton>
            </li>
            <li class="nav-item">
                <asp:LinkButton ID="LayoutLinkButton" runat="server" Text="Layout" OnClick="ModeButton_Click" CommandArgument="layout" CssClass="nav-link"></asp:LinkButton>
            </li>
            <li class="nav-item">
                <asp:LinkButton ID="SpecsLinkButton" runat="server" Text="Specification" OnClick="ModeButton_Click" CommandArgument="specs" CssClass="nav-link"></asp:LinkButton>
            </li>
            <li class="nav-item">
                <asp:LinkButton ID="VideoLinkButton" runat="server" Text="Video" OnClick="ModeButton_Click" CommandArgument="video" CssClass="nav-link"></asp:LinkButton>
            </li>
            <li class="nav-item">
                <asp:LinkButton ID="PdfLinkButton" runat="server" Text="PDF" OnClick="ModeButton_Click" CommandArgument="pdf" CssClass="nav-link"></asp:LinkButton>
            </li>
        </ul>
    </div>
    <div>
        <asp:Panel ID="ImagePanel" runat="server">
            <div class="card p-4">
                <div class="input-group mb-3">
                    <asp:FileUpload ID="YachtImgFileUpload" runat="server" CssClass="form-control" />
                    <asp:Button ID="AddImgButton" runat="server" Text="Add" CssClass="btn btn-outline-secondary" OnClick="AddImgButton_Click" />
                </div>
                <asp:Label ID="ImgErrorMsgLabel" runat="server" Text="Label" ForeColor="Red" Visible="False"></asp:Label>
                <br />
                <br />
                <asp:GridView ID="ImgGridView" class="table table-striped" runat="server" AutoGenerateColumns="False" OnRowDeleting="ImgGridView_RowDeleting" OnRowCancelingEdit="ImgGridView_RowCancelingEdit" OnRowEditing="ImgGridView_RowEditing" OnRowUpdating="ImgGridView_RowUpdating" DataKeyNames="id">
                    <Columns>
                        <asp:TemplateField HeaderText="#" SortExpression="id">
                            <ItemTemplate>
                                <%#Container.DataItemIndex+1%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="image" SortExpression="image">
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("image") %>' Width="100px" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="主圖" SortExpression="isCover">
                            <EditItemTemplate>
                                <asp:CheckBox ID="EditCoverCheckBox" runat="server" Checked='<%# Bind("isCover") %>' />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="IsCoverCheckBox" runat="server" Checked='<%#  Convert.ToBoolean(Eval("isCover")) %>' Enabled="false" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="initDate" HeaderText="新增日期" SortExpression="initDate" DataFormatString="{0:yyyy/MM/dd}" ReadOnly="True" />
                        <asp:CommandField ShowEditButton="True" ControlStyle-CssClass="btn btn-primary" />
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" Text="刪除" CommandName="Delete" CausesValidation="False" CssClass="btn btn-danger" OnClientClick="return confirm('確定要刪除嗎？');"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </asp:Panel>
        <asp:Panel ID="ContentPanel" runat="server" Visible="False">
            <div class="card p-4">
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">介紹</label>
                    <div class="col-sm-10">
                        <CKEditor:CKEditorControl ID="OverviewCKEditorControl" runat="server" BasePath="/Scripts/ckeditor/"
                            Toolbar="Bold|Italic|Underline|Strike|Subscript|Superscript|-|RemoveFormat
        NumberedList|BulletedList|-|Outdent|Indent|-|JustifyLeft|JustifyCenter|JustifyRight|JustifyBlock|-|BidiLtr|BidiRtl
        /
        Styles|Format|Font|FontSize
        TextColor|BGColor
        Link|Image">
                        </CKEditor:CKEditorControl>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">尺寸</label>
                    <div class="col-sm-10">
                        <CKEditor:CKEditorControl ID="DimCKEditorControl" runat="server" BasePath="/Scripts/ckeditor/"
                            Toolbar="Bold|Italic|Underline|Strike|Subscript|Superscript|-|RemoveFormat
        NumberedList|BulletedList|-|Outdent|Indent|-|JustifyLeft|JustifyCenter|JustifyRight|JustifyBlock|-|BidiLtr|BidiRtl
        /
        Styles|Format|Font|FontSize
        TextColor|BGColor
        Link|Image">
                        </CKEditor:CKEditorControl>
                    </div>
                </div>
                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                    <asp:Button ID="SaveModelButton" runat="server" Text="Save" CssClass="btn btn-success btn-round waves-effect waves-light px-5" OnClick="SaveModelButton_Click" />
                </div>
            </div>
        </asp:Panel>
        <asp:Panel ID="LayoutPanel" runat="server" Visible="False">
            <div class="card p-4">
                <div class="mb-5">
                    <h3>Layout</h3>
                    <div class="d-flex">
                        <asp:Literal ID="LayoutLiteral" runat="server" Visible="False"></asp:Literal>
                        <asp:Button ID="DelLayoutButton" runat="server" Text="刪除" Visible="False" CssClass="btn btn-danger align-self-end" OnClick="DelLayoutButton_Click" />
                    </div>
                    <div class="input-group mt-3">
                        <asp:FileUpload ID="LayoutFileUpload" runat="server" CssClass="form-control" />
                        <asp:Button ID="AddLayoutButton" runat="server" Text="Upload" CssClass="btn btn-outline-secondary" OnClick="AddLayoutButton_Click" />
                        <asp:Label ID="LayoutLabel" runat="server" Text="Label" Visible="False" ForeColor="#FF3300"></asp:Label>
                    </div>
                </div>
                <div>
                    <h3>Deck Plan</h3>
                    <div class="d-flex">
                        <asp:Literal ID="DeckPlanLiteral" runat="server"></asp:Literal>
                        <asp:Button ID="DelDeckButton" runat="server" Text="刪除" Visible="False" CssClass="btn btn-danger align-self-end" OnClick="DelDeckButton_Click" />
                    </div>

                    <div class="input-group mt-3">
                        <asp:FileUpload ID="DeckPlanFileUpload" runat="server" CssClass="form-control" />
                        <asp:Button ID="AddDeckPlanButton" runat="server" Text="Upload" CssClass="btn btn-outline-secondary" OnClick="AddDeckPlanButton_Click" />
                        <asp:Label ID="DeckPlanLabel" runat="server" Text="Label" ForeColor="Red" Visible="False"></asp:Label>
                    </div>
                </div>
            </div>
        </asp:Panel>
        <asp:Panel ID="SpecsPanel" runat="server" Visible="False">
            <div class="card p-4">
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Specification</label>
                    <div class="col-sm-10">
                        <CKEditor:CKEditorControl ID="SpecsCKEditorControl" runat="server" BasePath="/Scripts/ckeditor/"
                            Toolbar="Bold|Italic|Underline|Strike|Subscript|Superscript|-|RemoveFormat
        NumberedList|BulletedList|-|Outdent|Indent|-|JustifyLeft|JustifyCenter|JustifyRight|JustifyBlock|-|BidiLtr|BidiRtl
        /
        Styles|Format|Font|FontSize
        TextColor|BGColor
        Link|Image">
                        </CKEditor:CKEditorControl>
                    </div>
                </div>
                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                    <asp:Button ID="SaveSpecsButton" runat="server" Text="Save" OnClick="SaveSpecsButton_Click" CssClass="btn btn-success btn-round waves-effect waves-light px-5" />
                </div>
            </div>
        </asp:Panel>
        <asp:Panel ID="VideoPanel" runat="server" Visible="False">
            <div class="card p-4">
                <div class="input-group mb-4">
                    <asp:TextBox ID="VideoTextBox" runat="server" CssClass="form-control" placeholder="輸入 youtube 連結"></asp:TextBox>
                    <asp:Button ID="AddVideoButton" runat="server" Text="新增影片" CssClass="btn btn-outline-secondary" OnClick="AddVideoButton_Click" />
                </div>
                <asp:Label ID="UrlMessageLabel" runat="server" Text="Label" Visible="False" ForeColor="Red"></asp:Label>
                <div>
                    <asp:Button ID="DelVideoButton" runat="server" Text="刪除" Visible="False" CssClass="btn btn-danger my-5" OnClick="DelVideoButton_Click" />
                </div>
                <asp:Literal ID="VideoLiteral" runat="server" Visible="False"></asp:Literal>
            </div>
        </asp:Panel>
        <asp:Panel ID="PdfPanel" runat="server" Visible="False">
            <div class="d-flex p-4 border border-2">
                <asp:Literal ID="PdfLiteral" runat="server" Visible="False"></asp:Literal>
                <asp:Button ID="DelPdfButton" runat="server" Text="刪除" Visible="False" CssClass="btn btn-danger align-self-end btn-sm" OnClick="DelPdfButton_Click" />
            </div>
            <div class="input-group mt-3">
                <asp:FileUpload ID="PdfFileUpload" runat="server" CssClass="form-control" />
                <asp:Button ID="UploadPdfButton" runat="server" Text="Upload" CssClass="btn btn-outline-secondary" OnClick="UploadPdfButton_Click" />
                <asp:Label ID="PdfErrorMsgLabel" runat="server" Text="Label" Visible="False" ForeColor="#FF3300"></asp:Label>
            </div>
        </asp:Panel>
    </div>
</asp:Content>
