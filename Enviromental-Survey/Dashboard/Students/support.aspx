<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="support.aspx.cs" Inherits="Enviromental_Survey.Dashboard.Students.support" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-success sidebar sidebar-dark accordion" id="accordionSidebar">
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.aspx">
                <div class="sidebar-brand-icon"><i class="fas fa-leaf"></i></div>
                <div class="sidebar-brand-text mx-3">Enviromental Survey</div>
            </a>
            <hr class="sidebar-divider my-0">
            <li class="nav-item"><a class="nav-link" href="index.aspx"><i class="fas fa-user-graduate"></i><span>Student</span></a></li>
            <hr class="sidebar-divider">
            <div class="sidebar-heading">Student Tools</div>
            <li class="nav-item"><a class="nav-link" href="surveys.aspx"><i class="fas fa-poll"></i>Surveys</a></li>
            <li class="nav-item active"><a class="nav-link" href="competitions.aspx"><i class="fas fa-trophy"></i>
                Competitions</a></li>
            <li class="nav-item"><a class="nav-link" href="effective-participation.aspx"><i
                class="fas fa-chalkboard-teacher"></i>Seminars/Workshops</a></li>
            <li class="nav-item"><a class="nav-link" href="profile.aspx"><i class="fas fa-user"></i>Profile</a></li>
            <li class="nav-item"><a class="nav-link" href="support.aspx"><i class="fas fa-headset"></i>Support</a></li>
            <hr class="sidebar-divider d-none d-md-block">
            <li class="nav-item"><a class="nav-link" href="logout.aspx"><i class="fas fa-sign-out-alt"></i>Logout</a>
            </li>
        </ul>

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-success topbar mb-4 shadow">
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i
                            class="fa fa-bars"></i>
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
                                <a class="dropdown-item" href="profile.aspx"><i
                                    class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>Edit Profile</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="logout.aspx"><i
                                    class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>Logout</a>
                            </div>
                        </li>
                    </ul>
                </nav>
                <!-- Page Content -->
                <div class="container-fluid">
                    <h1 class="h3 mb-4 text-success">Support & FAQs</h1>

                    <!-- Contact Info Table -->
<div class="card mb-4 shadow">
    <div class="card-header bg-primary text-white">Contact Information</div>
    <div class="card-body">
        <table class="table table-bordered table-striped">
            <thead class="bg-success text-white">
                <tr>
                    <th>Contact Person</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Description</th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="rptSupportInfo" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td><%# Eval("ContactPerson") %></td>
                            <td><%# Eval("Email") %></td>
                            <td><%# Eval("Phone") %></td>
                            <td><%# Eval("Description") %></td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>
    </div>
</div>
                    <!-- FAQs -->
                    <div class="card shadow mb-4">
                        <div class="card-header bg-success text-white">Frequently Asked Questions</div>
                        <div class="card-body">
                            <div class="accordion" id="faqAccordion">
                                <asp:Repeater ID="rptFAQs" runat="server">
                                    <ItemTemplate>
                                        <div class="card">
                                            <div class="card-header" id="heading<%# Eval("FAQID") %>">
                                                <h5 class="mb-0">
                                                    <button class="btn btn-link text-left" type="button" data-toggle="collapse"
                                                        data-target="#collapse<%# Eval("FAQID") %>" aria-expanded="false"
                                                        aria-controls="collapse<%# Eval("FAQID") %>">
                                                        <%# Eval("Question") %>
                                                    </button>
                                                </h5>
                                            </div>
                                            <div id="collapse<%# Eval("FAQID") %>" class="collapse" data-parent="#faqAccordion">
                                                <div class="card-body">
                                                    <%# Eval("Answer") %>
                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                    </div>
                </div>
</asp:Content>
