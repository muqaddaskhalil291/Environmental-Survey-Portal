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
    public partial class support : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["dbConn"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        private void BindGrid()
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM SupportInfo ORDER BY SupportID", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvSupport.DataSource = dt;
                gvSupport.DataBind();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;

                if (string.IsNullOrEmpty(hfSupportID.Value))
                {
                    cmd.CommandText = "INSERT INTO SupportInfo (ContactPerson, Email, Phone, Description) VALUES (@ContactPerson, @Email, @Phone, @Description)";
                }
                else
                {
                    cmd.CommandText = "UPDATE SupportInfo SET ContactPerson=@ContactPerson, Email=@Email, Phone=@Phone, Description=@Description WHERE SupportID=@SupportID";
                    cmd.Parameters.AddWithValue("@SupportID", hfSupportID.Value);
                }

                cmd.Parameters.AddWithValue("@ContactPerson", txtContactPerson.Text.Trim());
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@Phone", txtPhone.Text.Trim());
                cmd.Parameters.AddWithValue("@Description", txtDescription.Text.Trim());

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            ClearForm();
            BindGrid();
        }

        private void ClearForm()
        {
            txtContactPerson.Text = "";
            txtEmail.Text = "";
            txtPhone.Text = "";
            txtDescription.Text = "";
            hfSupportID.Value = "";
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            int supportID = Convert.ToInt32(btn.CommandArgument);

            using (SqlConnection con = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM SupportInfo WHERE SupportID=@SupportID", con);
                cmd.Parameters.AddWithValue("@SupportID", supportID);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    hfSupportID.Value = dr["SupportID"].ToString();
                    txtContactPerson.Text = dr["ContactPerson"].ToString();
                    txtEmail.Text = dr["Email"].ToString();
                    txtPhone.Text = dr["Phone"].ToString();
                    txtDescription.Text = dr["Description"].ToString();
                }
                con.Close();
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            int supportID = Convert.ToInt32(btn.CommandArgument);

            using (SqlConnection con = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("DELETE FROM SupportInfo WHERE SupportID=@SupportID", con);
                cmd.Parameters.AddWithValue("@SupportID", supportID);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            BindGrid();
        }
    }
}
