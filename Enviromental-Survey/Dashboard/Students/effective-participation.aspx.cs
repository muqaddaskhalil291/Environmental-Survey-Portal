using Enviromental_Survey.Dashboard.Admin;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Enviromental_Survey.Dashboard.Students
{
    public partial class effective_participation : System.Web.UI.Page
    {
        int userId ;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] != null)
            {
                userId = Convert.ToInt32(Session["UserID"]);

                if (!IsPostBack)
                {
                    LoadTopbarName(userId);
                    LoadSubmissions();
                }
            }
            else
            {
                Response.Redirect("~/Account/login.aspx"); // redirect if not logged in
            }
        }


        private void LoadTopbarName(int userId)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbConn"].ConnectionString))
            {
                string query = "SELECT Name FROM Users WHERE UserID=@UserID AND Role='Student'";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@UserID", userId);

                conn.Open();
                object result = cmd.ExecuteScalar();
                if (result != null)
                {
                    lblUserName.Text = result.ToString(); // Topbar label
                }
            }
        }

        private void LoadSubmissions()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbConn"].ConnectionString))
            {
                string query = "SELECT SeminarTitle, Location, ConductedDate, CreatedDate FROM EffectiveParticipation WHERE UserID=@UserID ORDER BY CreatedDate DESC";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@UserID", userId);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                rptSubmissions.DataSource = dt;
                rptSubmissions.DataBind();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string title = txtTitle.Text.Trim();
            string location = txtLocation.Text.Trim();
            DateTime conductedDate = Convert.ToDateTime(txtDate.Text);

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbConn"].ConnectionString))
            {
                string query = "INSERT INTO EffectiveParticipation(UserID, SeminarTitle, Location, ConductedDate) VALUES(@UserID, @Title, @Location, @ConductedDate)";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@UserID", userId);
                cmd.Parameters.AddWithValue("@Title", title);
                cmd.Parameters.AddWithValue("@Location", location);
                cmd.Parameters.AddWithValue("@ConductedDate", conductedDate);

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }

            lblMessage.Text = "Submission successful!";
            lblMessage.Visible = true;

            txtTitle.Text = "";
            txtLocation.Text = "";
            txtDate.Text = "";

            LoadSubmissions(); // refresh table
        }
    }
}

