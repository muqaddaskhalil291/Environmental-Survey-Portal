using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Enviromental_Survey.Dashboard.Faculty
{
    public partial class profile : System.Web.UI.Page
    {
        int userId;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("~/Account/login.aspx"); // redirect if not logged in
            }

            userId = Convert.ToInt32(Session["UserID"]);

            if (!IsPostBack)
            {
                LoadTopbarName();
                LoadProfile();
            }
        }

        // Load topbar name
        private void LoadTopbarName()
        {
            if (Session["UserName"] != null)
            {
                lblUserName.Text = Session["UserName"].ToString();
            }
            else
            {
                // fallback to database
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbConn"].ConnectionString))
                {
                    string query = "SELECT Name FROM Users WHERE UserID=@UserID";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@UserID", userId);

                    conn.Open();
                    object result = cmd.ExecuteScalar();
                    if (result != null)
                        lblUserName.Text = result.ToString();
                }
            }
        }

        // Load faculty profile details
        private void LoadProfile()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbConn"].ConnectionString))
            {
                string query = "SELECT * FROM Users WHERE UserID=@UserID AND Role='Faculty'";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@UserID", userId);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    txtName.Text = reader["Name"].ToString();
                    txtEmail.Text = reader["Email"].ToString();
                    txtPassword.Text = reader["Password"].ToString();
                    txtEmployeeNo.Text = reader["EmployeeNo"].ToString();
                    txtDepartment.Text = reader["Department"].ToString();
                    txtQualification.Text = reader["Qualification"].ToString();
                    txtJoiningDate.Text = reader["JoiningDate"] == DBNull.Value ? "" : Convert.ToDateTime(reader["JoiningDate"]).ToString("yyyy-MM-dd");
                }

                reader.Close();
            }
        }

        // Update faculty profile
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbConn"].ConnectionString))
            {
                string query = @"UPDATE Users SET 
                                Name=@Name,
                                Email=@Email,
                                Password=@Password,
                                EmployeeNo=@EmployeeNo,
                                Department=@Department,
                                Qualification=@Qualification,
                                JoiningDate=@JoiningDate
                                WHERE UserID=@UserID AND Role='Faculty'";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
                cmd.Parameters.AddWithValue("@EmployeeNo", txtEmployeeNo.Text.Trim());
                cmd.Parameters.AddWithValue("@Department", txtDepartment.Text.Trim());
                cmd.Parameters.AddWithValue("@Qualification", txtQualification.Text.Trim());
                cmd.Parameters.AddWithValue("@JoiningDate", string.IsNullOrEmpty(txtJoiningDate.Text) ? DBNull.Value : (object)Convert.ToDateTime(txtJoiningDate.Text));
                cmd.Parameters.AddWithValue("@UserID", userId);

                conn.Open();
                int rows = cmd.ExecuteNonQuery();

                if (rows > 0)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Profile updated successfully!');", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Update failed!');", true);
                }
            }
        }
    }
}
