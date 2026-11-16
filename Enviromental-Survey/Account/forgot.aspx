<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forgot.aspx.cs" Inherits="Enviromental_Survey.Account.forgot" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Forgot</title>
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
</head>
<body>
    <form id="form1" runat="server">

        <div class="container">
            <div class="left">

                <img src="<%= ResolveUrl("~/Account/form.jpg") %>" alt="Nature" />
            </div>

            <div class="right">
                <div class="form">
                    <h2>Forgot Password?</h2>

                    <label for="txtEmail">Email</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"
                        placeholder="Enter Your Email" required="true"></asp:TextBox>



                    <label for="txtNewPassword">New Password</label>
                    <asp:TextBox ID="txtNewPassword" runat="server" CssClass="form-control"
                        TextMode="Password" placeholder="Enter New Password" required="true"></asp:TextBox>


                    <label for="txtConfirmPassword">Confirm Password</label>
                    <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control"
                        TextMode="Password" placeholder="Confirm New Password" required="true"></asp:TextBox>



                    <asp:Button ID="btnForgot" runat="server" Text="Reset Password" CssClass="btn-green" OnClick="btnForgot_Click" />
                    <asp:Label ID="lblMessage" runat="server" ForeColor="Red" />


                    </small>


                    <div class="extra-links">
                        <a href="login.aspx">Back to Login</a>
                    </div>
    </form>
    </div>
        </div>

    </form>
</body>
</html>
