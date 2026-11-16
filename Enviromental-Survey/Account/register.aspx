<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="Enviromental_Survey.Account.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register Now</title>
    <style>
        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
            font-family: Georgia, 'Times New Roman', Times, serif;
            background: #f0f2f5;
        }

        /* container */
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

        /* left image */
        .left {
            flex: 1;
        }

            .left img {
                width: 100%;
                height: 100%;
                object-fit: cover;
            }

        /* right form */
        .right {
            flex: 2;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
            background: #fff;
        }

        .form {
            width: 100%;
            max-width: 500px;
        }

        . h2 {
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

        input, select {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 30px;
            font-size: 14px;
            box-sizing: border-box;
        }

        /* button */
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

        .extra-links {
            margin-top: 15px;
            text-align: center;
        }

            .extra-links a {
                color: #2a77c9;
                text-decoration: none;
                margin: 0 5px;
                font-size: small;
            }

                .extra-links a:hover {
                    text-decoration: underline;
                }

        /* role fields */
        #studentFields,
        #facultyFields {
            display: none;
            margin-top: 15px;
        }
    </style>

    <script>
        function toggleFields() {
            let role = document.getElementById("role").value;
            document.getElementById('<%= pnlStudent.ClientID %>').style.display = (role === "Student") ? "block" : "none";
            document.getElementById('<%= pnlFaculty.ClientID %>').style.display = (role === "Faculty") ? "block" : "none";
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="left">

                <img src="<%= ResolveUrl("~/Account/form.jpg") %>" alt="Nature" />
            </div>

            <div class="right">
                <div class="form">
                    <h2>Create an Account!</h2>

                    <label>Name:</label>
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" Placeholder="Enter full name"></asp:TextBox>

                    <label>Email:</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" Placeholder="Enter Your Email"></asp:TextBox>

                    <label>Password:</label>
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" Placeholder="Enter password"></asp:TextBox>

                    <label>User Role:</label>
                    <select id="role" name="role" onchange="toggleFields()">
                        <option value="">--Select Role--</option>
                        <option value="Student">Student</option>
                        <option value="Faculty">Faculty</option>
                    </select>


                    <!-- Student Fields -->
                    <!-- Student Fields -->
                    <asp:Panel ID="pnlStudent" runat="server" Style="display: none;">
                        <label>Roll No:</label>
                        <asp:TextBox ID="txtRollNo" runat="server" CssClass="form-control"></asp:TextBox>
                        <label>Class:</label>
                        <asp:TextBox ID="txtClass" runat="server" CssClass="form-control"></asp:TextBox>
                        <label>Specification:</label>
                        <asp:TextBox ID="txtSpec" runat="server" CssClass="form-control"></asp:TextBox>
                        <label>Section:</label>
                        <asp:TextBox ID="txtSection" runat="server" CssClass="form-control"></asp:TextBox>
                        <label>Admission Date:</label>
                        <asp:TextBox ID="txtAdmissionDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                    </asp:Panel>

                    <!-- Faculty Fields -->
                    <asp:Panel ID="pnlFaculty" runat="server" Style="display: none;">
                        <label>Employee No:</label>
                        <asp:TextBox ID="txtEmpNo" runat="server" CssClass="form-control"></asp:TextBox>
                        <label>Department:</label>
                        <asp:TextBox ID="txtDept" runat="server" CssClass="form-control"></asp:TextBox>
                        <label>Qualification:</label>
                        <asp:TextBox ID="txtQualification" runat="server" CssClass="form-control"></asp:TextBox>
                        <label>Date of Joining:</label>
                        <asp:TextBox ID="txtJoiningDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                    </asp:Panel>

                    <asp:Button ID="btnRegister" runat="server" CssClass="btn-green" Text="Register" OnClick="btnRegister_Click" />

                    <div class="extra-links">
                        <a href="forgot.aspx">Forgot Password?</a><br />
                        <a href="login.aspx">Already have an account? Login!</a>
                    </div>
                </div>
            </div>
        </div>

    </form>
</body>
</html>
