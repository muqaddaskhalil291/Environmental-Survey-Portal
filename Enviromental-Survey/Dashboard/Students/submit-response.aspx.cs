using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Enviromental_Survey.Dashboard.Students
{
    public partial class submit_response : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbConn"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && Session["UserID"] != null)
            {
                int userId = Convert.ToInt32(Session["UserID"]);
                LoadTopbarName(userId);
            }

            if (!IsPostBack)
            {
                if (Request.QueryString["SurveyID"] != null)
                {
                    int surveyID = Convert.ToInt32(Request.QueryString["SurveyID"]);
                    hfSurveyID.Value = surveyID.ToString();
                    LoadSurvey(surveyID);
                }
                else
                {
                    lblMessage.Text = "Invalid Survey!";
                    pnlSurvey.Visible = false;
                }
            }
        }

        private void LoadTopbarName(int userId)
        {
            try
            {
                using (SqlCommand cmd = new SqlCommand("SELECT Name FROM Users WHERE UserID=@UserID", conn))
                {
                    cmd.Parameters.AddWithValue("@UserID", userId);
                    conn.Open();
                    object result = cmd.ExecuteScalar();
                    if (result != null) lblUserName.Text = result.ToString();
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error loading user name: " + ex.Message;
            }
            finally
            {
                if (conn.State == System.Data.ConnectionState.Open) conn.Close();
            }
        }

        private void LoadSurvey(int surveyID)
        {
            try
            {
                if (conn.State == ConnectionState.Closed) conn.Open();

                // Load survey details
                SqlCommand cmdSurvey = new SqlCommand("SELECT Title FROM Surveys WHERE SurveyID=@SurveyID AND IsActive=1", conn);
                cmdSurvey.Parameters.AddWithValue("@SurveyID", surveyID);
                SqlDataReader drSurvey = cmdSurvey.ExecuteReader();
                if (drSurvey.Read())
                {
                    lblSurveyTitle.Text = drSurvey["Title"].ToString();
 
                    pnlSurvey.Visible = true;
                }
                drSurvey.Close();

                // Load questions with options
                SqlCommand cmdQuestions = new SqlCommand(
                    "SELECT q.QuestionID, q.QuestionText, o.OptionID, o.OptionText " +
                    "FROM SurveyQuestions q " +
                    "INNER JOIN SurveyOptions o ON q.QuestionID=o.QuestionID " +
                    "WHERE q.SurveyID=@SurveyID ORDER BY q.QuestionID, o.OptionID", conn);
                cmdQuestions.Parameters.AddWithValue("@SurveyID", surveyID);

                SqlDataAdapter da = new SqlDataAdapter(cmdQuestions);
                DataTable dt = new DataTable();
                da.Fill(dt);

                // Group questions
                DataView view = new DataView(dt);
                DataTable distinctQuestions = view.ToTable(true, "QuestionID", "QuestionText");

                rptQuestions.DataSource = distinctQuestions;
                rptQuestions.DataBind();

                // Bind options for each question
                foreach (RepeaterItem item in rptQuestions.Items)
                {
                    HiddenField hfQ = (HiddenField)item.FindControl("hfQuestionID");
                    RadioButtonList rbl = (RadioButtonList)item.FindControl("rblOptions");

                    if (hfQ != null && rbl != null)
                    {
                        int questionID = Convert.ToInt32(hfQ.Value);
                        DataRow[] options = dt.Select("QuestionID=" + questionID);

                        if (options.Length > 0)
                        {
                            // Convert DataRow[] to DataTable
                            DataTable dtOptions = options.CopyToDataTable();
                            rbl.DataSource = dtOptions;
                            rbl.DataTextField = "OptionText";
                            rbl.DataValueField = "OptionID";
                            rbl.DataBind();
                        }
                    }
                }

            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error loading survey: " + ex.Message;
            }
            finally
            {
                if (conn.State == ConnectionState.Open) conn.Close();
            }
        }

        protected void btnSubmitResponse_Click(object sender, EventArgs e)
        {
            try
            {
                int userID = Convert.ToInt32(Session["UserID"]);
                int surveyID = Convert.ToInt32(hfSurveyID.Value);

                if (conn.State == ConnectionState.Closed) conn.Open();

                foreach (RepeaterItem item in rptQuestions.Items)
                {
                    RadioButtonList rbl = (RadioButtonList)item.FindControl("rblOptions");
                    HiddenField hfQ = (HiddenField)item.FindControl("hfQuestionID");

                    if (hfQ != null && rbl != null && !string.IsNullOrEmpty(rbl.SelectedValue))
                    {
                        int questionID = Convert.ToInt32(hfQ.Value);
                        int selectedOptionID = Convert.ToInt32(rbl.SelectedValue);

                        SqlCommand cmdInsert = new SqlCommand(
                            "INSERT INTO SurveyResponses (SurveyID, QuestionID, UserID, OptionID) VALUES (@SurveyID, @QuestionID, @UserID, @OptionID)", conn);
                        cmdInsert.Parameters.AddWithValue("@SurveyID", surveyID);
                        cmdInsert.Parameters.AddWithValue("@QuestionID", questionID);
                        cmdInsert.Parameters.AddWithValue("@UserID", userID);
                        cmdInsert.Parameters.AddWithValue("@OptionID", selectedOptionID);
                        cmdInsert.ExecuteNonQuery();
                    }
                }

                lblMessage.ForeColor = System.Drawing.Color.Green;
                lblMessage.Text = "Your responses have been submitted successfully!";
                pnlSurvey.Visible = false;
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error submitting responses: " + ex.Message;
            }
            finally
            {
                if (conn.State == ConnectionState.Open) conn.Close();
            }
        }
    }
}
