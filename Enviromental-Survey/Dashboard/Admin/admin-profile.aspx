<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="admin-profile.aspx.cs" Inherits="Enviromental_Survey.Dashboard.Admin.admin_profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-top" style="background-color:#f8f9fc;">
     <div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-success sidebar sidebar-dark accordion" id="accordionSidebar">
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.aspx">
        <div class="sidebar-brand-icon rotate-n-15"><i class="fas fa-leaf"></i></div>
        <div class="sidebar-brand-text mx-3">Enviromental Survey </div>
      </a>
      <hr class="sidebar-divider my-0">
      <li class="nav-item"><a class="nav-link" href="index.aspx"><i class="fas fa-fw fa-tachometer-alt"></i> Admin</a></li>
      <hr class="sidebar-divider">
      <div class="sidebar-heading">Management</div>
      <li class="nav-item"><a class="nav-link" href="registrations.aspx"><i class="fas fa-user-check"></i> Manage Registrations</a></li>
      <li class="nav-item"><a class="nav-link" href="users.aspx"><i class="fas fa-users"></i> Manage Users</a></li>
      <li class="nav-item"><a class="nav-link" href="surveys.aspx"><i class="fas fa-poll"></i> Manage Surveys</a></li>
      <li class="nav-item"><a class="nav-link" href="competitions.aspx"><i class="fas fa-trophy"></i> Manage Competitions</a></li>
      <li class="nav-item"><a class="nav-link" href="faqs.aspx"><i class="fas fa-question-circle"></i> Manage FAQs</a></li>
      <hr class="sidebar-divider">
      <li class="nav-item"><a class="nav-link" href="logout.aspx"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
    </ul>

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">
      <div id="content">

        <!-- Topbar -->
        <nav class="navbar navbar-expand navbar-light bg-success shadow mb-4 topbar static-top">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item dropdown no-arrow">
              <a class="nav-link dropdown-toggle text-white" href="#" id="userDropdown" role="button" data-toggle="dropdown">
                <span class="mr-2 d-none d-lg-inline small">Admin</span>
              
                      <img class="img-profile rounded-circle" src="../Assets/img/undraw_profile.svg" alt="Admin Profile" />
              </a>
            </li>
          </ul>
        </nav>

        <!-- Page Content -->
        <div class="container-fluid" style="padding-top:30px;">

          <h1 class="h3 mb-4" style="color:#1cc88a;">Admin Profile</h1>

          <div class="row justify-content-center">
            <div class="col-lg-6">
              <div style="border:1px solid #dee2e6; border-radius:10px; padding:30px; background-color:#fff; text-align:center; box-shadow:0 4px 6px rgba(0,0,0,0.1);">
       <img class="img-profile rounded-circle" src="../Assets/img/undraw_profile.svg" alt="Admin Profile" style="width:120px; height:120px; border-radius:50%; margin-bottom:15px;">
                <h3 style="margin-bottom:5px; color:#1cc88a;">Admin</h3>
                <p style="color:#6c757d; margin-bottom:15px;">Administrator</p>

                <ul style="list-style:none; padding:0; text-align:left; margin-top:20px;">
                  <li style="padding:10px 0; border-bottom:1px solid #e3e6f0;"><strong style="width:150px; display:inline-block;">Email:</strong> admin@gmail.com</li>
                  <li style="padding:10px 0; border-bottom:1px solid #e3e6f0;"><strong style="width:150px; display:inline-block;">Username:</strong> Admin</li>
                  <li style="padding:10px 0;"><strong style="width:150px; display:inline-block;">Password:</strong> ********</li>
                </ul>
              </div>
            </div>
          </div>

        </div>

        <!-- Footer -->
        <footer class="sticky-footer bg-white">
          <div class="container my-auto">
            <div class="copyright text-center my-auto">
              <span>Copyright &copy; eProject 2025</span>
            </div>
          </div>
        </footer>

      </div>
    </div>
  </div>


        </div>
</asp:Content>
