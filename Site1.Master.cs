using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_library_Management_System
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //try
            //{
            //    if (Session["role"] != null)
            //    {
            //        if (Session["role"].ToString() == "")
            //        {
            //            LinkButton2.Visible = true; //user login link button
            //            LinkButton3.Visible = true; //user sign up link button
            //            LinkButton4.Visible = false; //log out link button
            //            LinkButton5.Visible = false; //hello user link button

            //            adminLoginButton.Visible = true; //admin login link button
            //            authorManagementButton.Visible = false; //admin login link button
            //            publisherManagementButton.Visible = false; //admin login link button
            //            bookInventoryButton.Visible = false; //admin login link button
            //            bookIssuingButton.Visible = false; //admin login link button
            //            memberManagement.Visible = false; //admin login link button
            //        }
            //    }


            //    else if (Session["role"].ToString() == "user")
            //    {
            //        LinkButton2.Visible = false; //user login link button
            //        LinkButton3.Visible = false; //user sign up link button
            //        LinkButton4.Visible = true; //log out link button

            //        LinkButton5.Visible = true;
            //        LinkButton5.Visible = "Hello " + Session["username"].ToString(); //hello user link button

            //        adminLoginButton.Visible = true; //admin login link button
            //        authorManagementButton.Visible = false; //admin login link button
            //        publisherManagementButton.Visible = false; //admin login link button
            //        bookInventoryButton.Visible = false; //admin login link button
            //        bookIssuingButton.Visible = false; //admin login link button
            //        memberManagement.Visible = false; //admin login link button
            //    }
            //    else if (Session["role"].ToString() == "admin")
            //    {
            //        LinkButton2.Visible = false; //user login link button
            //        LinkButton3.Visible = false; //user sign up link button
            //        LinkButton4.Visible = true; //log out link button
            //        LinkButton5.Visible = true; //hello user link button
            //        LinkButton5.Visible = "Hello Admin";
            //        adminLoginButton.Visible = false;//admin login link button
            //        authorManagementButton.Visible = true; //admin login link button
            //        publisherManagementButton.Visible = true; //admin login link button
            //        bookInventoryButton.Visible = true; //admin login link button
            //        bookIssuingButton.Visible = true; //admin login link button
            //        memberManagement.Visible = true; //admin login link button
            //    }
            //}
            //catch (Exception ex)
            //{
            //    Response.Write("<script>alert('" + ex.Message + "');</script>");
            //}
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {

        }

        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            LinkButton2.Visible = false; //user login link button
            LinkButton3.Visible = false; //user sign up link button
            LinkButton4.Visible = true; //log out link button
            LinkButton5.Visible = true; //hello user link button
            LinkButton5.Text = "Hello Admin";
            adminLoginButton.Visible = false;//admin login link button
            authorManagementButton.Visible = true; //admin login link button
            publisherManagementButton.Visible = true; //admin login link button
            bookInventoryButton.Visible = true; //admin login link button
            bookIssuingButton.Visible = true; //admin login link button
            memberManagement.Visible = true; //admin login link button
            Response.Redirect("adminlogin.aspx");
           
        }

        protected void LinkButton11_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminauthormanagement.aspx");
        }

        protected void LinkButton12_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminpublishermanagement.aspx");
        }

        protected void LinkButton8_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminbookinventory.aspx");
        }

        protected void LinkButton9_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminbookissuing.aspx");
        }

        protected void LinkButton10_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminusermanagement.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("viewbooks.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("userlogin.aspx");
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Response.Redirect("usersignup.aspx");
        }

        protected void Logout_Button_Click(object sender, EventArgs e)
        {
            Session["username"] = "";
            Session["fullname"] = "";
            Session["role"] = "";
            Session["status"] = "";
            LinkButton2.Visible = true; //user login link button
            LinkButton3.Visible = true; //user sign up link button
            LinkButton4.Visible = false; //log out link button
            LinkButton5.Visible = false; //hello user link button

            adminLoginButton.Visible = true; //admin login link button
            authorManagementButton.Visible = false; //admin login link button
            publisherManagementButton.Visible = false; //admin login link button
            bookInventoryButton.Visible = false; //admin login link button
            bookIssuingButton.Visible = false; //admin login link button
            memberManagement.Visible = false; //admin login link buttons
        }
    }
}