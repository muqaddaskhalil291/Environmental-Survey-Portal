<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="surveys.aspx.cs" Inherits="Enviromental_Survey.Dashboard.Admin.surveys" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

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
          <h1 class="h3 mb-4 text-success">Manage Surveys</h1>

          <!-- Add Survey Form -->
<div class="card shadow mb-4">
    <div class="card-header py-3 bg-success">
        <h6 class="m-0 font-weight-bold text-white">Add / Edit Survey</h6>
    </div>
    <div class="card-body">
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
        
        <div class="form-group">
            <label for="surveyTitle">Survey Title</label>
            <asp:TextBox ID="surveyTitle" runat="server" CssClass="form-control" Placeholder="Enter survey title"></asp:TextBox>
        </div>

        <div class="form-group">
            <label for="surveyDescription">Description</label>
            <asp:TextBox ID="surveyDescription" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" Placeholder="Enter survey description"></asp:TextBox>
        </div>

        <div class="form-group">
            <label for="targetUsers">Target Users</label>
            <asp:DropDownList ID="targetUsers" runat="server" CssClass="form-control">
                <asp:ListItem Text="Students" Value="Student"></asp:ListItem>
                <asp:ListItem Text="Faculty/Staff" Value="Faculty"></asp:ListItem>
            </asp:DropDownList>
        </div>

        
     <div class="form-group">
    <label for="surveyQuestion">Survey Question</label>
    <asp:TextBox ID="surveyQuestion" runat="server" CssClass="form-control" Placeholder="Enter a question"></asp:TextBox>
</div>


<div class="form-group">
    <label>Option 1</label>
    <asp:TextBox ID="option1" runat="server" CssClass="form-control" Placeholder="Enter option 1"></asp:TextBox>
</div>
<div class="form-group">
    <label>Option 2</label>
    <asp:TextBox ID="option2" runat="server" CssClass="form-control" Placeholder="Enter option 2"></asp:TextBox>
</div>
<div class="form-group">
    <label>Option 3</label>
    <asp:TextBox ID="option3" runat="server" CssClass="form-control" Placeholder="Enter option 3"></asp:TextBox>
</div>
<div class="form-group">
    <label>Option 4</label>
    <asp:TextBox ID="option4" runat="server" CssClass="form-control" Placeholder="Enter option 4"></asp:TextBox>
</div>

        <asp:HiddenField ID="hfSurveyID" runat="server" />
        <asp:Button ID="btnAddUpdate" runat="server" Text="Add Survey" CssClass="btn btn-success" OnClick="btnAddUpdate_Click" />
        <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-secondary ml-2" OnClick="btnCancel_Click" />
    </div>
</div>

<!-- Existing Surveys Table -->
<asp:GridView ID="gvSurveys" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-striped"
    OnRowCommand="gvSurveys_RowCommand" DataKeyNames="SurveyID">
    <Columns>
        <asp:BoundField DataField="SurveyID" HeaderText="ID" />
        <asp:BoundField DataField="Title" HeaderText="Title" />
        <asp:BoundField DataField="Description" HeaderText="Description" />
        <asp:BoundField DataField="TargetRole" HeaderText="Target Role" />
        <asp:BoundField DataField="CreatedDate" HeaderText="Created Date" DataFormatString="{0:yyyy-MM-dd}" />

        <asp:TemplateField HeaderText="Questions & Options">
            <ItemTemplate>
                <div style="white-space:pre-line;">
                    <%# Eval("Questions") %>
                </div>
            </ItemTemplate>
        </asp:TemplateField>

     
        <asp:TemplateField HeaderText="Actions">
            <ItemTemplate>
                <asp:LinkButton ID="lnkEdit" runat="server" Text="Edit" 
                    CommandName="EditSurvey" CommandArgument='<%# Eval("SurveyID") %>' 
                    CssClass="btn btn-sm btn-primary"></asp:LinkButton>

                <asp:LinkButton ID="lnkDelete" runat="server" Text="Delete" 
                    CommandName="DeleteSurvey" CommandArgument='<%# Eval("SurveyID") %>' 
                    CssClass="btn btn-sm btn-danger" 
                    OnClientClick="return confirm('Are you sure you want to delete this survey?');"></asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>


        </div>
    </div>
</div>


                

            </div>
            <!-- /.container-fluid -->

        </div>
    </div>
</div>
</asp:Content>
