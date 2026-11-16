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
    public partial class faqs : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["dbConn"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindFAQs();
            }
        }

        protected void btnAddFAQ_Click(object sender, EventArgs e)
        {
            string question = txtQuestion.Text.Trim();
            string answer = txtAnswer.Text.Trim();

            if (!string.IsNullOrEmpty(question) && !string.IsNullOrEmpty(answer))
            {
                using (SqlConnection con = new SqlConnection(connStr))
                {
                    string query = "INSERT INTO FAQs (Question, Answer) VALUES (@Question, @Answer)";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@Question", question);
                    cmd.Parameters.AddWithValue("@Answer", answer);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }

                txtQuestion.Text = "";
                txtAnswer.Text = "";
                lblMessage.Text = "FAQ added successfully!";
                BindFAQs();
            }
            else
            {
                lblMessage.Text = "Please fill both Question and Answer!";
            }
        }

        private void BindFAQs()
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = "SELECT * FROM FAQs ORDER BY FAQID DESC";
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                rptFAQs.DataSource = dt;
                rptFAQs.DataBind();
            }
        }

        protected void rptFAQs_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int faqID = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "DeleteFAQ")
            {
                using (SqlConnection con = new SqlConnection(connStr))
                {
                    string query = "DELETE FROM FAQs WHERE FAQID=@FAQID";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@FAQID", faqID);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
                BindFAQs();
            }
            else if (e.CommandName == "EditFAQ")
            {
                foreach (RepeaterItem item in rptFAQs.Items)
                {
                    var lblQ = (Label)item.FindControl("lblQuestion");
                    var lblA = (Label)item.FindControl("lblAnswer");
                    var txtQ = (TextBox)item.FindControl("txtEditQuestion");
                    var txtA = (TextBox)item.FindControl("txtEditAnswer");
                    var btnUpdate = (Button)item.FindControl("btnUpdate");
                    var btnCancel = (Button)item.FindControl("btnCancel");
                    var btnEdit = (Button)item.FindControl("btnEdit");

                    if (faqID == Convert.ToInt32(e.CommandArgument))
                    {
                        lblQ.Visible = lblA.Visible = false;
                        txtQ.Visible = txtA.Visible = true;
                        btnUpdate.Visible = btnCancel.Visible = true;
                        btnEdit.Visible = false;
                    }
                    else
                    {
                        lblQ.Visible = lblA.Visible = true;
                        txtQ.Visible = txtA.Visible = false;
                        btnUpdate.Visible = btnCancel.Visible = false;
                        btnEdit.Visible = true;
                    }
                }
            }
            else if (e.CommandName == "UpdateFAQ")
            {
                RepeaterItem item = e.Item;
                string question = ((TextBox)item.FindControl("txtEditQuestion")).Text.Trim();
                string answer = ((TextBox)item.FindControl("txtEditAnswer")).Text.Trim();

                using (SqlConnection con = new SqlConnection(connStr))
                {
                    string query = "UPDATE FAQs SET Question=@Question, Answer=@Answer WHERE FAQID=@FAQID";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@Question", question);
                    cmd.Parameters.AddWithValue("@Answer", answer);
                    cmd.Parameters.AddWithValue("@FAQID", faqID);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
                BindFAQs();
            }
            else if (e.CommandName == "CancelEdit")
            {
                BindFAQs();
            }
        }
    }
}