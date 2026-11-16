<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="competitions.aspx.cs" Inherits="Enviromental_Survey.Dashboard.Admin.competitions" %>

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
                    <div class="container-fluid">
                        <h1 class="h3 mb-4 text-success">Manage Competitions</h1>

                        <!-- Add/Edit Competition Form -->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3 bg-success text-white">
                                <h6 class="m-0 font-weight-bold">Add / Edit Competition</h6>
                            </div>
                            <div class="card-body">
                                <asp:Label ID="lblMessage" runat="server" Text="" />
                                <asp:HiddenField ID="hfCompetitionID" runat="server" />

                                <div class="form-group">
                                    <label>Title</label>
                                    <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control" Placeholder="Enter competition title"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Description</label>
                                    <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" Placeholder="Enter description"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Winner (optional)</label>
                                    <asp:DropDownList ID="ddlWinnerUser" runat="server" CssClass="form-control">
                                        <asp:ListItem Text="Select Winner" Value="" />
                                    </asp:DropDownList>
                                </div>

                                <div class="form-group">
                                    <label>Competition Date</label>
                                    <asp:TextBox ID="txtDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                                </div>

                                <asp:Button ID="btnSave" runat="server" CssClass="btn btn-success" Text="Save Competition" OnClick="btnSave_Click" />
                                <asp:Button ID="btnCancel" runat="server" CssClass="btn btn-secondary" Text="Cancel" OnClick="btnCancel_Click" />
                            </div>
                        </div>

                        <!-- Competitions Table -->
                        <asp:GridView ID="gvCompetitions" runat="server" CssClass="table table-bordered table-striped"
                            AutoGenerateColumns="False"
                            DataKeyNames="CompetitionID"
                            OnRowCommand="gvCompetitions_RowCommand">
                            <Columns>
                                <asp:BoundField DataField="CompetitionID" HeaderText="ID" Visible="false" />
                                <asp:BoundField DataField="Title" HeaderText="Title" />
                                <asp:BoundField DataField="Description" HeaderText="Description" />
                                <asp:BoundField DataField="WinnerName" HeaderText="Winner" />
                                <asp:BoundField DataField="CompetitionDate" HeaderText="Date" DataFormatString="{0:yyyy-MM-dd}" />

                                <asp:TemplateField HeaderText="Actions">
                                    <ItemTemplate>
                                        <asp:Button ID="btnEdit" runat="server" CommandName="EditCompetition"
                                            CommandArgument='<%# Eval("CompetitionID") %>' CssClass="btn btn-primary btn-sm" Text="Edit" />
                                        <asp:Button ID="btnDelete" runat="server" CommandName="DeleteCompetition"
                                            CommandArgument='<%# Eval("CompetitionID") %>' CssClass="btn btn-danger btn-sm ml-2" Text="Delete" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>

                    </div>
                </div>
            </div>
</asp:Content>   