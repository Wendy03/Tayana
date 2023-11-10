﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_SignIn.aspx.cs" Inherits="Tayana.Admin_SignIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="description" content="Mega Able Bootstrap admin template made using Bootstrap 4 and it has huge amount of ready made feature, UI components, pages which completely fulfills any dashboard needs." />
    <meta name="keywords" content="bootstrap, bootstrap admin template, admin theme, admin dashboard, dashboard template, admin template, responsive" />
    <meta name="author" content="codedthemes" />
    <!-- Favicon icon -->

    <link rel="icon" href="assets/admin/images/favicon.ico" type="image/x-icon" />
    <!-- Google font-->
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,500" rel="stylesheet" />
    <!-- Required Fremwork -->
    <link rel="stylesheet" type="text/css" href="../assets/admin/css/bootstrap/css/bootstrap.min.css" />
    <!-- waves.css -->
    <link rel="stylesheet" href="../assets/admin/pages/waves/css/waves.min.css" type="text/css" media="all" />
    <!-- themify-icons line icon -->
    <link rel="stylesheet" type="text/css" href="../assets/admin/icon/themify-icons/themify-icons.css" />
    <!-- ico font -->
    <link rel="stylesheet" type="text/css" href="../assets/admin/icon/icofont/css/icofont.css" />
    <!-- Font Awesome -->
    <link rel="stylesheet" type="text/css" href="../assets/admin/icon/font-awesome/css/font-awesome.min.css" />
    <!-- Style.css -->
    <link rel="stylesheet" type="text/css" href="../assets/admin/css/style.css" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-block">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <!-- Authentication card start -->
                        <div class="md-float-material form-material">
                            <div class="text-center">
                                <img src="../assets/home/images/logo.png" alt="logo.png" height="150" width="150" />
                            </div>
                            <div class="auth-box card">
                                <div class="card-block">
                                    <div class="row m-b-20">
                                        <div class="col-md-12">
                                            <h3 class="text-center">Sign In</h3>
                                        </div>
                                    </div>
                                    <div class="form-group form-primary">
                                        <asp:TextBox ID="EmailTextBox" runat="server" CssClass="form-control"></asp:TextBox>
                                        <span class="form-bar"></span>
                                        <asp:Label ID="EmailLabel" runat="server" Text="Your Email Address" CssClass="float-label"></asp:Label>
                                    </div>
                                    <div class="form-group form-primary">
                                        <asp:TextBox ID="PasswordTextBox" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                                        <span class="form-bar"></span>
                                        <asp:Label ID="PasswordLabel" runat="server" Text="Password" CssClass="float-label"></asp:Label>
                                    </div>
                                    <asp:Label ID="LoginErrorMsg" runat="server" Text="Label" Visible="False" ForeColor="Red"></asp:Label>
                                    <div class="row m-t-30">
                                        <div class="col-md-12">
                                            <asp:Button ID="SignInButton" runat="server" Text="Sign in" CssClass="btn btn-primary btn-md btn-block waves-effect waves-light text-center m-b-20" OnClick="SignInButton_Click"/>
                                            <asp:Label ID="MessageLabel" runat="server" ForeColor="Red" Visible="False"></asp:Label>
                                        </div>
                                    </div>
                                    <hr />
                                    <div class="row">
                                        <div class="col-md-10">
                                            <p class="text-inverse text-left m-b-0">Thank you.</p>
                                            <p class="text-inverse text-left">
                                                <asp:HyperLink ID="HomeHyperLink" runat="server" NavigateUrl="~/Index.aspx"><b>Back to website</b></asp:HyperLink>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- end of form -->
                    </div>
                    <!-- end of col-sm-12 -->
                </div>
                <!-- end of row -->
            </div>
        </div>
    </form>
    <script type="text/javascript" src="../assets/admin/js/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="../assets/admin/js/jquery-ui/jquery-ui.min.js "></script>
    <script type="text/javascript" src="../assets/admin/js/popper.js/popper.min.js"></script>
    <script type="text/javascript" src="../assets/admin/js/bootstrap/js/bootstrap.min.js "></script>
    <!-- waves js -->
    <script src="../assets/admin/pages/waves/js/waves.min.js"></script>
    <!-- jquery slimscroll js -->
    <script type="text/javascript" src="../assets/admin/js/jquery-slimscroll/jquery.slimscroll.js "></script>
    <!-- modernizr js -->
    <script type="text/javascript" src="../assets/admin/js/SmoothScroll.js"></script>
    <script src="assets/admin/js/jquery.mCustomScrollbar.concat.min.js "></script>
    <!-- i18next.min.js -->
    <script type="text/javascript" src="bower_components/i18next/js/i18next.min.js"></script>
    <script type="text/javascript" src="bower_components/i18next-xhr-backend/js/i18nextXHRBackend.min.js"></script>
    <script type="text/javascript" src="bower_components/i18next-browser-languagedetector/js/i18nextBrowserLanguageDetector.min.js"></script>
    <script type="text/javascript" src="bower_components/jquery-i18next/js/jquery-i18next.min.js"></script>
    <script type="text/javascript" src="../assets/admin/js/common-pages.js"></script>
</body>
</html>
