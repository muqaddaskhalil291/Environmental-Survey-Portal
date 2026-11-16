<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="reports.aspx.cs" Inherits="Enviromental_Survey.Dashboard.Admin.reports" %>

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

        <h1 class="h3 mb-4 text-success">Reports</h1>

        <!-- Filters -->
        <div class="card shadow mb-4">
            <div class="card-body">
                <div class="row g-3">
                    <div class="col-md-3">
                        <asp:DropDownList ID="ddlSurveyFilter" runat="server" CssClass="form-control">
                            <asp:ListItem Text="All Surveys" Value="" />
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-3">
                        <asp:DropDownList ID="ddlRoleFilter" runat="server" CssClass="form-control">
                            <asp:ListItem Text="All Roles" Value="" />
                            <asp:ListItem Text="Student" Value="Student" />
                            <asp:ListItem Text="Faculty" Value="Faculty" />
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-3">
                        <asp:TextBox ID="txtDateFilter" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                    </div>
                    <div class="col-md-3">
                        <asp:Button ID="btnApplyFilter" runat="server" CssClass="btn btn-success w-100" Text="Apply Filters" OnClick="btnApplyFilter_Click" />
                    </div>
                </div>
            </div>
        </div>
                                    <!-- Effective Participation Table -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3 bg-success">
                            <h6 class="m-0 font-weight-bold text-white">Effective Participation</h6>
                        </div>
                        <div class="card-body">
                            <asp:GridView ID="gvParticipation" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-striped">
                                <Columns>
                                    <asp:BoundField DataField="UserName" HeaderText="User Name" />
                                    <asp:BoundField DataField="Role" HeaderText="Role" />
                                    <asp:BoundField DataField="SeminarTitle" HeaderText="Seminar/Workshop Title" />
                                    <asp:BoundField DataField="Location" HeaderText="Location" />
                                    <asp:BoundField DataField="ParticipantsCount" HeaderText="Participants Count" />
                                    <asp:BoundField DataField="ConductedDate" HeaderText="Conducted Date" DataFormatString="{0:yyyy-MM-dd}" />
                                    <asp:BoundField DataField="CreatedDate" HeaderText="Submitted On" DataFormatString="{0:yyyy-MM-dd}" />
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>

        <!-- Charts -->
        <div class="row">
            <div class="col-xl-6 col-lg-6 mb-4">
                <div class="card shadow mb-4">
                    <div class="card-header py-3 bg-success">
                        <h6 class="m-0 font-weight-bold text-white">Survey Participation</h6>
                    </div>
                    <div class="card-body">
                        <canvas id="surveyChart"></canvas>
                    </div>
                </div>
            </div>
            <div class="col-xl-6 col-lg-6 mb-4">
                <div class="card shadow mb-4">
                    <div class="card-header py-3 bg-success">
                        <h6 class="m-0 font-weight-bold text-white">User Activity</h6>
                    </div>
                    <div class="card-body">
                        <canvas id="userChart"></canvas>
                    </div>
                </div>
            </div>
        </div>

        <!-- Survey Responses Table -->
        <div class="card shadow mb-4">
            <div class="card-header py-3 bg-success">
                <h6 class="m-0 font-weight-bold text-white">Survey Responses</h6>
            </div>
            <div class="card-body">
              <asp:GridView ID="gvSurveyResponses" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-striped">
    <Columns>
        <asp:BoundField DataField="UserName" HeaderText="User Name" />
        <asp:BoundField DataField="Role" HeaderText="Role" />
        <asp:BoundField DataField="SurveyTitle" HeaderText="Survey Title" />
        <asp:BoundField DataField="QuestionText" HeaderText="Question" />
        <asp:BoundField DataField="SelectedOption" HeaderText="Response" />
        <asp:BoundField DataField="SubmittedDate" HeaderText="Submitted Date" DataFormatString="{0:yyyy-MM-dd}" />
    </Columns>
</asp:GridView>

            </div>
        </div>

    </div>

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        // Charts will be populated dynamically using data from code-behind
        const surveyData = <%= GetSurveyChartData() %>;
        const surveyCtx = document.getElementById('surveyChart').getContext('2d');
        new Chart(surveyCtx, {
            type: 'bar',
            data: {
                labels: surveyData.labels,
                datasets: [{
                    label: 'Total Participants',
                    data: surveyData.data,
                    backgroundColor: 'rgba(28, 200, 138, 0.7)',
                    borderColor: 'rgba(28, 200, 138, 1)',
                    borderWidth: 1
                }]
            },
            options: { responsive: true, scales: { y: { beginAtZero: true } } }
        });

        const userData = <%= GetUserChartData() %>;
        const userCtx = document.getElementById('userChart').getContext('2d');
        new Chart(userCtx, {
            type: 'line',
            data: {
                labels: userData.labels,
                datasets: [{
                    label: 'Active Users',
                    data: userData.data,
                    backgroundColor: 'rgba(28, 200, 138, 0.2)',
                    borderColor: 'rgba(28, 200, 138, 1)',
                    borderWidth: 2,
                    fill: true,
                    tension: 0.3
                }]
            },
            options: { responsive: true, scales: { y: { beginAtZero: true } } }
        });
    </script>
    </asp:Content>

