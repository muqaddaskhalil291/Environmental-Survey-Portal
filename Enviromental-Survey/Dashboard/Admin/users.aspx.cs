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
    public partial class users : System.Web.UI.Page
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
                LoadUsers();
            }
        }

        private void LoadUsers()
        {
            try
            {
                string query = @"
                    SELECT UserID, Name, Role, RollNo, Class, Section, EmployeeNo, Department, Qualification, AdmissionDate, JoiningDate
                    FROM Users
                    ORDER BY CreatedAt DESC";

                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);

                UsersRepeater.DataSource = dt;
                UsersRepeater.DataBind();
            }
            catch (Exception ex)
            {
                // Optionally log error
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            int userId = Convert.ToInt32((sender as Button).CommandArgument);

            try
            {
                string query = "DELETE FROM Users WHERE UserID=@UserID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@UserID", userId);

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();

                LoadUsers(); // Refresh table after deletion
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

        }
    }
}