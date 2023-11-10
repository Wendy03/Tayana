<%@ Page Title="" Language="C#" MasterPageFile="~/Yachts.Master" AutoEventWireup="true" CodeBehind="Yachts_OverView.aspx.cs" Inherits="Tayana.Yachts_OverView1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="YachtsContentPlaceHolder" runat="server">
    <div class="box1 mb-5">
        <asp:Literal ID="OverViewLiteral" runat="server"></asp:Literal>
    </div>

    <div class="box3">
        <h4>PRINCIPAL DIMENSION</h4>
        <asp:Literal ID="DimLiteral" runat="server"></asp:Literal>
        <%--<table class="table02">
            <tr>
                <td class="table02td01">
                    <table>
                        <tr>
                            <th>L.O.A.</th>
                            <td>72’-0”</td>
                        </tr>
                        <tr class="tr003">
                            <th>L.W.L.</th>
                            <td>60’-10”</td>
                        </tr>
                        <tr>
                            <th>Beam</th>
                            <td>20’-0”</td>
                        </tr>
                        <tr class="tr003">
                            <th>Draft (Fin Keel)</th>
                            <td>8’-6”</td>
                        </tr>
                        <tr>
                            <th>Displacement</th>
                            <td>96100lbs</td>
                        </tr>
                        <tr class="tr003">
                            <th>Ballast (Fin Keel)</th>
                            <td>24850lbs</td>
                        </tr>
                        <tr>
                            <th>Sail Area (Main + 150% Triangle)<br />
                                Main (9.0 oz)<br />
                                Stays (9.0 oz)<br />
                                No. 1 Genoa (7.2 oz)<br />
                                Genoa (150%) (7.2 oz)<br />
                                I :<br />
                                J :<br />
                                P :<br />
                                E :</th>
                            <td>2748 sq.
                                <br />
                                ft996 sq. ft<br />
                                386 sq. ft<br />
                                1167 sq. ft<br />
                                1782 sq. ft<br />
                                87’-0”<br />
                                27’-1.75”<br />
                                75’-4”<br />
                                26’-0”<br />
                            </td>
                        </tr>
                        <tr class="tr003">
                            <th>D/L=191.47Ballast/Displacement</th>
                            <td>28.10%</td>
                        </tr>
                        <tr>
                            <th>Exterior Style, Interior Designer</th>
                            <td>Andrew Winch</td>
                        </tr>
                        <tr class="tr003">
                            <th>Naval Architect Designer</th>
                            <td>Bill Dixon</td>
                        </tr>
                    </table>
                </td>
                <td>
                    <img src="assets/home/images/ya01.jpg" alt="&quot;&quot;" width="278" height="345" /></td>
            </tr>
        </table>--%>


    </div>
    <p class="topbuttom">
        <img src="assets/home/images/top.gif" alt="top" /></p>

    <!--下載開始-->
    <div class="downloads">
        <p>
            <img src="assets/home/images/downloads.gif" alt="&quot;&quot;" />
        </p>
        <ul>
            
            <asp:Literal ID="DownloadLiteral" runat="server"></asp:Literal>
        </ul>
    </div>
</asp:Content>
