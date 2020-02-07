using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryAutomationSystem
{
    public partial class Home : System.Web.UI.MasterPage
    {
        protected void BtnLink(object sender, EventArgs e)
        {
            Response.Redirect("LoginForm.aspx");
           
        }

        protected void BtnRegister(object sender, EventArgs e)
        {
            Response.Redirect("Registration.aspx");
        }
    }
}