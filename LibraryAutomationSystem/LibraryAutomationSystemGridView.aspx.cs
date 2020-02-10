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
        SqlConnection sqlconnection = SqlConnections.GetConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillGrid();

            }
        }
        protected void FillGrid()
        {

            try
            {
                using (SqlCommand selectCommand = new SqlCommand("sp_SelectMember", sqlconnection))
                {
                    selectCommand.CommandType = System.Data.CommandType.StoredProcedure;
                    DataTable table = new DataTable();
                    if (sqlconnection.State == ConnectionState.Closed)
                    {
                        sqlconnection.Open();
                        IDataReader reader = selectCommand.ExecuteReader();
                        table.Load(reader);


                    }
                    if (table.Rows.Count >= 1)
                    {
                        lasGridView.DataSource = table;
                        lasGridView.DataBind();
                    }




                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        protected void lasGridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            lasGridView.EditIndex = e.NewEditIndex;
            FillGrid();

        }

        protected void lasGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            lasGridView.EditIndex = -1;
            FillGrid();
        }

        protected void lasGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int UserID = Convert.ToInt32(lasGridView.DataKeys[e.RowIndex].Values["UserID"].ToString());
            sqlconnection.Open();
            using (SqlCommand deleteProcedure = new SqlCommand("sp_DeleteMember", sqlconnection))
            {
                deleteProcedure.CommandType = CommandType.StoredProcedure;
                SqlParameter param = new SqlParameter();
                param.ParameterName = "@UserID";
                param.Value = UserID;
                param.SqlDbType = SqlDbType.Int;
                deleteProcedure.Parameters.Add(param);

                deleteProcedure.ExecuteNonQuery();
                FillGrid();
                sqlconnection.Close();



                //if (sqlconnection.State == ConnectionState.Closed)
                //{
                //    sqlconnection.Open();
                //    int rows = deleteProcedure.ExecuteNonQuery();

                //    sqlconnection.Close();
                //}
            

            }


        }

        protected void lasGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int userID = Convert.ToInt32(lasGridView.DataKeys[e.RowIndex].Value.ToString());
            string name = ((TextBox)lasGridView.Rows[e.RowIndex].FindControl("txtName")).Text;
            string userName = ((TextBox)lasGridView.Rows[e.RowIndex].FindControl("txtUserName")).Text;
            string DOB = ((TextBox)lasGridView.Rows[e.RowIndex].FindControl("txtDOB")).Text;
            string DOJ = ((TextBox)lasGridView.Rows[e.RowIndex].FindControl("txtDOJ")).Text;
            string gender = ((DropDownList)lasGridView.Rows[e.RowIndex].FindControl("ddgender")).Text;
            string email= ((TextBox)lasGridView.Rows[e.RowIndex].FindControl("txtEmail")).Text;
            string phoneNumber= ((TextBox)lasGridView.Rows[e.RowIndex].FindControl("txtPhoneNumber")).Text;
            string address= ((TextBox)lasGridView.Rows[e.RowIndex].FindControl("txtAddress")).Text;


            using (SqlCommand updateCommand = new SqlCommand("sp_UpdateMember", sqlconnection))
            {
                sqlconnection.Open();
                updateCommand.CommandType = CommandType.StoredProcedure;
                updateCommand.Parameters.AddWithValue("@UserID", userID);
                updateCommand.Parameters.AddWithValue("@Name", name);
                updateCommand.Parameters.AddWithValue("@UserName", userName);

                SqlParameter parameter = new SqlParameter();
                parameter.ParameterName = "@DOB";
                parameter.Value = DOB;
                parameter.SqlDbType = SqlDbType.Date;
                updateCommand.Parameters.Add(parameter);

                parameter = new SqlParameter();
                parameter.ParameterName = "@DOJ";
                parameter.Value = DOB;
                parameter.SqlDbType = SqlDbType.Date;
                updateCommand.Parameters.Add(parameter);

                
                updateCommand.Parameters.AddWithValue("@Gender", gender);
                updateCommand.Parameters.AddWithValue("@Email", email);
                updateCommand.Parameters.AddWithValue("@PhoneNumber", phoneNumber);
                updateCommand.Parameters.AddWithValue("@UserAddress", address);
                updateCommand.ExecuteNonQuery();
                sqlconnection.Close();
                lasGridView.EditIndex = -1;
                FillGrid();
            }



    


        }

        protected void lasGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            lasGridView.PageIndex = e.NewPageIndex;
            FillGrid();
        }
    }
}