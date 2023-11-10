<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="News_View.aspx.cs" Inherits="Tayana.News_View" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--------------------------------換圖開始---------------------------------------------------->

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
             <span class="on1">
                 <asp:HyperLink ID="NewsViewHyperLink" runat="server">News & Events</asp:HyperLink>

             </span>
        </div>
        <div class="right">
            <div class="right1">
                <div class="title"><span>News & Events</span></div>

                <!--------------------------------內容開始---------------------------------------------------->
                <div>
                    <h4>
                        <asp:Literal ID="TitleLiteral" runat="server"></asp:Literal>

                    </h4>
                    <asp:Literal ID="NewContentLiteral" runat="server"></asp:Literal>
                </div>

                <div class="buttom001">
                    <asp:HyperLink ID="HyperLink1" runat="server" ImageUrl="assets/home/images/back.gif" Height="28" Width="55" NavigateUrl="~/News_List.aspx">HyperLink</asp:HyperLink>
                </div>

                <!--------------------------------內容結束------------------------------------------------------>
            </div>
        </div>

        <!--------------------------------右邊選單結束---------------------------------------------------->
    </div>

</asp:Content>
