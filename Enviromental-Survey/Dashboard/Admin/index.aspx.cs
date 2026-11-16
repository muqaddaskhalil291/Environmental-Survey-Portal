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
    public partial class index : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbConn"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminID"] == null)
                Response.Redirect("adminlogin.aspx");

            if (!IsPostBack)
            {
                LoadCounts();
                LoadRecentRegistrations();
            }
        }

        private void LoadCounts()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbConn"].ConnectionString))
            {
                string query = @"
                    SELECT 
                        (SELECT COUNT(*) FROM Users) AS TotalUsers,
                        (SELECT COUNT(*) FROM Surveys) AS TotalSurveys,
                        (SELECT COUNT(*) FROM Competitions) AS TotalCompetitions,
                        (SELECT COUNT(*) FROM FAQs) AS TotalFaqs";

                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    lblTotalUsers.Text = reader["TotalUsers"].ToString();
                    lblTotalSurveys.Text = reader["TotalSurveys"].ToString();
                    lblTotalCompetitions.Text = reader["TotalCompetitions"].ToString();
                    lblTotalFaqs.Text = reader["TotalFaqs"].ToString();
                }

                reader.Close();
            }
        }
        private void LoadRecentRegistrations()
        {
            try
            {
                string query = @"
                    SELECT TOP 5 Name, Role, 
                           ISNULL(RollNo, EmployeeNo) AS RollOrEmp,
                           ISNULL(Class, Department) AS ClassOrDept,
                           ISNULL(Section, Qualification) AS SectionOrQual,
                           ISNULL(AdmissionDate, JoiningDate) AS Date,
                           Status
                    FROM Users
                    ORDER BY CreatedAt DESC";

                SqlDataAdapter sda = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                gvRecentRegistrations.DataSource = dt;
                gvRecentRegistrations.DataBind();
            }
            catch { }
        }
    }
}