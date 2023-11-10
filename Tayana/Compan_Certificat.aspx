<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Compan_Certificat.aspx.cs" Inherits="Tayana.Compan_Certificat" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <%--  <div class="bannermasks">
        <img src="assets/home/images/company.jpg" alt="&quot;&quot;" width="967" height="371" />
    </div>--%>
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
                <p><span>COMPANY </span></p>
                <ul>
                    <li>
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Compan_About.aspx">About Us</asp:HyperLink>
                    </li>
                    <li>
                        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Compan_Certificat.aspx">Certificat</asp:HyperLink>
                    </li>
                </ul>
            </div>
        </div>

        <!--------------------------------左邊選單結束---------------------------------------------------->

        <!--------------------------------右邊選單開始---------------------------------------------------->
        <div id="crumb">
            <asp:HyperLink ID="HomeHyperLink" runat="server" NavigateUrl="~/Index.aspx">Home</asp:HyperLink> >> 
            <asp:HyperLink ID="CompanyHyperLink" runat="server" NavigateUrl="~/Compan_About.aspx">Company</asp:HyperLink> >> 
            <asp:HyperLink ID="AboutUsHyperLink" runat="server"><span class="on1">Certificat</span></asp:HyperLink>
        </div>
        <div class="right">
            <div class="right1">
                <div class="title"><span>Certificat</span></div>

                <!--------------------------------內容開始---------------------------------------------------->
                <div class="box3">
                    <asp:Label ID="CertificatLabel" runat="server"></asp:Label>
                </div>
                <!--------------------------------內容結束------------------------------------------------------>
            </div>
        </div>
        <!--------------------------------右邊選單結束---------------------------------------------------->
    </div>
</asp:Content>
