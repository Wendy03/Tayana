<%@ Page Title="" Language="C#" MasterPageFile="~/Yachts.Master" AutoEventWireup="true" CodeBehind="Yachts_Layout.aspx.cs" Inherits="Tayana.Yachts_Layout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="YachtsContentPlaceHolder" runat="server">
    <div class="box6">
        <p>Layout & deck plan</p>
        <ul>
            <asp:Literal ID="LayoutLiteral" runat="server"></asp:Literal>
           <%-- <li>
                <img src="images/deckplan01.jpg" alt="&quot;&quot;" /></li>
            <li>
                <img src="images/deckplan01.jpg" alt="&quot;&quot;" /></li>--%>
        </ul>
    </div>
</asp:Content>
