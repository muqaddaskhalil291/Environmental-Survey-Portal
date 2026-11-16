<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="logout.aspx.cs" Inherits="Enviromental_Survey.Dashboard.Admin.logout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="bg-success">
  <div class="container  d-flex justify-content-center align-items-center" style="height:100vh;">
    <div class="card shadow-lg w-50 text-center">
      <div class="card-body">
        <i class="fas fa-sign-out-alt fa-3x text-success mb-3"></i>
        <h4 class="card-title">You have been logged out</h4>
        <p class="card-text">Thank you for using the Environmental Survey Admin Dashboard.</p>
          
    <asp:Button ID="logoutl" runat="server" Text="Login Again" Class="btn btn-success" OnClick="logoutl_Click" />
      <%--  <a href="login.aspx" class="btn btn-success"><i class="fas fa-sign-in-alt"></i> Login Again</a>--%>
      </div>
    </div>
  </div>
        </div>
</asp:Content>
