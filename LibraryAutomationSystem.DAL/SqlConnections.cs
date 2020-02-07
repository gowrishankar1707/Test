using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LibraryAutomationSystem.DAL
{
    class SqlConnections
    {
        public static SqlConnection GetConnection()
        {
            string connectionString = @"Data Source=GOWRI;Initial Catalog=LibraryAutomationSystems;Integrated Security=SSPI;";
            SqlConnection sqlConnection = new SqlConnection(connectionString);
            return sqlConnection;
        }

    }
}
