<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="submit-response.aspx.cs" Inherits="Enviromental_Survey.Dashboard.Faculty.submit_response" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Page Wrapper -->

    <div id="wrapper">


        <!-- Sidebar (same as index.html) -->


        <ul class="navbar-nav bg-gradient-success sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.aspx">
                <div class="sidebar-brand-icon">
                    <i class="fas fa-leaf"></i>
                </div>
                <div class="sidebar-brand-text mx-3">Enviromental Survey </div>
            </a>

            <hr class="sidebar-divider my-0">

            <li class="nav-item">
                <a class="nav-link" href="index.aspx">
                    <i class="fas fa-user-tie"></i>
                    <span>Faculty</span>
                </a>
            </li>

            <hr class="sidebar-divider">

            <div class="sidebar-heading">Faculty Tools</div>

            <li class="nav-item">
                <a class="nav-link" href="surveys.aspx">
                    <i class="fas fa-poll"></i>
                    <span>Surveys</span>
                </a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="competitions.aspx">
                    <i class="fas fa-trophy"></i>
                    <span>Competitions</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="effective-participation.aspx">
                    <i class="fas fa-chalkboard-teacher"></i>
                    <span>Participation</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="profile.aspx">
                    <i class="fas fa-user"></i>
                    <span>Profile</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="support.aspx">
                    <i class="fas fa-headset"></i>
                    <span>Support</span>
                </a>
            </li>

            <hr class="sidebar-divider d-none d-md-block">
            <li class="nav-item">
                <a class="nav-link" href="logout.aspx">
                    <i class="fas fa-sign-out-alt"></i>
                    <span>Logout</span>
                </a>
            </li>

        </ul>
        <!-- End Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-success topbar mb-4 static-top shadow">
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">
                                    <asp:Label ID="lblUserName" runat="server" Text=""></asp:Label>
                                </span>
                                <i class="fas fa-user-circle fa-lg"></i>

                            </a>
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="profile.aspx">
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>Edit Profile
                                </a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="logout.aspx">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>Logout
                                </a>
                            </div>
                        </li>
                    </ul>
                </nav>
                <!-- End Topbar -->
                <!-- Begin Page Content -->
<div class="container-fluid" style="max-width: 1200px;">
    <h1 class="h2 mb-4 text-success">Submit Your Response</h1>

    <div class="card shadow mb-4" style="border-radius: 10px;">
        <div class="card-body">
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Style="font-weight: bold;"></asp:Label>

            <asp:Panel ID="pnlSurvey" runat="server" Visible="false" Style="padding: 15px; background-color: #f9fff9; border-radius: 8px; border: 1px solid #28a745;">

                <h5 class="text-success" style="margin-bottom: 10px;">Title:</h5>
                <p style="font-size: 16px; font-weight: bold; color: #333;">
                    <asp:Label ID="lblSurveyTitle" runat="server"></asp:Label></p>

                <h5 class="text-success" style="margin-top: 20px;">Questions:</h5>
                <asp:Repeater ID="rptQuestions" runat="server">
                    <ItemTemplate>
                        <div class="mb-3" style="padding: 10px; border-bottom: 1px dashed #ccc;">
                            <asp:Label ID="lblQuestion" runat="server" Text='<%# Eval("QuestionText") %>' Style="font-weight: bold; color: #333;"></asp:Label>
                            <asp:HiddenField ID="hfQuestionID" runat="server" Value='<%# Eval("QuestionID") %>' />
                            <asp:RadioButtonList ID="rblOptions" runat="server" RepeatDirection="Vertical" DataTextField="OptionText" DataValueField="OptionID"
                                Style="margin-top: 5px; padding-left: 10px;">
                            </asp:RadioButtonList>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>

                <asp:HiddenField ID="hfSurveyID" runat="server" />
                <asp:Button ID="btnSubmitResponse" runat="server" Text="Submit Response" CssClass="btn btn-success"
                    OnClick="btnSubmitResponse_Click" Style="margin-top: 15px; width: 100%;" />
            </asp:Panel>
        </div>
    </div>
</div>

</asp:Content>
