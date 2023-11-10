<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="News_List.aspx.cs" Inherits="Tayana.News_List" %>

<%@ Register Src="~/WebUserControl_Page.ascx" TagPrefix="wuc" TagName="WebUserControl_Page" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="banner">
        <ul>
            <li>
                <img src="assets/home/images/newbanner.jpg" alt="Tayana Yachts" /></li>
        </ul>
    </div>
    <!--------------------------------換圖結束---------------------------------------------------->
    <div class="conbg">
        <!--------------------------------左邊選單開始---------------------------------------------------->
        <div class="left">
            <div class="left1">
                <p><span>NEWS</span></p>
                <ul>
                    <li><a href="#">News & Events</a></li>
                </ul>
            </div>
        </div>
        <!--------------------------------左邊選單結束---------------------------------------------------->

        <!--------------------------------右邊選單開始---------------------------------------------------->
        <div id="crumb">
            <asp:HyperLink ID="HomeHyperLink" runat="server" NavigateUrl="~/Index.aspx">Home</asp:HyperLink>
            >>
            <asp:HyperLink ID="NewsHyperLink" runat="server" NavigateUrl="~/News_List.aspx">News</asp:HyperLink>
            >>
            <asp:HyperLink ID="NewsViewHyperLink" runat="server">News & Events</asp:HyperLink>
        </div>
        <div class="right">
            <div class="right1">
                <div class="title"><span>News & Events</span></div>

                <!--------------------------------內容開始---------------------------------------------------->

                <div class="box2_list">
                    <ul>
                        <asp:Literal ID="NewsLiteral" runat="server"></asp:Literal>
                    </ul>
                    <div class="pagenumber">
                        <wuc:WebUserControl_Page runat="server" id="WebUserControl_Page" />

                    </div>
                </div>
                <!--------------------------------內容結束------------------------------------------------------>
            </div>
        </div>

        <!--------------------------------右邊選單結束---------------------------------------------------->
    </div>
</asp:Content>
