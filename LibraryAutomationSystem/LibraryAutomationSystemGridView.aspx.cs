using System;
using System.Collections.Generic;
using LibraryAutomationSystem.DAL;
using System.Data;
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
            if (!IsPostBack)
            {
                BindData();

            }
        }
        protected void BindData()
        {
            SqlConnection sqlconnection = SqlConnections.GetConnection();
            try
            {
                using (SqlCommand selectCommand = new SqlCommand("sp_SelectMember", sqlconnection))
                {
                    selectCommand.CommandType = System.Data.CommandType.StoredProcedure;
                    SqlDataAdapter adapter = new SqlDataAdapter();
                    adapter.SelectCommand = selectCommand;
                    DataTable table = new DataTable();
                    adapter.Fill(table);
                    lasGridView.DataSource = table;
                    lasGridView.DataBind();

                }
            }
            catch(Exception ex)   
            {
                Response.Write(ex.Message);
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