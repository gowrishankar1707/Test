using System;
using LibraryAutomationSystem.DAL;
using LibraryAutomationSystem.Entity;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sample_web_application
{
    public partial class LoginForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                User user = new User(txtUserName.Text, txtPassword.Text);
                bool myBool =UserRerpositary.LogIn(user.memberName, user.memberPassword);
                if (myBool)
                {
                    Response.Write("Successful");
                }
                else
                {
                    Response.Write("Unsuccessful");
                }
            }



        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void TextBox1_TextChanged1(object sender, EventArgs e)
        {

        }
    }
}