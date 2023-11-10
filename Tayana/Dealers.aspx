<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Dealers.aspx.cs" Inherits="Tayana.Dealers" %>

<%@ Register Src="~/WebUserControl_Page.ascx" TagPrefix="uc1" TagName="WebUserControl_Page" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<div class="bannermasks">
        <img src="assets/home/images/DEALERS.jpg" alt="&quot;&quot;" width="967" height="371" />
    </div>--%>
    <div class="banner">
        <ul>
            <li>
                <img src="assets/home/images/DEALERS.jpg" alt="Tayana Yachts" />
            </li>
        </ul>
    </div>
    <!--------------------------------換圖結束---------------------------------------------------->
    <div class="conbg">
        <!--------------------------------左邊選單開始---------------------------------------------------->
        <div class="left">
            <div class="left1">
                <p><span>DEALERS</span></p>
                <ul>
                    <asp:Repeater ID="CountriesRepeater" runat="server">
                        <ItemTemplate>
                            <li>
                                <asp:HyperLink ID="CountryHyperLink" runat="server" Text='<%# Bind("country") %>' NavigateUrl='<%# "~/Dealers.aspx?id="+Eval("id") %>'></asp:HyperLink>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </div>
        </div>
        <!--------------------------------左邊選單結束---------------------------------------------------->

        <!--------------------------------右邊選單開始---------------------------------------------------->
        <div id="crumb">
            <asp:HyperLink ID="HomHyperLink" runat="server" NavigateUrl="~/Index.aspx">Home</asp:HyperLink>
            >>
            <asp:HyperLink ID="DealersHyperLink" runat="server" NavigateUrl="~/Dealers.aspx">Dealers</asp:HyperLink>
            >>
            <asp:Literal ID="CountryLiteral" runat="server"></asp:Literal>
        </div>
        <!--------------------------------右邊選單開始---------------------------------------------------->
        <div class="right">
            <div class="right1">
                <div class="title">
                    <span>
                        <asp:Literal ID="CountryTilteLiteral" runat="server"></asp:Literal></span>
                </div>
                <!--------------------------------內容開始---------------------------------------------------->
                <div class="box2_list">
                    <ul>
                        <asp:Literal ID="DealerListLiteral" runat="server"></asp:Literal>
                    </ul>
                    <div class="pagenumber">
                        <uc1:WebUserControl_Page runat="server" ID="WebUserControl_Page" />
                    </div>
                </div>
                <!--------------------------------內容結束------------------------------------------------------>
            </div>
        </div>
        <!--------------------------------右邊選單結束---------------------------------------------------->
    </div>
</asp:Content>
