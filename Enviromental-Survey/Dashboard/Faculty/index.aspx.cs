using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Enviromental_Survey.Dashboard.Faculty
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && Session["UserID"] != null)
            {
                LoadTopbarName(Convert.ToInt32(Session["UserID"]));
                LoadFacultyStats();
                LoadUpcoming();            }
        }

        private void LoadTopbarName(int userId)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbConn"].ConnectionString))
            {
                string query = "SELECT Name FROM Users WHERE UserID=@UserID AND Role='Faculty'";
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


        private void LoadFacultyStats()
        {
            int pendingSurveys = 0;
            int totalCompetitions = 0;

            int participatedCompetitions = 0;
            int seminarsSubmitted = 0;

            if (Session["UserID"] != null)
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbConn"].ConnectionString))
                {
                    conn.Open();

                    // Pending Surveys (Faculty ke liye jo active hain aur abhi attempt nahi kiye)
                    string q1 = @"SELECT COUNT(*) 
                                  FROM Surveys 
                                  WHERE TargetRole='Faculty' AND IsActive=1 
                                  AND SurveyID NOT IN (
                                        SELECT SurveyID 
                                        FROM SurveyResponses 
                                        WHERE UserID=@UserID
                                  )";
                    SqlCommand cmd1 = new SqlCommand(q1, conn);
                    cmd1.Parameters.AddWithValue("@UserID", Session["UserID"]);
                    pendingSurveys = Convert.ToInt32(cmd1.ExecuteScalar());

                    // Total Competitions
                    string q2 = "SELECT COUNT(*) FROM Competitions";
                    totalCompetitions = Convert.ToInt32(new SqlCommand(q2, conn).ExecuteScalar());


                    // Competitions participated (WinnerUserID = faculty)

                    string q3 = @"SELECT COUNT(*) 
                                  FROM Competitions 
                                  WHERE WinnerUserID=@UserID";
                    SqlCommand cmd2 = new SqlCommand(q3, conn);
                    cmd2.Parameters.AddWithValue("@UserID", Session["UserID"]);
                    participatedCompetitions = Convert.ToInt32(cmd2.ExecuteScalar());

                    // Seminars submitted (EffectiveParticipation table)
                    string q4 = @"SELECT COUNT(*) 
                                  FROM EffectiveParticipation 
                                  WHERE UserID=@UserID";
                    SqlCommand cmd3 = new SqlCommand(q4, conn);
                    cmd3.Parameters.AddWithValue("@UserID", Session["UserID"]);
                    seminarsSubmitted = Convert.ToInt32(cmd3.ExecuteScalar());
                }


                // Frontend labels set karna
                lblPendingSurveys.Text = pendingSurveys.ToString();
                lblTotalCompetitions.Text = totalCompetitions.ToString();

                lblParticipatedCompetitions.Text = participatedCompetitions.ToString();
                lblSeminarsSubmitted.Text = seminarsSubmitted.ToString();
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
