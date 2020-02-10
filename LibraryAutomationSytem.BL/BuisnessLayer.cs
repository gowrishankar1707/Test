using System;
using LibraryAutomationSystem.DAL;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.WebControls;

namespace LibraryAutomationSytem.BL
{
    public class BuisnessLayer
    {
        public static bool Login(string userName,string password)
        {
            bool myBool=UserRerpositary.LogIn(userName, password);
            if (myBool)
                return true;
            else
                return false;
        }
        public static bool RegisterMember(string name, string userName, string password, string DOB, string DOJ, string gender, string phoneNumber, string email, string address)
        {
            bool myBool = UserRerpositary.Register(name, userName, password, DOB, DOJ, gender, phoneNumber, email, address);
            if (myBool)
                return true;
            else
                return false;
        }
        public static void RefreshData(GridView gridview)
        {
            UserRerpositary.RefreshGrid(gridview);
        }
        public static void UpdateRow(GridView gridView,GridViewUpdateEventArgs e)
        {
            UserRerpositary.UpdateRow(gridView, e);
        }
        public static void DeleteRow(GridView gridView, GridViewDeleteEventArgs e)
        {
            UserRerpositary.DeleteRow(gridView, e);
        }
    }
}
