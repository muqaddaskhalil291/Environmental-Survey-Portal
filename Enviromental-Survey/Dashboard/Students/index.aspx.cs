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
    public partial class index : System.Web.UI.Page
    {
        int userId;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && Session["UserID"] != null)
            {
                LoadTopbarName(Convert.ToInt32(Session["UserID"]));
                LoadDashboardCounts();
                LoadUpcoming();
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
        private void LoadDashboardCounts()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbConn"].ConnectionString))
            {
                conn.Open();


                // Pending Surveys (sirf Student ke liye)
                SqlCommand cmd1 = new SqlCommand(@"
            SELECT COUNT(*) 
            FROM Surveys s
            LEFT JOIN SurveyResponses r 
              ON s.SurveyID = r.SurveyID AND r.UserID = @UserID
            WHERE s.TargetRole='Student' AND s.IsActive=1 AND r.ResponseID IS NULL", conn);
                cmd1.Parameters.AddWithValue("@UserID", userId);
                int pendingSurveys = Convert.ToInt32(cmd1.ExecuteScalar());


                // Competitions (status column hata diya)
                SqlCommand cmd2 = new SqlCommand("SELECT COUNT(*) FROM Competitions", conn);
                int competitions = Convert.ToInt32(cmd2.ExecuteScalar());

                // Workshops
                SqlCommand cmd3 = new SqlCommand("SELECT COUNT(*) FROM EffectiveParticipation", conn);
                int workshops = Convert.ToInt32(cmd3.ExecuteScalar());



                // Assign values to frontend labels
                lblSurveys.Text = pendingSurveys.ToString();
                lblCompetitions.Text = competitions.ToString();
                lblWorkshops.Text = workshops.ToString();

            }
        }

        // Upcoming Competitions & Workshops
        private void LoadUpcoming()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbConn"].ConnectionString))
            {
                conn.Open();
                string query = @"
                    SELECT CompetitionID, Title, Description, CompetitionDate
                    FROM Competitions
                    ORDER BY CompetitionDate DESC";





                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvUpcoming.DataSource = dt;
                gvUpcoming.DataBind();
            }
        }
    }
}
