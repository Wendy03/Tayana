<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Tayana.Contact" %>

<%@ Register Assembly="Recaptcha.Web" Namespace="Recaptcha.Web.UI.Controls" TagPrefix="cc1" %>

<%@ Register Src="~/ToastUserControl.ascx" TagPrefix="uc1" TagName="ToastUserControl" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:ToastUserControl runat="server" ID="ToastUserControl" />
    <div class="banner">
        <ul>
            <li>
                <img src="assets/home/images/newbanner.jpg" alt="Tayana Yachts" /></li>
        </ul>
    </div>
    <div class="conbg">
        <!--------------------------------左邊選單開始---------------------------------------------------->
        <div class="left">

            <div class="left1">
                <p><span>CONTACT</span></p>
                <ul>
                    <li><a href="#">contacts</a></li>
                </ul>
            </div>
        </div>
        <!--------------------------------左邊選單結束---------------------------------------------------->

        <!--------------------------------右邊選單開始---------------------------------------------------->
        <div id="crumb">
            <asp:HyperLink ID="HomeHyperLink" runat="server" NavigateUrl="~/Index.aspx">Home</asp:HyperLink> >>
            <asp:HyperLink ID="ContactHyperLink" runat="server" NavigateUrl="~/Contact.aspx"><span class="on1">Contact</span></asp:HyperLink>
        </div>
        <div class="right">
            <div class="right1">
                <div class="title"><span>Contact</span></div>
                <!--------------------------------內容開始---------------------------------------------------->
                <!--表單-->
                <div class="from01">
                    <p>
                        Please Enter your contact information<span class="span01">*Required</span>
                    </p>
                    <br />
                    <table>
                        <tr>
                            <td class="from01td01">Name :</td>
                            <td><span>*</span>
                                <asp:TextBox runat="server" name="Name" type="text" ID="Name" class="{validate:{required:true, messages:{required:'Required'}}}" Style="width: 250px;" required="" aria-required="true" oninput="setCustomValidity('');" oninvalid="setCustomValidity('Required!')" MaxLength="50"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="from01td01">Email :</td>
                            <td><span>*</span><asp:TextBox runat="server" name="Email" type="text" ID="Email" class="{validate:{required:true, email:true, messages:{required:'Required', email:'Please check the E-mail format is correct'}}}" Style="width: 250px;" required="" aria-required="true" oninput="setCustomValidity('');" oninvalid="setCustomValidity('Required!')" MaxLength="50"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td class="from01td01">Phone :</td>
                            <td><span>*</span><asp:TextBox runat="server" name="Phone" type="text" ID="Phone" class="{validate:{required:true, messages:{required:'Required'}}}" Style="width: 250px;" required="" aria-required="true" oninput="setCustomValidity('');" oninvalid="setCustomValidity('Required!')" MaxLength="50"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td class="from01td01">Country :</td>
                            <td><span>*</span>
                                <asp:DropDownList name="country" ID="country" runat="server" DataSourceID="SqlDataSource1" DataTextField="country" DataValueField="country"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TayanaConnectionString %>" SelectCommand="SELECT [country] FROM [Countries]"></asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2"><span>*</span>Brochure of interest  *Which Brochure would you like to view?</td>
                        </tr>
                        <tr>
                            <td class="from01td01">&nbsp;</td>
                            <td>
                                <asp:DropDownList name="yacht" ID="yacht" runat="server" DataSourceID="SqlDataSource2" DataTextField="model" DataValueField="model" ></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:TayanaConnectionString %>" SelectCommand="SELECT [model] FROM [Yachts]"></asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td class="from01td01">Comments:</td>
                            <td>
                               <asp:TextBox runat="server" TextMode="MultiLine" name="Comments" Rows="2" cols="20" ID="Comments" Style="height: 150px; width: 330px;" MaxLength="500"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="from01td01"></td>
                            <td>
                                <cc1:RecaptchaApiScript ID="RecaptchaApiScript1" runat="server" />
                                <cc1:RecaptchaWidget ID="Recaptcha1" runat="server" />
                                <asp:Label ID="lblMessage" runat="server" Visible="False" ForeColor="Red"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="from01td01">&nbsp;</td>
                            <td class="f_right"><a href="#">
                                <asp:ImageButton ID="SubmitButton" runat="server" ImageUrl="assets/home/images/buttom03.gif" AlternateText="submit" Width="59" Height="25" OnClick="SubmitButton_Click" />
                            </td>
                        </tr>
                    </table>
                </div>
                <!--表單-->
                <div class="box1">
                    <span class="span02">Contact with us</span><br />
                    Thanks for your enjoying our web site as an introduction to the Tayana world and our range of yachts.
As all the designs in our range are semi-custom built, we are glad to offer a personal service to all our potential customers. 
If you have any questions about our yachts or would like to take your interest a stage further, please feel free to contact us.
                </div>
                <div class="list03">
                    <p>
                        <span>TAYANA HEAD OFFICE</span><br />
                        NO.60 Haichien Rd. Chungmen Village Linyuan Kaohsiung Hsien 832 Taiwan R.O.C<br />
                        tel. +886(7)641 2422<br />
                        fax. +886(7)642 3193<br />
                        info@tayanaworld.com<br />
                    </p>
                </div>
                <div class="list03">
                    <p>
                        <span>SALES DEPT.</span><br />
                        +886(7)641 2422  ATTEN. Mr.Basil Lin<br />
                        <br />
                    </p>
                </div>
                <div class="box4">
                    <h4>Location</h4>
                    <p>
                        <iframe width="695" height="518" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d14731.074581950823!2d120.30583410000004!3d22.625112997738263!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x346e0491b7febacd%3A0x24542bac2726199b!2z5a-25oiQ5LiW57SA5aSn5qiT!5e0!3m2!1szh-TW!2stw!4v1689303851700!5m2!1szh-TW!2stw"></iframe>
                    </p>
                </div>
                <!--------------------------------內容結束------------------------------------------------------>
            </div>
        </div>
        <!--------------------------------右邊選單結束---------------------------------------------------->
    </div>
</asp:Content>
