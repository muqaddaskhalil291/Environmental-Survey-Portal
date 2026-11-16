<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="support.aspx.cs" Inherits="Enviromental_Survey.Dashboard.Admin.support" %>

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
        <h1 class="h3 mb-4 text-success">Manage Support Info</h1>

        <!-- Add / Edit Form -->
        <div class="card shadow mb-4">
            <div class="card-header bg-success text-white">Add / Edit Support Contact</div>
            <div class="card-body">
                <asp:Panel ID="pnlForm" runat="server">
                    <div class="form-group">
                        <asp:Label ID="lblContactPerson" runat="server" Text="Contact Person"></asp:Label>
                        <asp:TextBox ID="txtContactPerson" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblPhone" runat="server" Text="Phone"></asp:Label>
                        <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblDescription" runat="server" Text="Description"></asp:Label>
                        <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                    </div>
                    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-success" OnClick="btnSave_Click" />
                    <asp:HiddenField ID="hfSupportID" runat="server" />
                </asp:Panel>
            </div>
        </div>

        <!-- Support Info Table -->
        <div class="card shadow mb-4">
            <div class="card-header bg-success text-white">Existing Support Info</div>
            <div class="card-body">
                <asp:GridView ID="gvSupport" runat="server" AutoGenerateColumns="False" DataKeyNames="SupportID"
                    CssClass="table table-bordered table-striped">
                    <Columns>
                        <asp:BoundField DataField="ContactPerson" HeaderText="Contact Person" />
                        <asp:BoundField DataField="Email" HeaderText="Email" />
                        <asp:BoundField DataField="Phone" HeaderText="Phone" />
                        <asp:BoundField DataField="Description" HeaderText="Description" />
                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnEdit" runat="server" CssClass="btn btn-primary btn-sm"
                                    CommandArgument='<%# Eval("SupportID") %>' OnClick="btnEdit_Click">
                                    <i class="fas fa-edit"></i> Edit
                                </asp:LinkButton>
                                <asp:LinkButton ID="btnDelete" runat="server" CssClass="btn btn-danger btn-sm"
                                    CommandArgument='<%# Eval("SupportID") %>' OnClick="btnDelete_Click"
                                    OnClientClick="return confirm('Are you sure you want to delete this record?');">
                                    <i class="fas fa-trash"></i> Delete
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
