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
    public partial class support : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["dbConn"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && Session["UserID"] != null)
            {
                LoadTopbarName(Convert.ToInt32(Session["UserID"]));
                BindSupportInfo();
                BindFAQs();
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
    


        private void BindSupportInfo()
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = "SELECT * FROM SupportInfo";
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                rptSupportInfo.DataSource = dt;
                rptSupportInfo.DataBind();
            }
        }

        private void BindFAQs()
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = "SELECT * FROM FAQs ORDER BY FAQID ASC";
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                rptFAQs.DataSource = dt;
                rptFAQs.DataBind();
            }
        }
    }
}