<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="faqs.aspx.cs" Inherits="Enviromental_Survey.Dashboard.Admin.faqs" %>
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
     <div class="sidebar-brand-text mx-3"> Enviromental Survey</div>
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
    <h1 class="h3 mb-4 text-success">Manage FAQs</h1>

    <!-- Add FAQ Form -->
    <div class="card shadow mb-4">
        <div class="card-header py-3 bg-success">
            <h6 class="m-0 font-weight-bold text-white">Add New FAQ</h6>
        </div>
        <div class="card-body">
            <asp:Label ID="lblMessage" runat="server" ForeColor="Green"></asp:Label>
            <asp:TextBox ID="txtQuestion" runat="server" CssClass="form-control mb-2" Placeholder="Enter Question"></asp:TextBox>
            <asp:TextBox ID="txtAnswer" runat="server" CssClass="form-control mb-2" TextMode="MultiLine" Rows="3" Placeholder="Enter Answer"></asp:TextBox>
            <asp:Button ID="btnAddFAQ" runat="server" Text="Add FAQ" CssClass="btn btn-success" OnClick="btnAddFAQ_Click" />
        </div>
    </div>

    <!-- Existing FAQs Table -->
    <div class="card shadow mb-4">
        <div class="card-header py-3 bg-success">
            <h6 class="m-0 font-weight-bold text-white">Existing FAQs</h6>
        </div>
        <div class="card-body">
            <asp:Repeater ID="rptFAQs" runat="server" OnItemCommand="rptFAQs_ItemCommand">
                <HeaderTemplate>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Question</th>
                                <th>Answer</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td>
                            <asp:Label ID="lblQuestion" runat="server" Text='<%# Eval("Question") %>'></asp:Label>
                            <asp:TextBox ID="txtEditQuestion" runat="server" Text='<%# Eval("Question") %>' CssClass="form-control" Visible="false"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label ID="lblAnswer" runat="server" Text='<%# Eval("Answer") %>'></asp:Label>
                            <asp:TextBox ID="txtEditAnswer" runat="server" Text='<%# Eval("Answer") %>' CssClass="form-control" Visible="false"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Button ID="btnEdit" runat="server" Text="Edit" CommandName="EditFAQ" CommandArgument='<%# Eval("FAQID") %>' CssClass="btn btn-primary btn-sm" />
                            <asp:Button ID="btnUpdate" runat="server" Text="Update" CommandName="UpdateFAQ" CommandArgument='<%# Eval("FAQID") %>' CssClass="btn btn-success btn-sm" Visible="false" />
                            <asp:Button ID="btnCancel" runat="server" Text="Cancel" CommandName="CancelEdit" CommandArgument='<%# Eval("FAQID") %>' CssClass="btn btn-secondary btn-sm" Visible="false" />
                            <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandName="DeleteFAQ" CommandArgument='<%# Eval("FAQID") %>' CssClass="btn btn-danger btn-sm" OnClientClick="return confirm('Are you sure?');" />
                        </td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                        </tbody>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
        </div>
    </div>
</div>

</asp:Content>
