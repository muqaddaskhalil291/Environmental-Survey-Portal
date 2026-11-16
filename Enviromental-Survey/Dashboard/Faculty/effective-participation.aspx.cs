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
    public partial class effective_participation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack && Session["UserID"] != null)
            {
                LoadTopbarName(Convert.ToInt32(Session["UserID"]));
                LoadSubmissions(Convert.ToInt32(Session["UserID"]));

            }
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

        private void LoadSubmissions(int userId)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbConn"].ConnectionString))
            {
                string query = "SELECT SeminarTitle, Location, ParticipantsCount, ConductedDate FROM EffectiveParticipation WHERE UserID=@UserID ORDER BY ConductedDate DESC";
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
            if (Session["UserID"] == null)
            {
                Response.Redirect("~/Account/login.aspx");
                return;
            }

            int userId = Convert.ToInt32(Session["UserID"]);
            string title = txtTitle.Text.Trim();
            string location = txtLocation.Text.Trim();
            int participants = 0;
            DateTime conductedDate;

            if (!int.TryParse(txtParticipants.Text.Trim(), out participants))
            {
                ShowMessage("Please enter a valid number of participants.", "alert-danger");
                return;
            }

            if (!DateTime.TryParse(txtDate.Text.Trim(), out conductedDate))
            {
                ShowMessage("Please select a valid date.", "alert-danger");
                return;
            }

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbConn"].ConnectionString))
            {
                string query = @"INSERT INTO EffectiveParticipation 
                                 (UserID, SeminarTitle, Location, ParticipantsCount, ConductedDate) 
                                 VALUES (@UserID, @Title, @Location, @ParticipantsCount, @ConductedDate)";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@UserID", userId);
                cmd.Parameters.AddWithValue("@Title", title);
                cmd.Parameters.AddWithValue("@Location", location);
                cmd.Parameters.AddWithValue("@ParticipantsCount", participants);
                cmd.Parameters.AddWithValue("@ConductedDate", conductedDate);

                conn.Open();
                cmd.ExecuteNonQuery();
            }

            ShowMessage("Participation submitted successfully!", "alert-success");
            ClearForm();
            LoadSubmissions(userId); // refresh the table
        }

        private void ShowMessage(string message, string cssClass)
        {
            lblMessage.Text = message;
            lblMessage.CssClass = "alert " + cssClass;
            lblMessage.Visible = true;
        }

        private void ClearForm()
        {
            txtTitle.Text = "";
            txtLocation.Text = "";
            txtParticipants.Text = "";
            txtDate.Text = "";
        }
    }
}
