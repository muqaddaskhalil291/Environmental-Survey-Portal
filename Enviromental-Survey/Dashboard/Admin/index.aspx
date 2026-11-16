<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Enviromental_Survey.Dashboard.Admin.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="page-top">

        <!-- Page Wrapper -->
        <div id="wrapper">

            <!-- Sidebar -->
            <ul class="navbar-nav bg-gradient-success sidebar sidebar-dark accordion" id="accordionSidebar">
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.aspx">
                    <div class="sidebar-brand-icon rotate-n-15"><i class="fas fa-leaf"></i></div>
                    <div class="sidebar-brand-text mx-3">Enviromental Survey</div>
                </a>

                <hr class="sidebar-divider my-0">
                <li class="nav-item active"><a class="nav-link" href="index.aspx"><i
                    class="fas fa-fw fa-tachometer-alt"></i><span>Admin</span></a></li>
                <hr class="sidebar-divider">
                <div class="sidebar-heading">Management</div>
                <li class="nav-item"><a class="nav-link" href="registrations.aspx"><i class="fas fa-user-check"></i><span>Manage
         Registrations</span></a></li>
                <li class="nav-item"><a class="nav-link" href="users.aspx"><i class="fas fa-users"></i><span>Manage
         Users</span></a></li>
                <li class="nav-item"><a class="nav-link" href="surveys.aspx"><i class="fas fa-poll"></i><span>Manage
         Surveys</span></a></li>
                <li class="nav-item"><a class="nav-link" href="competitions.aspx"><i class="fas fa-trophy"></i><span>Manage
         Competitions</span></a></li>
                <li class="nav-item"><a class="nav-link" href="faqs.aspx"><i class="fas fa-question-circle"></i><span>Manage
         FAQs</span></a></li>
                <li class="nav-item"><a class="nav-link" href="support.aspx"><i class="fas fa-headset"></i><span>Support
         Info</span></a></li>
                <li class="nav-item"><a class="nav-link" href="reports.aspx"><i
                    class="fas fa-chart-bar"></i><span>Reports</span></a></li>
                <hr class="sidebar-divider">
                <li class="nav-item"><a class="nav-link" href="logout.aspx"><i
                    class="fas fa-sign-out-alt"></i><span>Logout</span></a></li>
            </ul>
            <!-- End Sidebar -->
            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">
                <div id="content">

                    <!-- Topbar -->
                    <nav class="navbar navbar-expand navbar-light bg-success shadow mb-4 topbar static-top">

                        <ul class="navbar-nav ml-auto">
                            <div class="topbar-divider d-none d-sm-block"></div>
                            <li class="nav-item dropdown no-arrow">
                                <a class="nav-link dropdown-toggle text-white" href="#" id="userDropdown" role="button"
                                    data-toggle="dropdown">

                                    <span class="mr-2 d-none d-lg-inline small">Admin</span>
                                    <img class="img-profile rounded-circle" src="../Assets/img/undraw_profile.svg" alt="Admin Profile" />

                                </a>
                                <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in">
                                    <a class="dropdown-item" href="admin-profile.aspx"><i
                                        class="fas fa-user-edit fa-sm fa-fw mr-2 text-gray-400"></i>Admin Profile</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="logout.aspx"><i
                                        class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>Logout</a>
                                </div>
                            </li>
                        </ul>

                    </nav>
                    <!-- End of Topbar -->

                    <!-- Main Content -->
                    <div class="container-fluid">

                        <!-- Dashboard Heading -->
                        <div class="d-sm-flex align-items-center justify-content-between mb-4">
                            <h1 class="h3 text-success">Dashboard</h1>
                            <a href="reports.aspx" class="d-none d-sm-inline-block btn btn-sm btn-success shadow-sm">
                                <i class="fas fa-download fa-sm text-white-50"></i>Generate Report
                            </a>
                        </div>

                        <!-- Stats Cards Row -->
                        <div class="row">
                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card border-left-success shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-success text-uppercase mb-1">Total Users</div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800">
                                                    <asp:Label ID="lblTotalUsers" runat="server" Text="0"></asp:Label>
                                                </div>

                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-users fa-2x text-success"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card border-left-info shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Total Surveys</div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800">
                                                    <asp:Label ID="lblTotalSurveys" runat="server" Text="0"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-poll fa-2x text-info"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card border-left-warning shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">Active Competitions</div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800">
                                                    <asp:Label ID="lblTotalCompetitions" runat="server" Text="0"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-trophy fa-2x text-warning"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card border-left-primary shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">FAQs</div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800">
                                                    <asp:Label ID="lblTotalFaqs" runat="server" Text="0"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-question-circle fa-2x text-primary"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- End Stats Cards -->

                        <h4>Recent Registrations</h4>
                        <asp:GridView ID="gvRecentRegistrations" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered">
                            <Columns>
                                <asp:BoundField DataField="Name" HeaderText="Name" />
                                <asp:BoundField DataField="Role" HeaderText="Role" />
                                <asp:BoundField DataField="RollOrEmp" HeaderText="Roll/Emp No" />
                                <asp:BoundField DataField="ClassOrDept" HeaderText="Class/Dept" />
                                <asp:BoundField DataField="SectionOrQual" HeaderText="Section/Qual." />
                                <asp:BoundField DataField="Date" HeaderText="Date" DataFormatString="{0:yyyy-MM-dd}" />
                                <asp:TemplateField HeaderText="Status">
                                    <ItemTemplate>
                                        <%# Eval("Status").ToString() == "Approved" ? 
                        "<span class='badge badge-success'>Approved</span>" : 
                        Eval("Status").ToString() == "Pending" ? 
                        "<span class='badge badge-warning'>Pending</span>" : 
                        "<span class='badge badge-danger'>Rejected</span>" %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>


                        <!-- Quick Links (Grid Icons) -->
                        

                    </div>
                    <!-- /.container-fluid -->

                    <!-- Footer -->
                    <footer class="sticky-footer bg-white">
                        <div class="container my-auto">
                        <div class="container my-auto">
                            <div class="copyright text-center my-auto">
                                <span>Copyright &copy; eProject 2025</span>
                            </div>
                        </div>
                    </footer>

                </div>
                <!-- End of Content -->

            </div>
            <!-- End of Content Wrapper -->

        </div>
    </div>
    <!-- End of Page Wrapper -->

    </div>


</asp:Content>
