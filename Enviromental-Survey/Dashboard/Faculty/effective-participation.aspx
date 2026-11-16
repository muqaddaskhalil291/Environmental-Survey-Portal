<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="effective-participation.aspx.cs" Inherits="Enviromental_Survey.Dashboard.Faculty.effective_participation" %>

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

               <div class="container-fluid">
    <h1 class="h3 mb-4 text-success">Effective Participation</h1>

    <!-- Submission Form -->
  
    <div class="form-group">
        <label>Seminar / Workshop Title</label>
        <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control" placeholder="Enter title"></asp:TextBox>
    </div>
    <div class="form-group">
        <label>Location</label>
        <asp:TextBox ID="txtLocation" runat="server" CssClass="form-control" placeholder="Enter location"></asp:TextBox>
    </div>
    <div class="form-group">
        <label>Number of Participants</label>
        <asp:TextBox ID="txtParticipants" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
    </div>
    <div class="form-group">
        <label>Date Conducted</label>
        <asp:TextBox ID="txtDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
    </div>
    <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-success" OnClick="btnSubmit_Click" />

    <!-- Previous Submissions Table --><!-- Message Label -->
<asp:Label ID="lblMessage" runat="server" Visible="false" CssClass="alert"></asp:Label>

<!-- Submissions Table -->
<div class="table-responsive">
    <table class="table table-bordered table-striped">
        <thead>
            <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Location</th>
                <th>Participants</th>
                <th>Date Conducted</th>
            </tr>
        </thead>
        <tbody>
            <asp:Repeater ID="rptSubmissions" runat="server">
                <ItemTemplate>
                    <tr>
                        <td><%# Container.ItemIndex + 1 %></td>
                        <td><%# Eval("SeminarTitle") %></td>
                        <td><%# Eval("Location") %></td>
                        <td><%# Eval("ParticipantsCount") %></td>
                        <td><%# Eval("ConductedDate", "{0:yyyy-MM-dd}") %></td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </tbody>
    </table>
</div>


</asp:Content>
