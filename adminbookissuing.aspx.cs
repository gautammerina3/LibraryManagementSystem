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
    public partial class adminbookissuing : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
          
        }

        protected void Button_Go_Click(object sender, EventArgs e)
        {
            getNames();
        }

        void getNames()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select book_name from tbl_book_details" +
                    " where book_id='" + TextBox3.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    TextBox4.Text = dt.Rows[0]["book_name"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Invalid Book ID.');</script>");
                }

                cmd = new SqlCommand("select full_name from tbl_member_details" +
                    " where member_id='" + TextBox1.Text.Trim() + "';", con);
                da = new SqlDataAdapter(cmd);
                dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    TextBox2.Text = dt.Rows[0]["full_name"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Invalid Member ID.');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }

        protected void Button_Issue_Click(object sender, EventArgs e)
        {
            if(checkIfBookExists() && checkIfMemberExists())
            {
                if(checkIfIssueEntryExists())
                {
                    Response.Write("<script>alert('This member already has this book. Try a different book.');</script>");
                }
                else
                {
                    issueBook();
                }
               
            }
            else
            {
                Response.Write("<script>alert('Invalid Book ID or Member ID.');</script>");
            }
        }

        void issueBook()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("insert into tbl_book_issue(member_id, member_name, book_id, book_name, issue_date, due_date)" +
                    " values" +
                    " (@member_id, @member_name, @book_id, @book_name, @issue_date, @due_date)", con);
                cmd.Parameters.AddWithValue("@member_id", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@member_name", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@book_id", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@book_name", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@issue_date", TextBox5.Text.Trim());
                cmd.Parameters.AddWithValue("@due_date", TextBox6.Text.Trim());
                cmd.ExecuteNonQuery();

                cmd = new SqlCommand("UPDATE tbl_book_details SET current_stock = current_stock - 1" +
                    " WHERE book_id = '" + TextBox3.Text.Trim() + "'", con);
                cmd.ExecuteNonQuery();

                con.Close();
                Response.Write("<script>alert('Book issued successfully!');</script>");
                
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        bool checkIfBookExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from tbl_book_details" +
                    " where book_id='" + TextBox3.Text.Trim() + "' AND current_stock > 0;", con);
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
            catch
            {
                return false;
            }
            
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
                SqlCommand cmd = new SqlCommand("select full_name from tbl_member_details" +
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
            catch
            {
                return false;
            }

        }

        bool checkIfIssueEntryExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from tbl_book_issue" +
                    " where member_id='" + TextBox1.Text.Trim() + "' AND book_id = '"+ TextBox3.Text.Trim() +"';", con);
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
            catch
            {
                return false;
            }

        }

        protected void Button_Return_Click(object sender, EventArgs e)
        {
            if (checkIfBookExists() && checkIfMemberExists())
            {
                if (checkIfIssueEntryExists())
                {
                    returnBook();
                }
                else
                {
                    Response.Write("<script>alert('Entry does not exist.');</script>");
                }

            }
            else
            {
                Response.Write("<script>alert('Invalid Book ID or Member ID.');</script>");
            }
        }

        void returnBook()
        {

            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("DELETE FROM tbl_book_issue " +
                    "where book_id = '" + TextBox3.Text.Trim() + "' and member_id = '"+ TextBox1.Text.Trim()  + "';", con);
                
                int result = cmd.ExecuteNonQuery();
              

                if (result > 0)
                {
                    
                    cmd = new SqlCommand("UPDATE tbl_book_details SET current_stock = current_stock + 1" +
                    " WHERE book_id = '" + TextBox3.Text.Trim() + "'", con);
                    cmd.ExecuteNonQuery();

                    con.Close();
                    Response.Write("<script>alert('Book returned successfully!');</script>");

                    GridView1.DataBind();
                }
                
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if(e.Row.RowType == DataControlRowType.DataRow)
                {
                    DateTime dt = Convert.ToDateTime(e.Row.Cells[5].Text);
                    DateTime today = DateTime.Today;
                    if(today > dt)
                    {
                        e.Row.BackColor = System.Drawing.Color.PaleVioletRed;
                    }
                }
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}