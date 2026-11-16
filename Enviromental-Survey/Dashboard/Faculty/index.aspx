<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Enviromental_Survey.Dashboard.Faculty.index" %>

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
            <div class="container-fluid">

                <h1 class="h3 mb-4 text-success">Faculty Dashboard</h1>

                <!-- Top Stats Row --><div class="row mb-4">
    <div class="col-md-3">
        <div class="card bg-primary text-white shadow">
            <div class="card-body d-flex justify-content-between align-items-center">
                <span>Pending Surveys: <strong><asp:Label ID="lblPendingSurveys" runat="server" Text="0"></asp:Label></strong></span>
                <i class="fas fa-poll fa-2x"></i>
            </div>
        </div>
    </div>

    <div class="col-md-3">
        <div class="card bg-success text-white shadow">
            <div class="card-body d-flex justify-content-between align-items-center">
                <span>Total Competitions: <strong><asp:Label ID="lblTotalCompetitions" runat="server" Text="0"></asp:Label></strong></span>
                <i class="fas fa-trophy fa-2x"></i>
            </div>
        </div>
    </div>

    <div class="col-md-3">
        <div class="card bg-info text-white shadow">
            <div class="card-body d-flex justify-content-between align-items-center">
                <span>Participated Competitions: <strong><asp:Label ID="lblParticipatedCompetitions" runat="server" Text="0"></asp:Label></strong></span>
                <i class="fas fa-trophy fa-2x"></i>
            </div>
        </div>
    </div>

    <div class="col-md-3">
        <div class="card bg-warning text-white shadow">
            <div class="card-body d-flex justify-content-between align-items-center">
                <span>Seminars Submitted: <strong><asp:Label ID="lblSeminarsSubmitted" runat="server" Text="0"></asp:Label></strong></span>
                <i class="fas fa-chalkboard-teacher fa-2x"></i>
            </div>
        </div>
    </div>
</div>

                <!-- Middle Section -->
                <div class="row">
                    
                    <!-- Upcoming Competitions -->
                    <div class="col-lg-8 mb-4">
                        <div class="card shadow h-100">
                            <div class="card-header bg-success text-white">Upcoming Competitions</div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <asp:GridView ID="gvUpcoming" runat="server" CssClass="table table-bordered"
                                        AutoGenerateColumns="False" ShowHeaderWhenEmpty="true" EmptyDataText="No upcoming competitions.">
                                        <Columns>
                                            <asp:BoundField DataField="Title" HeaderText="Title" />
                                            <asp:BoundField DataField="Description" HeaderText="Description" />
                                            <asp:BoundField DataField="CompetitionDate" HeaderText="Date" DataFormatString="{0:yyyy-MM-dd}" />
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Quick Links -->
                    <div class="col-lg-4 mb-4">
                        <div class="card shadow h-100">
                            <div class="card-header bg-success text-white">Quick Links</div>
                            <div class="card-body">
                                <div class="row text-center">
                                    <div class="col-6 mb-3">
                                        <a href="surveys.aspx" class="text-success">
                                            <i class="fas fa-poll fa-2x mb-1"></i>
                                            <div>Surveys</div>
                                        </a>
                                    </div>
                                    <div class="col-6 mb-3">
                                        <a href="competitions.aspx" class="text-info">
                                            <i class="fas fa-trophy fa-2x mb-1"></i>
                                            <div>Competitions</div>
                                        </a>
                                    </div>
                                    <div class="col-6 mb-3">
                                        <a href="effective-participation.aspx" class="text-warning">
                                            <i class="fas fa-chalkboard-teacher fa-2x mb-1"></i>
                                            <div>Seminar</div>
                                        </a>
                                    </div>
                                    <div class="col-6 mb-3">
                                        <a href="profile.aspx" class="text-primary">
                                            <i class="fas fa-user fa-2x mb-1"></i>
                                            <div>Profile</div>
                                        </a>
                                    </div>
                                    <div class="col-12">
                                        <a href="support.aspx" class="text-dark">
                                            <i class="fas fa-headset fa-2x mb-1"></i>
                                            <div>Support</div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div> <!-- End Row -->

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- End Content -->

    </div>
    <!-- End Content Wrapper -->

</asp:Content>
