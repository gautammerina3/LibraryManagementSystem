using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_library_Management_System
{
    public partial class usersignup : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //signup button is clicked
        protected void Button1_Click(object sender, EventArgs e)
        {
            if(checkMemberExists())
            {
                Response.Write("<script>alert('Member ID already exists. Try a new member id!');</script>");

            }
            else
            {
                newUserSignUp();
            }
        }
           

        bool checkMemberExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from tbl_member_master" +
                    "where member_id='" + TextBox5.Text.Trim() + "'", con);
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
            }
            return false;

        }

        public string encryptPassword(string password)
        {
            string msg = "";
            byte[] encode = new byte[password.Length];
            encode = Encoding.UTF8.GetBytes(password);
            msg = Convert.ToBase64String(encode);
            return msg;
        }
        void newUserSignUp()
        {
            try
            {

                string strpass = encryptPassword(TextBox9.Text.Trim());
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("insert into tbl_member_master(full_name, dob, contact_no,email,state, city, zipcode, street_address," +
                    "member_id, password, account_status) values (@full_name, @dob, @contact_no, @email, @state, @city, @zipcode, @street_address," +
                    "@member_id, @password, @account_status)", con);
                cmd.Parameters.AddWithValue("@full_name", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@dob", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@contact_no", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@email", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@state", DropDownList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@city", TextBox6.Text.Trim());
                cmd.Parameters.AddWithValue("@zipcode", TextBox7.Text.Trim());
                cmd.Parameters.AddWithValue("@street_address", TextBox8.Text.Trim());
                cmd.Parameters.AddWithValue("@member_id", TextBox5.Text.Trim());
                cmd.Parameters.AddWithValue("@password", strpass);
                cmd.Parameters.AddWithValue("@account_status", "pending");

                cmd.ExecuteNonQuery();
                con.Close();


                Response.Write("<script>alert('Sign Up Successful! You can login now!');</script>");

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }

}