using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.WebControls;

namespace LibraryAutomationSystem.DAL
{
    public class UserRerpositary
    {
        static SqlConnection connection = SqlConnections.GetConnection();
        public static bool LogIn(string userName, string password)
        {



            using (SqlCommand command = new SqlCommand("SP_Find_User", connection))
            {
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@UserName", userName);
                command.Parameters.AddWithValue("@Password", password);
                command.Parameters.Add("@Id", SqlDbType.Int, 3);
                command.Parameters["@Id"].Direction = ParameterDirection.Output;
                connection.Open();
                command.ExecuteNonQuery();
                int id = Convert.ToInt32(command.Parameters["@Id"].Value);
                if (id >= 1)
                {
                    return true;
                }



                else
                {
                    return false;
                }
            }

        }
        public static bool Register(string name, string userName, string password, string DOB, string DOJ, string gender, string phoneNumber, string email, string address)
        {
            try
            {



                using (SqlCommand registerCommand = new SqlCommand("sp_Insert_Member", connection))
                {
                    registerCommand.CommandType = CommandType.StoredProcedure;
                    registerCommand.Parameters.AddWithValue("@Name", name);
                    registerCommand.Parameters.AddWithValue("@UserName", userName);
                    registerCommand.Parameters.AddWithValue("@UserPassword", password);
                    registerCommand.Parameters.AddWithValue("@Gender", gender);
                    registerCommand.Parameters.AddWithValue("@DOB", DOB);
                    registerCommand.Parameters.AddWithValue("@DOJ", DOJ);
                    registerCommand.Parameters.AddWithValue("@Email", email);
                    registerCommand.Parameters.AddWithValue("@Phonenumber", phoneNumber);

                    registerCommand.Parameters.AddWithValue("@UserAddress", address);


                    int row = registerCommand.ExecuteNonQuery();
                    if (row > 0)
                    {
                        return true;
                    }
                    else
                    {
                        throw new Exception();
                    }
                }

            }
            catch (Exception)
            {
                return false;
            }
        }

        public static string DeleteRow(GridView gridView, GridViewDeleteEventArgs e)
        {
            try
            {
                int UserID = Convert.ToInt32(gridView.DataKeys[e.RowIndex].Values["UserID"].ToString());

                using (SqlCommand deleteProcedure = new SqlCommand("sp_DeleteMember", connection))
                {

                    string message="0";
                    deleteProcedure.CommandType = CommandType.StoredProcedure;
                    SqlParameter param = new SqlParameter();
                    param.ParameterName = "@UserID";
                    param.Value = UserID;
                    param.SqlDbType = SqlDbType.Int;
                    deleteProcedure.Parameters.Add(param);

                    deleteProcedure.ExecuteNonQuery();
                    return message = "Delete Successfullty ";
                    
                }
            }
            catch(Exception ex)
            {
                string message;
                return message = " message: " + ex.Message;
            }
        }

        public static void RefreshGrid(GridView gridView)
        {

            try
            {
                using (SqlCommand selectCommand = new SqlCommand("sp_SelectMember", connection))
                {
                    selectCommand.CommandType = System.Data.CommandType.StoredProcedure;
                    DataTable table = new DataTable();
                    if (connection.State == ConnectionState.Closed)
                    {
                        connection.Open();



                    }
                    IDataReader reader = selectCommand.ExecuteReader();
                    table.Load(reader);
                    if (table.Rows.Count >= 1)
                    {
                        gridView.DataSource = table;
                        gridView.DataBind();
                    }




                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

        }
        public static void UpdateRow(GridView gridView, GridViewUpdateEventArgs e)
        {
            int userID = Convert.ToInt32(gridView.DataKeys[e.RowIndex].Value.ToString());
            string name = ((TextBox)gridView.Rows[e.RowIndex].FindControl("txtName")).Text;
            string userName = ((TextBox)gridView.Rows[e.RowIndex].FindControl("txtUserName")).Text;
            DateTime DOB = Convert.ToDateTime(((TextBox)gridView.Rows[e.RowIndex].FindControl("txtDOB")).Text);
            DateTime DOJ = Convert.ToDateTime(((TextBox)gridView.Rows[e.RowIndex].FindControl("txtDOJ")).Text);
            string gender = ((DropDownList)gridView.Rows[e.RowIndex].FindControl("ddgender")).Text;
            string email = ((TextBox)gridView.Rows[e.RowIndex].FindControl("txtEmail")).Text;
            string phoneNumber = ((TextBox)gridView.Rows[e.RowIndex].FindControl("txtPhoneNumber")).Text;
            string address = ((TextBox)gridView.Rows[e.RowIndex].FindControl("txtAddress")).Text;


            using (SqlCommand updateCommand = new SqlCommand("sp_UpdateMember", connection))
            {
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
                connection.Close();

            }
        }

    }
}

