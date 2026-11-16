using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace Enviromental_Survey.Dashboard.Students
{
    public partial class profile : System.Web.UI.Page

    {
        // Use the class-level userId
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

        // Load student profile details
        private void LoadProfile()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbConn"].ConnectionString))
            {
                string query = "SELECT * FROM Users WHERE UserID=@UserID AND Role='Student'";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@UserID", userId);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    txtName.Text = reader["Name"].ToString();
                    txtEmail.Text = reader["Email"].ToString();
                    txtPassword.Text = reader["Password"].ToString();
                    txtRole.Text = reader["Role"].ToString();
                    txtRollNo.Text = reader["RollNo"].ToString();
                    txtClass.Text = reader["Class"].ToString();
                    txtSpecification.Text = reader["Specification"].ToString();
                    txtSection.Text = reader["Section"].ToString();
                    txtAdmissionDate.Text = reader["AdmissionDate"] == DBNull.Value ? "" : Convert.ToDateTime(reader["AdmissionDate"]).ToString("yyyy-MM-dd");
                }
                reader.Close();
            }
        }

        // Update student profile
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbConn"].ConnectionString))
            {
                string query = @"UPDATE Users SET 
                                Name=@Name, 
                                Email=@Email, 
                                Password=@Password, 
                                RollNo=@RollNo, 
                                Class=@Class, 
                                Specification=@Specification, 
                                Section=@Section, 
                                AdmissionDate=@AdmissionDate
                                WHERE UserID=@UserID AND Role='Student'";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
                cmd.Parameters.AddWithValue("@RollNo", txtRollNo.Text.Trim());
                cmd.Parameters.AddWithValue("@Class", txtClass.Text.Trim());
                cmd.Parameters.AddWithValue("@Specification", txtSpecification.Text.Trim());
                cmd.Parameters.AddWithValue("@Section", txtSection.Text.Trim());
                cmd.Parameters.AddWithValue("@AdmissionDate", string.IsNullOrEmpty(txtAdmissionDate.Text) ? DBNull.Value : (object)Convert.ToDateTime(txtAdmissionDate.Text));
                cmd.Parameters.AddWithValue("@UserID", userId);

                conn.Open();
                int rows = cmd.ExecuteNonQuery();

                if (rows > 0)
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Profile updated successfully!');", true);
                else
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Update failed!');", true);
            }
        }
    }
}