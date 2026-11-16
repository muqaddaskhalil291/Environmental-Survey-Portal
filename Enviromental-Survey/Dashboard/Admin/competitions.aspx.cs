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
    public partial class competitions : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbConn"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCompetitions();
                LoadUsers();
            }
        }

        private void LoadCompetitions()
        {
            try
            {
                string query = @"
                    SELECT c.CompetitionID, c.Title, c.Description, u.Name AS WinnerName, c.CompetitionDate
                    FROM Competitions c
                    LEFT JOIN Users u ON c.WinnerUserID = u.UserID
                    ORDER BY c.CompetitionDate DESC";

                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvCompetitions.DataSource = dt;
                gvCompetitions.DataBind();
            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Error loading competitions: " + ex.Message;
            }
        }

        private void LoadUsers()
        {
            try
            {
                string query = "SELECT UserID, Name FROM Users ORDER BY Name";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);

                ddlWinnerUser.DataSource = dt;
                ddlWinnerUser.DataTextField = "Name";
                ddlWinnerUser.DataValueField = "UserID";
                ddlWinnerUser.DataBind();

                ddlWinnerUser.Items.Insert(0, new ListItem("Select Winner", ""));
            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Error loading users: " + ex.Message;
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                object winnerID = string.IsNullOrEmpty(ddlWinnerUser.SelectedValue)
                                  ? (object)DBNull.Value
                                  : Convert.ToInt32(ddlWinnerUser.SelectedValue);

                DateTime compDate = string.IsNullOrEmpty(txtDate.Text) ? DateTime.Now : DateTime.Parse(txtDate.Text);

                conn.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;

                if (!string.IsNullOrEmpty(hfCompetitionID.Value)) // Update existing
                {
                    cmd.CommandText = @"
                UPDATE Competitions
                SET Title=@Title, Description=@Description, WinnerUserID=@WinnerUserID, CompetitionDate=@CompetitionDate
                WHERE CompetitionID=@CompetitionID";
                    cmd.Parameters.AddWithValue("@CompetitionID", Convert.ToInt32(hfCompetitionID.Value));
                }
                else // Add new
                {
                    cmd.CommandText = @"
                INSERT INTO Competitions (Title, Description, WinnerUserID, CompetitionDate)
                VALUES (@Title, @Description, @WinnerUserID, @CompetitionDate)";
                }

                cmd.Parameters.AddWithValue("@Title", txtTitle.Text.Trim());
                cmd.Parameters.AddWithValue("@Description", txtDescription.Text.Trim());
                cmd.Parameters.AddWithValue("@WinnerUserID", winnerID);
                cmd.Parameters.AddWithValue("@CompetitionDate", compDate);

                cmd.ExecuteNonQuery();
                conn.Close();

                lblMessage.ForeColor = System.Drawing.Color.Green;
                lblMessage.Text = string.IsNullOrEmpty(hfCompetitionID.Value) ? "Competition added successfully!" : "Competition updated successfully!";

                ClearForm();
                LoadCompetitions();
            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Error saving competition: " + ex.Message;
            }
        }

        protected void gvCompetitions_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int compID = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "EditCompetition")
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM Competitions WHERE CompetitionID=@CompetitionID", conn);
                cmd.Parameters.AddWithValue("@CompetitionID", compID);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    hfCompetitionID.Value = reader["CompetitionID"].ToString();
                    txtTitle.Text = reader["Title"].ToString();
                    txtDescription.Text = reader["Description"].ToString();
                    txtDate.Text = Convert.ToDateTime(reader["CompetitionDate"]).ToString("yyyy-MM-dd");
                    ddlWinnerUser.SelectedValue = reader["WinnerUserID"].ToString();
                    btnSave.Text = "Update Competition";
                }
                conn.Close();
            }
            else if (e.CommandName == "DeleteCompetition")
            {
                SqlCommand cmd = new SqlCommand("DELETE FROM Competitions WHERE CompetitionID=@CompetitionID", conn);
                cmd.Parameters.AddWithValue("@CompetitionID", compID);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();

                lblMessage.ForeColor = System.Drawing.Color.Green;
                lblMessage.Text = "Competition deleted successfully!";
                LoadCompetitions();
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            ClearForm();
        }

        private void ClearForm()
        {
            txtTitle.Text = "";
            txtDescription.Text = "";
            txtDate.Text = "";
            ddlWinnerUser.SelectedIndex = 0;
            hfCompetitionID.Value = "";
            btnSave.Text = "Add Competition";
            lblMessage.Text = "";
        }
    }
}
