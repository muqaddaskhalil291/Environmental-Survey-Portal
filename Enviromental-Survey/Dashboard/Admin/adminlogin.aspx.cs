using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Enviromental_Survey.Dashboard.Admin
{
    public partial class adminlogin : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbConn"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void adminlogin_Click(object sender, EventArgs e)
        {
            try
            {
                string email = Request.Form["txtEmail"];
                string password = Request.Form["txtPassword"];

                string query = "SELECT AdminID, Email FROM Admins WHERE Email=@Email AND PasswordHash=@Password";


                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Password", password); // ⚠️ Later: Hash password

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    // Save session
                    int adminId = Convert.ToInt32(reader["AdminID"]);
                    Session["AdminID"] = adminId.ToString();
                    Session["Email"] = reader["Email"].ToString();

                    conn.Close();

                    // 🔹 Update LastLogin timestamp
                    using (SqlConnection updateConn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbConn"].ConnectionString))
                    {
                        string updateQuery = "UPDATE Admins SET LastLogin = @LastLogin WHERE AdminID = @AdminID";
                        SqlCommand updateCmd = new SqlCommand(updateQuery, updateConn);
                        updateCmd.Parameters.AddWithValue("@LastLogin", DateTime.Now);
                        updateCmd.Parameters.AddWithValue("@AdminID", adminId);

                        updateConn.Open();
                        updateCmd.ExecuteNonQuery();
                        updateConn.Close();
                    }

                    // Redirect to dashboard
                    Response.Redirect("index.aspx");
                }
                else
                {
                    lblMessage.Text = "Invalid email or password.";
                }

                conn.Close();
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
            }
        }
    }
}