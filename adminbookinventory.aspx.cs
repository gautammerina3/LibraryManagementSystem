using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_library_Management_System
{
    public partial class adminbookinventory : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            getAuthorPublisherValues();
            GridView1.DataBind();
        }

        protected void Button_Go_Click(object sender, EventArgs e)
        {
            getBookDetailsByID();
        }

        void getBookDetailsByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from tbl_book_details where book_id = '" + TextBox1.Text.Trim()+ "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    TextBox3.Text = dt.Rows[0]["book_name"].ToString();
                    TextBox2.Text = dt.Rows[0]["published_date"].ToString();

                    TextBox5.Text = dt.Rows[0]["edition"].ToString().Trim();
                    TextBox6.Text = dt.Rows[0]["book_cost"].ToString().Trim();
                    TextBox4.Text = dt.Rows[0]["pages"].ToString().Trim();
                    TextBox7.Text = dt.Rows[0]["actual_stock"].ToString().Trim();
                    TextBox8.Text = dt.Rows[0]["current_stock"].ToString().Trim();
                    TextBox9.Text = "" + (Convert.ToInt32(dt.Rows[0]["actual_stock"].ToString()) -
                        Convert.ToInt32(dt.Rows[0]["cuurent_stock"].ToString()));

                    TextBox10.Text = dt.Rows[0]["book_description"].ToString();
                    DropDownList1.SelectedValue = dt.Rows[0]["language"].ToString().Trim();
                    DropDownList2.SelectedValue = dt.Rows[0]["publisher_name"].ToString().Trim();
                    DropDownList3.SelectedValue = dt.Rows[0]["author_name"].ToString().Trim();
                    ListBox1.ClearSelection();
                    string[] genre = dt.Rows[0]["genre"].ToString().Trim().Split(',');
                    for(int i = 0; i < genre.Length; i++)
                    {
                        for (int j = 0; j < ListBox1.Items.Count; j++)
                        {
                            if(ListBox1.Items[j].ToString() == genre[i])
                            {
                                ListBox1.Items[j].Selected = true;
                            }
                            
                        }
                        
                    }
                }
                else
                {
                    Response.Write("<script>alert('Invalid book id.');</script>");
                }


            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void Button_Add_Click(object sender, EventArgs e)
        {
            if(checkIfBookExists())
            {
                Response.Write("<script>alert('Book already exists. Try some other Book ID.');</script>");
            }
            else
            {
                addNewBook();
            }
        }

        protected void Button_Update_Click(object sender, EventArgs e)
        {

        }

        protected void Button_Delete_Click(object sender, EventArgs e)
        {

        }

        void getAuthorPublisherValues()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select author_name from tbl_author_details;", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                DropDownList3.DataSource = dt;
                DropDownList3.DataValueField = "author_name";
                DropDownList3.DataBind();

                cmd = new SqlCommand("select publisher_name from tbl_publisher_details;", con);
                da = new SqlDataAdapter(cmd);
                dt = new DataTable();
                da.Fill(dt);
                DropDownList2.DataSource = dt;
                DropDownList2.DataValueField = "publisher_name";
                DropDownList2.DataBind();

                
            }
            catch(Exception ex)
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
                    " where book_id='" + TextBox1.Text.Trim() + "' OR book_name = '"+ TextBox3.Text.Trim() + "';", con);
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

        void addNewBook()
        {
            try
            {
                string genres = "";
                foreach(int i in ListBox1.GetSelectedIndices())
                {
                    genres = genres + ListBox1.Items[i] + ",";
                }

                genres = genres.Remove(genres.Length - 1);

                string filepath = "~/book_inventory/books.jpg";
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                FileUpload1.SaveAs(Server.MapPath("book_inventory/" + filename));
                filepath = "~/book_inventory/" + filename;


                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO tbl_book_details(book_id, book_name, genre, author_name, " +
                    "publisher_name, publish_date, language, edition, book_cost, no_of_pages," +
                    "book_description, actual_stock, current_stock, book_img_link) " +
                    "values(@book_id, @book_name, @genre, @author_name, " +
                    "@publisher_name, @publish_date, @language, @edition, " +
                    "@book_cost,@no_of_pages, @book_description, @actual_stock, @current_stock, @book_img_link); ", con);

                cmd.Parameters.AddWithValue("@book_id", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@book_name", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@genre", genres);
                cmd.Parameters.AddWithValue("@author_name", DropDownList3.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@publisher_name", DropDownList2.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@publish_date", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@language", DropDownList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@edition", TextBox5.Text.Trim());
                cmd.Parameters.AddWithValue("@book_cost", TextBox6.Text.Trim());
                cmd.Parameters.AddWithValue("@no_of_pages", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@book_description", TextBox10.Text.Trim());
                cmd.Parameters.AddWithValue("@actual_stock", TextBox5.Text.Trim());
                cmd.Parameters.AddWithValue("@current_stock", TextBox5.Text.Trim());
                cmd.Parameters.AddWithValue("@book_img_link", filepath);

                cmd.ExecuteNonQuery();
                con.Close();

                Response.Write("<script>alert('Book added successfully!');</script>");
                GridView1.DataBind();


            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}