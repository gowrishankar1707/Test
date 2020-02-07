using System;
using System.Collections.Generic;
using LibraryAutomationSystem.DAL;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryAutomationSystem
{
    public partial class LibraryAutomationSystemGridView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                SqlConnection sqlconnection = SqlConnections.GetConnection();
                try
                {
                    using (SqlCommand selectCommand = new SqlCommand("", sqlconnection))
                    {

                    }
                }
                catch
                {

                }
            }
        }
        protected void FillLibraryAutomationSystemGrid()
        {
            
        }

        protected void lasGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void lasGridView_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void lasGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {

        }

        protected void lasGridView_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}