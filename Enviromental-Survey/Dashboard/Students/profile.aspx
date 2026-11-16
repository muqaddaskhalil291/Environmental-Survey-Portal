<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="Enviromental_Survey.Dashboard.Students.profile" %>

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
                    <h1 class="h3 mb-4 text-success">Update Profile</h1>

                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Student Details</h6>
                        </div>
                        <div class="card-body">
                            <asp:Panel ID="pnlProfile" runat="server">
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <asp:Label ID="lblName" runat="server" Text="Name"></asp:Label>
                                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
                                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
                                            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>

                                </div>

                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <asp:Label ID="lblRole" runat="server" Text="User Role"></asp:Label>
                                        <asp:TextBox ID="txtRole" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <asp:Label ID="lblRollNo" runat="server" Text="Roll No"></asp:Label>
                                        <asp:TextBox ID="txtRollNo" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <asp:Label ID="lblClass" runat="server" Text="Class"></asp:Label>
                                        <asp:TextBox ID="txtClass" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <asp:Label ID="lblSpecification" runat="server" Text="Specification"></asp:Label>
                                        <asp:TextBox ID="txtSpecification" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <asp:Label ID="lblSection" runat="server" Text="Section"></asp:Label>
                                        <asp:TextBox ID="txtSection" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <asp:Label ID="lblAdmissionDate" runat="server" Text="Admission Date"></asp:Label>
                                        <asp:TextBox ID="txtAdmissionDate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>

                                <asp:Button ID="btnUpdate" runat="server" CssClass="btn btn-success btn-block" Text="Update Profile" OnClick="btnUpdate_Click" />
                            </asp:Panel>
                        </div>
                    </div>
                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; eProject 2025</span>
                    </div>
                </div>
            </footer>
        </div>
        <!-- End Content Wrapper -->

    </div>
    <!-- End Page Wrapper -->

</asp:Content>
