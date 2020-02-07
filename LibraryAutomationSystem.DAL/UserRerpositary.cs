using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LibraryAutomationSystem.DAL
{
    public class UserRerpositary
    {
        public static bool LogIn(string userName, string password)
        {
            SqlConnection sqlConnection = SqlConnections.GetConnection();


            using (SqlCommand command = new SqlCommand("SP_Find_User", sqlConnection))
            {
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@UserName", userName);
                command.Parameters.AddWithValue("@Password", password);
                command.Parameters.Add("@Id", SqlDbType.Int, 3);
                command.Parameters["@Id"].Direction = ParameterDirection.Output;
                sqlConnection.Open();
                command.ExecuteNonQuery();
                int id = Convert.ToInt32(command.Parameters["@Id"].Value);
                if (id > 1)
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
            SqlConnection connection = SqlConnections.GetConnection();


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
                    connection.Open();

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
            catch(Exception)
            {
                return false;
            }
        }
    }

}

