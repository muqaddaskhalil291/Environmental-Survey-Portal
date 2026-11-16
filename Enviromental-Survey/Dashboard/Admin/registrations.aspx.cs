using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Enviromental_Survey.Dashboard.Admin
{
    public partial class registrations : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbConn"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            // Admin session check
            if (Session["AdminID"] == null)
            {
                Response.Redirect("adminlogin.aspx");
            }

            if (!IsPostBack)
            {
                LoadPendingRegistrations();
            }
        }

        private void LoadPendingRegistrations()
        {
            try
            {
                string query = "SELECT UserID, Name, Role, RollNo, Class, Section, EmployeeNo, Department, Qualification, " +
                "AdmissionDate, JoiningDate, CreatedAt, Status FROM Users WHERE Status='Pending' ORDER BY CreatedAt DESC";


                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);

                PendingUsersRepeater.DataSource = dt;
                PendingUsersRepeater.DataBind();
            }
            catch (Exception ex)
            {
                // Optionally log error
            }
        }

        protected void btnApprove_Click(object sender, EventArgs e)
        {
            int userId = Convert.ToInt32((sender as Button).CommandArgument);
            UpdateUserStatus(userId, "Approved");
        }

        protected void btnReject_Click(object sender, EventArgs e)
        {
            int userId = Convert.ToInt32((sender as Button).CommandArgument);
            UpdateUserStatus(userId, "Rejected");
        }

        private void UpdateUserStatus(int userId, string status)
        {
            try
            {
                string query = "UPDATE Users SET Status=@Status WHERE UserID=@UserID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Status", status);
                cmd.Parameters.AddWithValue("@UserID", userId);

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();

                LoadPendingRegistrations(); // Refresh table
            }
            catch (Exception ex)
            {
                if (conn.State == System.Data.ConnectionState.Open) conn.Close();
            }
        }
    }
}