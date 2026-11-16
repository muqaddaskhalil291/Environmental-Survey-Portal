<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="users.aspx.cs" Inherits="Enviromental_Survey.Dashboard.Admin.users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

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
                    <h1 class="h3 mb-4 text-success">Manage Users</h1>

                    <div class="card shadow mb-4">
                        <div class="card-header py-3 bg-success">
                            <h6 class="m-0 font-weight-bold text-white">Active Users</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered">
                                    <thead class="thead-light">
                                        <tr>
                                            <th>Name</th>
                                            <th>Role</th>
                                            <th>Roll/Emp No</th>
                                            <th>Class/Dept</th>
                                            <th>Section/Qual.</th>
                                            <th>Date Joined</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Repeater ID="UsersRepeater" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                    <td><%# Eval("Name") %></td>
                                                    <td><%# Eval("Role") %></td>
                                                    <td><%# Eval("RollNo") != DBNull.Value ? Eval("RollNo") : Eval("EmployeeNo") %></td>
                                                    <td><%# Eval("Class") != DBNull.Value ? Eval("Class") : Eval("Department") %></td>
                                                    <td><%# Eval("Section") != DBNull.Value ? Eval("Section") : Eval("Qualification") %></td>

                                                    <td><%# Eval("AdmissionDate") != DBNull.Value ? Convert.ToDateTime(Eval("AdmissionDate")).ToString("yyyy-MM-dd") : (Eval("JoiningDate") != DBNull.Value ? Convert.ToDateTime(Eval("JoiningDate")).ToString("yyyy-MM-dd") : "") %></td>
                                                    <td>
                                                        <asp:Button ID="btnDelete" runat="server" Text="Delete"
                                                            CssClass="btn btn-danger btn-sm"
                                                            CommandArgument='<%# Eval("UserID") %>'
                                                            OnClick="btnDelete_Click" CausesValidation="false" />

                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>


                <!-- /.container-fluid -->

            </div>
        </div>
    </div>

</asp:Content>
