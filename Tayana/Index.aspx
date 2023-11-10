<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Tayana.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--遮罩-->
    <div class="bannermasks">
        <img src="assets/home/images/banner03_masks.png" alt="&quot;&quot;"/>
    </div>
    <!--遮罩結束-->
    <!--------------------------------換圖開始---------------------------------------------------->
    <div id="abgne-block-20110111">
        <div class="bd">
            <div class="banner" style="width: 978px; height: 424px;border-radius: 5px;">
                <ul>
                    <asp:Literal ID="BannerImagesLiteral" runat="server"></asp:Literal>
                </ul>
                <!--小圖開始-->
                <div class="bannerimg title" style="display: none">
                    <ul>
                        <asp:Literal ID="SmallImagesLiteral" runat="server"></asp:Literal>
                    </ul>
                </div>
                <!--小圖結束-->
            </div>
        </div>
    </div>
    <!--------------------------------換圖結束---------------------------------------------------->


    <!--------------------------------最新消息---------------------------------------------------->
    <div class="news">
        <div class="newstitle">
            <p class="newstitlep1">
                <img src="assets/home/images/news.gif" alt="news" />
            </p>
            <p class="newstitlep2">
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/News_List.aspx">More>></asp:HyperLink>
            </p>
        </div>

        <ul>
            <asp:Literal ID="NewsListLiteral" runat="server"></asp:Literal>
        </ul>
    </div>
    <!--------------------------------最新消息結束---------------------------------------------------->
</asp:Content>
