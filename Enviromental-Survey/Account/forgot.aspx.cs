using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Enviromental_Survey.Account
{
    public partial class forgot : System.Web.UI.Page
    {
        // Database connection
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbConn"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            // Nothing special on page load
        }

        protected void btnForgot_Click(object sender, EventArgs e)
        {
            try
            {
                string email = txtEmail.Text.Trim();
                string newPassword = txtNewPassword.Text.Trim();
                string confirmPassword = txtConfirmPassword.Text.Trim();

                if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(newPassword))
                {
                    lblMessage.Text = "Please enter your email and new password.";
                    return;
                }

                if (newPassword != confirmPassword)
                {
                    lblMessage.Text = "Passwords do not match.";
                    return;
                }

                string query = "UPDATE Users SET Password=@Password WHERE Email=@Email";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Password", newPassword); 
                cmd.Parameters.AddWithValue("@Email", email);

                conn.Open();
                int rows = cmd.ExecuteNonQuery();
                conn.Close();

                if (rows > 0)
                {
                    // Password updated successfully
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                    lblMessage.Text = "Password updated successfully. Redirecting to login...";
                    Response.Redirect("login.aspx");
                }
                else
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = "Invalid Email.";
                }
            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Error: " + ex.Message;
            }
        }
    }
}
