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
    public partial class surveys : System.Web.UI.Page
       {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbConn"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminID"] == null)
            {
                Response.Redirect("adminlogin.aspx");
            }

            if (!IsPostBack)
            {
                LoadSurveys();
            }
        }

        private void LoadSurveys()
        {
            SqlCommand cmd = new SqlCommand(@"
    SELECT s.SurveyID, s.Title, s.Description, s.TargetRole, s.CreatedDate,
           STUFF((
               SELECT CHAR(13)+CHAR(10) + 'Question: ' + q.QuestionText +
                      CHAR(13)+CHAR(10) + 
                      STUFF((
                          SELECT CHAR(13)+CHAR(10) + 
                                 CAST(ROW_NUMBER() OVER (PARTITION BY o.QuestionID ORDER BY o.OptionID) AS NVARCHAR(10)) + '. ' + o.OptionText
                          FROM SurveyOptions o
                          WHERE o.QuestionID = q.QuestionID
                          FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 2, '')
               FROM SurveyQuestions q
               WHERE q.SurveyID = s.SurveyID
               FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 2, '') AS Questions
    FROM Surveys s
    ORDER BY s.CreatedDate DESC", conn);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            gvSurveys.DataSource = dt;
            gvSurveys.DataBind();
        }


        protected void btnAddUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                string title = surveyTitle.Text.Trim();
                string desc = surveyDescription.Text.Trim();
                string targetRole = targetUsers.SelectedValue;

                string question = surveyQuestion.Text.Trim();
                string opt1 = option1.Text.Trim();
                string opt2 = option2.Text.Trim();
                string opt3 = option3.Text.Trim();
                string opt4 = option4.Text.Trim();

                if (string.IsNullOrEmpty(title))
                {
                    lblMessage.Text = "Please enter a survey title.";
                    return;
                }
                if (string.IsNullOrEmpty(question) || string.IsNullOrEmpty(opt1) ||
                    string.IsNullOrEmpty(opt2) || string.IsNullOrEmpty(opt3) || string.IsNullOrEmpty(opt4))
                {
                    lblMessage.Text = "Please enter a question and all 4 options.";
                    return;
                }

                if (conn.State == ConnectionState.Closed) conn.Open();
                int surveyID = 0;
                int questionID = 0;

                if (!string.IsNullOrEmpty(hfSurveyID.Value)) // Update
                {
                    SqlCommand cmd = new SqlCommand("UPDATE Surveys SET Title=@Title, Description=@Description, TargetRole=@TargetRole WHERE SurveyID=@SurveyID", conn);
                    cmd.Parameters.AddWithValue("@SurveyID", Convert.ToInt32(hfSurveyID.Value));
                    cmd.Parameters.AddWithValue("@Title", title);
                    cmd.Parameters.AddWithValue("@Description", desc);
                    cmd.Parameters.AddWithValue("@TargetRole", targetRole);
                    cmd.ExecuteNonQuery();

                    surveyID = Convert.ToInt32(hfSurveyID.Value);

                    // Replace old question
                    SqlCommand qCmd = new SqlCommand("DELETE FROM SurveyQuestions WHERE SurveyID=@SurveyID; INSERT INTO SurveyQuestions (SurveyID, QuestionText) OUTPUT INSERTED.QuestionID VALUES (@SurveyID, @QuestionText)", conn);
                    qCmd.Parameters.AddWithValue("@SurveyID", surveyID);
                    qCmd.Parameters.AddWithValue("@QuestionText", question);
                    questionID = (int)qCmd.ExecuteScalar();

                    // Delete old options
                    SqlCommand delOpt = new SqlCommand("DELETE FROM SurveyOptions WHERE QuestionID=@QuestionID", conn);
                    delOpt.Parameters.AddWithValue("@QuestionID", questionID);
                    delOpt.ExecuteNonQuery();

                    // Insert new options
                    string[] options = { opt1, opt2, opt3, opt4 };
                    foreach (string opt in options)
                    {
                        SqlCommand oCmd = new SqlCommand("INSERT INTO SurveyOptions (QuestionID, OptionText) VALUES (@QuestionID, @OptionText)", conn);
                        oCmd.Parameters.AddWithValue("@QuestionID", questionID);
                        oCmd.Parameters.AddWithValue("@OptionText", opt);
                        oCmd.ExecuteNonQuery();
                    }

                    lblMessage.ForeColor = System.Drawing.Color.Green;
                    lblMessage.Text = "Survey updated successfully!";
                    LoadSurveys();   
                    ClearForm();

                }
                else // Insert new
                {
                    SqlCommand cmd = new SqlCommand(
                        "INSERT INTO Surveys (Title, Description, TargetRole) OUTPUT INSERTED.SurveyID VALUES (@Title, @Description, @TargetRole)", conn);
                    cmd.Parameters.AddWithValue("@Title", title);
                    cmd.Parameters.AddWithValue("@Description", desc);
                    cmd.Parameters.AddWithValue("@TargetRole", targetRole);

                    surveyID = (int)cmd.ExecuteScalar();

                    SqlCommand qCmd = new SqlCommand(
                        "INSERT INTO SurveyQuestions (SurveyID, QuestionText) OUTPUT INSERTED.QuestionID VALUES (@SurveyID, @QuestionText)", conn);
                    qCmd.Parameters.AddWithValue("@SurveyID", surveyID);
                    qCmd.Parameters.AddWithValue("@QuestionText", question);

                    questionID = (int)qCmd.ExecuteScalar();

                    // Insert 4 options
                    string[] options = { opt1, opt2, opt3, opt4 };
                    foreach (string opt in options)
                    {
                        SqlCommand oCmd = new SqlCommand("INSERT INTO SurveyOptions (QuestionID, OptionText) VALUES (@QuestionID, @OptionText)", conn);
                        oCmd.Parameters.AddWithValue("@QuestionID", questionID);
                        oCmd.Parameters.AddWithValue("@OptionText", opt);
                        oCmd.ExecuteNonQuery();
                    }

                    lblMessage.ForeColor = System.Drawing.Color.Green;
                    lblMessage.Text = "Survey, question and options added successfully!";
                    LoadSurveys();
                    ClearForm();     

                }
            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Error: " + ex.Message;
            }
            finally
            {
                if (conn.State == ConnectionState.Open) conn.Close();
            }
        }

        protected void gvSurveys_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int surveyID = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "EditSurvey")
            {
                // Load Survey
                SqlCommand cmd = new SqlCommand("SELECT * FROM Surveys WHERE SurveyID=@SurveyID", conn);
                cmd.Parameters.AddWithValue("@SurveyID", surveyID);
                if (conn.State == ConnectionState.Closed) conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    surveyTitle.Text = reader["Title"].ToString();
                    surveyDescription.Text = reader["Description"].ToString();
                    targetUsers.SelectedValue = reader["TargetRole"].ToString();
                    hfSurveyID.Value = surveyID.ToString();
                    btnAddUpdate.Text = "Update Survey";
                }
                conn.Close();

                // Load Question
                int qid = 0;
                SqlCommand qCmd = new SqlCommand("SELECT TOP 1 QuestionID, QuestionText FROM SurveyQuestions WHERE SurveyID=@SurveyID", conn);
                qCmd.Parameters.AddWithValue("@SurveyID", surveyID);
                if (conn.State == ConnectionState.Closed) conn.Open();
                SqlDataReader qReader = qCmd.ExecuteReader();
                if (qReader.Read())
                {
                    surveyQuestion.Text = qReader["QuestionText"].ToString();
                    qid = Convert.ToInt32(qReader["QuestionID"]);
                }
                conn.Close();

                // Load Options
                if (qid > 0)
                {
                    SqlCommand optCmd = new SqlCommand("SELECT OptionText FROM SurveyOptions WHERE QuestionID=@QuestionID", conn);
                    optCmd.Parameters.AddWithValue("@QuestionID", qid);
                    if (conn.State == ConnectionState.Closed) conn.Open();
                    SqlDataReader optReader = optCmd.ExecuteReader();
                    int i = 1;
                    while (optReader.Read())
                    {
                        if (i == 1) option1.Text = optReader["OptionText"].ToString();
                        if (i == 2) option2.Text = optReader["OptionText"].ToString();
                        if (i == 3) option3.Text = optReader["OptionText"].ToString();
                        if (i == 4) option4.Text = optReader["OptionText"].ToString();
                        i++;
                    }
                    conn.Close();
                }
            }
            else if (e.CommandName == "DeleteSurvey")
            {
                
                SqlCommand delQ = new SqlCommand(
                    @"DELETE FROM SurveyOptions WHERE QuestionID IN (SELECT QuestionID FROM SurveyQuestions WHERE SurveyID=@SurveyID);
              DELETE FROM SurveyQuestions WHERE SurveyID=@SurveyID;
              DELETE FROM Surveys WHERE SurveyID=@SurveyID;", conn);
                delQ.Parameters.AddWithValue("@SurveyID", surveyID);

                if (conn.State == ConnectionState.Closed) conn.Open();
                delQ.ExecuteNonQuery();
                conn.Close();

                lblMessage.ForeColor = System.Drawing.Color.Green;
                lblMessage.Text = "Survey deleted successfully!";
                LoadSurveys();
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            ClearForm();
        }

        private void ClearForm()
        {
            surveyTitle.Text = "";
            surveyDescription.Text = "";
            targetUsers.SelectedIndex = 0;
            surveyQuestion.Text = "";
            option1.Text = "";
            option2.Text = "";
            option3.Text = "";
            option4.Text = "";
            hfSurveyID.Value = "";
            btnAddUpdate.Text = "Add Survey";
            lblMessage.Text = "";
        }
    }
}