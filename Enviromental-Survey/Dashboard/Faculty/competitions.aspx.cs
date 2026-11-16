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
    public partial class competitions : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["dbConn"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && Session["UserID"] != null)
            {
                LoadTopbarName(Convert.ToInt32(Session["UserID"]));
                LoadCompetitions();
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
    


private void LoadCompetitions()
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = @"
                    SELECT CompetitionID, Title, Description, CompetitionDate
                    FROM Competitions
                    ORDER BY CompetitionDate DESC";

                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);

                // Clear existing table rows
                competitionsTableBody.Controls.Clear();

                int count = 1;
                foreach (DataRow row in dt.Rows)
                {
                    TableRow tr = new TableRow();

                    tr.Cells.Add(new TableCell { Text = count.ToString() });
                    tr.Cells.Add(new TableCell { Text = row["Title"].ToString() });
                    tr.Cells.Add(new TableCell { Text = row["Description"].ToString() });
                    tr.Cells.Add(new TableCell { Text = Convert.ToDateTime(row["CompetitionDate"]).ToString("yyyy-MM-dd") });

                    TableCell actionCell = new TableCell();
                    HyperLink participate = new HyperLink
                    {
                        Text = "Participate",
                        CssClass = "btn btn-success btn-sm",
                        NavigateUrl = "effective-participation.aspx?CompetitionID=" + row["CompetitionID"]
                    };
                    actionCell.Controls.Add(participate);
                    tr.Cells.Add(actionCell);

                    competitionsTableBody.Controls.Add(tr);
                    count++;
                }
            }
        }
    }
}
