using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using LibraryAutomationSystem.Entity;
using LibraryAutomationSystem.DAL;

using System.Web.UI.WebControls;

namespace sample_web_application
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void BtnRegister(object sender, EventArgs e)
        {
            if(Page.IsValid)
            {
                User user = new User(txtName.Text, txtUserName.Text, txtConfirmPassword.Text, txtDate.Text, txtDOJ.Text, radioGender.Text, txtPhoneNumber.Text, txtE_mail.Text, txtAddress.Text);
                bool myBool=UserRepositary.re

            }
        }
    }
}