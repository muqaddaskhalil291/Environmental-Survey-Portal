<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminlogin.aspx.cs" Inherits="Enviromental_Survey.Dashboard.Admin.adminlogin" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin-Login</title>
    <style>
        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
            font-family: Georgia, 'Times New Roman', Times, serif;
            background: #f0f2f5;
        }

        .container {
            display: flex;
            width: 80%;
            max-width: 900px;
            min-height: 550px;
            margin: 40px auto;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 8px 24px rgba(0,0,0,0.15);
            background: #fff;
        }

        .left {
            flex: 1;
        }

        .left img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .right {
            flex: 2;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 10px;
            background:#f4fbf8;
        }

        .form {
            width: 100%;
            max-width: 500px;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
            font-size: 24px;
        }

        label {
            font-weight: bold;
            margin-bottom: 6px;
            font-size: 13px;
        }

        input, select, .asp-input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 30px;
            font-size: 14px;
            box-sizing: border-box;
        }

        .btn-green {
            margin-top: 10px;
            width: 100%;
            padding: 14px;
            background: #28a745;
            color: #fff;
            font-size: 16px;
            border: none;
            border-radius: 30px;
            cursor: pointer;
            transition: background 0.3s;
        }

        .btn-green:hover {
            background: #218838;
        }

        .error {
            color: red;
            font-size: 13px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
      <div class="container">
        <div class="left">
            <img src="<%= ResolveUrl("form.jpg") %>" alt="Nature" />
        </div>

        <div class="right">
            <div class="form">
                <h2>Welcome Admin</h2>

                <label>Email:</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="asp-input" placeholder="Enter Your Email"></asp:TextBox>

                <label>Password:</label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="asp-input" placeholder="Enter Password"></asp:TextBox>

                <asp:Button ID="adlogin" runat="server" Text="Login" CssClass="btn-green" OnClick="adminlogin_Click" />
                <asp:Label ID="lblMessage" runat="server" CssClass="error" />
            </div>
        </div>
      </div>
    </form>
</body>
</html>
