using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace Enviromental_Survey.Account
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbConn"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string name = txtName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();
            string role = Request.Form["role"]; // JS dropdown

            if (string.IsNullOrEmpty(name) || string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password) || string.IsNullOrEmpty(role))
            {
                Response.Write("<script>alert('Please fill all required fields.');</script>");
                return;
            }

            string rollNo = null, className = null, specification = null, section = null, admissionDate = null;
            string empNo = null, dept = null, qualification = null, joiningDate = null;

            if (role == "Student")
            {
                rollNo = txtRollNo.Text;
                className = txtClass.Text;
                specification = txtSpec.Text;
                section = txtSection.Text;
                admissionDate = txtAdmissionDate.Text;
            }
            else if (role == "Faculty")
            {
                empNo = txtEmpNo.Text;
                dept = txtDept.Text;
                qualification = txtQualification.Text;
                joiningDate = txtJoiningDate.Text;
            }

            try
            {
                string query = @"INSERT INTO Users 
                        (Name, Email, Password, Role, RollNo, Class, Specification, Section, AdmissionDate, EmployeeNo, Department, Qualification, JoiningDate) 
                        VALUES 
                        (@Name,@Email,@Password,@Role,@RollNo,@Class,@Specification,@Section,@AdmissionDate,@EmployeeNo,@Department,@Qualification,@JoiningDate)";

                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbConn"].ConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@Name", name);
                        cmd.Parameters.AddWithValue("@Email", email);
                        cmd.Parameters.AddWithValue("@Password", password);
                        cmd.Parameters.AddWithValue("@Role", role);
                        cmd.Parameters.AddWithValue("@RollNo", (object)rollNo ?? DBNull.Value);
                        cmd.Parameters.AddWithValue("@Class", (object)className ?? DBNull.Value);
                        cmd.Parameters.AddWithValue("@Specification", (object)specification ?? DBNull.Value);
                        cmd.Parameters.AddWithValue("@Section", (object)section ?? DBNull.Value);
                        cmd.Parameters.AddWithValue("@AdmissionDate", string.IsNullOrEmpty(admissionDate) ? (object)DBNull.Value : admissionDate);
                        cmd.Parameters.AddWithValue("@EmployeeNo", (object)empNo ?? DBNull.Value);
                        cmd.Parameters.AddWithValue("@Department", (object)dept ?? DBNull.Value);
                        cmd.Parameters.AddWithValue("@Qualification", (object)qualification ?? DBNull.Value);
                        cmd.Parameters.AddWithValue("@JoiningDate", string.IsNullOrEmpty(joiningDate) ? (object)DBNull.Value : joiningDate);

                        conn.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                Response.Write("<script>alert('Registration successful! Waiting for admin approval.'); window.location='login.aspx';</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }
    }
}