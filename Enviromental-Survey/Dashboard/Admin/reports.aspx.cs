using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Enviromental_Survey.Dashboard.Admin
{
    public partial class reports : System.Web.UI.Page
    {
           private string connStr = ConfigurationManager.ConnectionStrings["dbConn"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
                LoadSurveyDropdown();
                LoadSurveyResponses();
                LoadEffectiveParticipation();
            }
        }

    
        private void LoadSurveyDropdown()
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("SELECT SurveyID, Title FROM Surveys", con);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                ddlSurveyFilter.DataSource = reader;
                ddlSurveyFilter.DataTextField = "Title";
                ddlSurveyFilter.DataValueField = "SurveyID";
                ddlSurveyFilter.DataBind();
                ddlSurveyFilter.Items.Insert(0, new System.Web.UI.WebControls.ListItem("All Surveys", ""));
            }
        }

        private void LoadSurveyResponses(string surveyID = "", string role = "", string date = "")
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = @"
            SELECT 
                u.Name AS UserName,
                u.Role,
                s.Title AS SurveyTitle,
                q.QuestionText,
                o.OptionText AS SelectedOption,
                r.SubmittedDate
            FROM SurveyResponses r
            INNER JOIN Users u ON r.UserID = u.UserID
            INNER JOIN Surveys s ON r.SurveyID = s.SurveyID
            INNER JOIN SurveyQuestions q ON r.QuestionID = q.QuestionID
            INNER JOIN SurveyOptions o ON r.OptionID = o.OptionID
            WHERE (@SurveyID = '' OR s.SurveyID = @SurveyID)
              AND (@Role = '' OR u.Role = @Role)
              AND (@Date = '' OR CAST(r.SubmittedDate AS DATE) = @Date)
            ORDER BY s.Title, r.SubmittedDate, q.QuestionID";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@SurveyID", string.IsNullOrEmpty(surveyID) ? "" : surveyID);
                    cmd.Parameters.AddWithValue("@Role", string.IsNullOrEmpty(role) ? "" : role);
                    cmd.Parameters.AddWithValue("@Date", string.IsNullOrEmpty(date) ? "" : date);

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    gvSurveyResponses.DataSource = dt;
                    gvSurveyResponses.DataBind();
                }
            }
        }


        // Load Effective Participation with optional role filter
        private void LoadEffectiveParticipation(string role = "", string date = "")
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = @"SELECT u.Name AS UserName, u.Role, ep.SeminarTitle, ep.Location, ep.ParticipantsCount, ep.ConductedDate, ep.CreatedDate
                                 FROM EffectiveParticipation ep
                                 INNER JOIN Users u ON ep.UserID = u.UserID
                                 WHERE (@Role = '' OR u.Role = @Role)
                                   AND (@Date = '' OR CAST(ep.ConductedDate AS DATE) = @Date)
                                 ORDER BY ep.CreatedDate DESC";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Role", string.IsNullOrEmpty(role) ? "" : role);
                    cmd.Parameters.AddWithValue("@Date", string.IsNullOrEmpty(date) ? "" : date);

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    gvParticipation.DataSource = dt;
                    gvParticipation.DataBind();
                }
            }
        }

        // Apply filters for both Survey and Participation
        protected void btnApplyFilter_Click(object sender, EventArgs e)
        {
            string selectedSurvey = ddlSurveyFilter.SelectedValue;
            string selectedRole = ddlRoleFilter.SelectedValue;
            string selectedDate = txtDateFilter.Text;

            LoadSurveyResponses(selectedSurvey, selectedRole, selectedDate);
            LoadEffectiveParticipation(selectedRole, selectedDate);
        }

        // Survey Participation Chart Data
        public string GetSurveyChartData()
        {
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = @"SELECT s.Title, COUNT(r.ResponseID) AS TotalParticipants
                                 FROM Surveys s
                                 LEFT JOIN SurveyResponses r ON s.SurveyID = r.SurveyID
                                 GROUP BY s.Title";
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                da.Fill(dt);
            }

            var chartData = new
            {
                labels = dt.Rows.Count > 0 ? dt.AsEnumerable().Select(r => r["Title"].ToString()).ToArray() : new string[] { },
                data = dt.Rows.Count > 0 ? dt.AsEnumerable().Select(r => Convert.ToInt32(r["TotalParticipants"])).ToArray() : new int[] { }
            };

            return new JavaScriptSerializer().Serialize(chartData);
        }

        // User Activity Chart Data
        public string GetUserChartData()
        {
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = @"SELECT CAST(SubmittedDate AS DATE) AS Date, COUNT(DISTINCT UserID) AS ActiveUsers
                                 FROM SurveyResponses
                                 GROUP BY CAST(SubmittedDate AS DATE)
                                 ORDER BY Date";
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                da.Fill(dt);
            }

            var chartData = new
            {
                labels = dt.Rows.Count > 0 ? dt.AsEnumerable().Select(r => Convert.ToDateTime(r["Date"]).ToString("MMM dd")).ToArray() : new string[] { },
                data = dt.Rows.Count > 0 ? dt.AsEnumerable().Select(r => Convert.ToInt32(r["ActiveUsers"])).ToArray() : new int[] { }
            };

            return new JavaScriptSerializer().Serialize(chartData);
        }
    }
}