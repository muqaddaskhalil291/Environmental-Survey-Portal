using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Enviromental_Survey.Account
{
    public partial class login : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbConn"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            // Do not perform login on page load
            if (!IsPostBack)
            {
                lblMessage.Text = ""; // Clear message on first load
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();        // Use server-side TextBox
            string password = txtPassword.Text.Trim();

            if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password))
            {
                lblMessage.Text = "Please enter both email and password.";
                return;
            }

            try
            {
                string query = "SELECT UserID, Name, Role, Status FROM Users WHERE Email=@Email AND Password=@Password";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Password", password);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.HasRows)
                {
                    reader.Read();
                    string status = reader["Status"].ToString();
                    string role = reader["Role"].ToString();

                    if (status == "Pending")
                        lblMessage.Text = "Your account is pending approval by admin.";
                    else if (status == "Rejected")
                        lblMessage.Text = "Your registration was rejected.";
                    else if (status == "Approved")
                    {
                        Session["UserID"] = reader["UserID"].ToString();
                        Session["UserName"] = reader["Name"].ToString();
                        Session["Role"] = reader["Role"].ToString();

                        if (role == "Student")
                            Response.Redirect("~/Dashboard/Students/index.aspx");
                        else if (role == "Faculty")
                            Response.Redirect("~/Dashboard/Faculty/index.aspx");
                    }
                }
                else
                {
                    lblMessage.Text = "Invalid email or password.";
                }

                reader.Close();
                conn.Close();
            }
            catch (Exception ex)
            {
                if (conn.State == System.Data.ConnectionState.Open)
                    conn.Close();
                lblMessage.Text = "Error: " + ex.Message;
            }
        }
    }
}
