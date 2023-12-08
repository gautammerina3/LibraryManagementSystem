using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_library_Management_System
{
    public partial class adminusermanagement : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        protected void Button_Go_Click(object sender, EventArgs e)
        {
            getMemberDetailsByID();
        }

        protected void Button_Active_Click(object sender, EventArgs e)
        {
            updateAccountStatusByID("active");
        }
        protected void Button_Pending_Click(object sender, EventArgs e)
        {
            updateAccountStatusByID("pending");
        }

        protected void Button_Deactive_Click(object sender, EventArgs e)
        {
            updateAccountStatusByID("deactive");
        }


        void getMemberDetailsByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from tbl_member_details" +
                    " where member_id='" + TextBox1.Text.Trim() + "';", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        TextBox3.Text = dr.GetValue(0).ToString();
                        TextBox2.Text = dr.GetValue(10).ToString();
                        TextBox4.Text = dr.GetValue(1).ToString();
                        TextBox5.Text = dr.GetValue(2).ToString();
                        TextBox6.Text = dr.GetValue(3).ToString();
                        TextBox8.Text = dr.GetValue(7).ToString();
                        TextBox7.Text = dr.GetValue(5).ToString();
                        TextBox9.Text = dr.GetValue(6).ToString();
                        TextBox10.Text = dr.GetValue(4).ToString();
                    }
                }
                else
                {
                    Response.Write("<script>alert('Invalid member ID!');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }

        }

        void updateAccountStatusByID(string status)
        {
            if (checkIfMemberExists())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == System.Data.ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("UPDATE tbl_member_details SET account_status='" + status + "'" +
                        " where member_id='" + TextBox1.Text.Trim() + "';", con);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    GridView1.DataBind();
                    Response.Write("<script>alert('Member's status updated!');</script>");

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");

                }
            }
            else
            {
                Response.Write("<script>alert('Invalid Member id!');</script>");
            }
        }

        void deleteMemberByID()
        {
            if(checkIfMemberExists())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == System.Data.ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("DELETE FROM tbl_member_details " +
                        "where member_id = '" + TextBox1.Text.Trim() + "'", con);

                    cmd.ExecuteNonQuery();
                    con.Close();


                    Response.Write("<script>alert('Member details deleted successfully!');</script>");
                    clearForm();
                    GridView1.DataBind();
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Member id is required!');</script>");
            }
        }

        void clearForm()
        {
            TextBox1.Text = "";
            TextBox3.Text = "";
            TextBox2.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
            TextBox6.Text = "";
            TextBox8.Text = "";
            TextBox7.Text = "";
            TextBox9.Text = "";
            TextBox10.Text = "";
        }

        protected void Button_Delete_Click(object sender, EventArgs e)
        {
            deleteMemberByID();
        }


        bool checkIfMemberExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from tbl_member_details" +
                    " where member_id='" + TextBox1.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }


        }
    }
}