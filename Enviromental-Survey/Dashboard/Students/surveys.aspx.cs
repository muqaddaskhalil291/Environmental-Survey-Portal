using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Enviromental_Survey.Dashboard.Students
{
    public partial class surveys : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["dbConn"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            
                if (!IsPostBack && Session["UserID"] != null)
                {
                    LoadTopbarName(Convert.ToInt32(Session["UserID"]));
                    BindSurveys();
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
    

        private void BindSurveys()
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = @"SELECT SurveyID, Title, Description, TargetRole, CreatedDate
                                 FROM Surveys WHERE TargetRole = 'Student'";
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                // Attach questions for each survey
                dt.Columns.Add("Questions", typeof(List<QuestionModel>));
                foreach (DataRow row in dt.Rows)
                {
                    int surveyId = Convert.ToInt32(row["SurveyID"]);
                    row["Questions"] = GetQuestionsBySurvey(surveyId);
                }

                rptSurveys.DataSource = dt;
                rptSurveys.DataBind();
            }
        }

        private List<QuestionModel> GetQuestionsBySurvey(int surveyId)
        {
            List<QuestionModel> questions = new List<QuestionModel>();
            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = @"SELECT QuestionID, QuestionText 
                                 FROM SurveyQuestions 
                                 WHERE SurveyID=@SurveyID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@SurveyID", surveyId);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    questions.Add(new QuestionModel
                    {
                        QuestionID = Convert.ToInt32(dr["QuestionID"]),
                        QuestionText = dr["QuestionText"].ToString()
                    });
                }
            }
            return questions;
        }

        protected void rptSurveys_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Repeater rptQuestions = (Repeater)e.Item.FindControl("rptQuestions");
                List<QuestionModel> questions = (List<QuestionModel>)DataBinder.Eval(e.Item.DataItem, "Questions");

                rptQuestions.DataSource = questions;
                rptQuestions.DataBind();
            }
        }

        protected void rptSurveys_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "SubmitResponse")
            {
                int surveyId = Convert.ToInt32(e.CommandArgument);
                // Redirect to submit-response.aspx with surveyId
                Response.Redirect("submit-response.aspx?SurveyID=" + surveyId);
            }
        }

        public class QuestionModel
        {
            public int QuestionID { get; set; }
            public string QuestionText { get; set; }
        }
    }
}
