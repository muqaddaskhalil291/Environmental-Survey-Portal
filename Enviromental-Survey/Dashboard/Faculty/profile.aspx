<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="Enviromental_Survey.Dashboard.Faculty.profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!--  Page Wrapper -->
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
                    <h1 class="h3 mb-4 text-success">Profile Details</h1>

                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Faculty Details</h6>
                        </div>
                        <div class="card-body">
                            <asp:Panel ID="pnlProfile" runat="server">
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <asp:Label ID="lblName" runat="server" Text="Name"></asp:Label>
                                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
                                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
                                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <asp:Label ID="lblEmployeeNo" runat="server" Text="Employee No"></asp:Label>
                                        <asp:TextBox ID="txtEmployeeNo" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <asp:Label ID="lblDepartment" runat="server" Text="Department"></asp:Label>
                                        <asp:TextBox ID="txtDepartment" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <asp:Label ID="lblQualification" runat="server" Text="Qualification"></asp:Label>
                                        <asp:TextBox ID="txtQualification" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <asp:Label ID="lblJoiningDate" runat="server" Text="Joining Date"></asp:Label>
                                        <asp:TextBox ID="txtJoiningDate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>

                                <asp:Button ID="btnUpdate" runat="server" Text="Update Profile" CssClass="btn btn-success"
                                    OnClick="btnUpdate_Click" />
                                <asp:HiddenField ID="hfFacultyID" runat="server" />
                            </asp:Panel>
                        </div>
                    </div>

                </div>

            </div>
        </div>
    </div>

</asp:Content>
