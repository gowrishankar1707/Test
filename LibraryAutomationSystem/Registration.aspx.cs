using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Web.UI;
using System.Data;
using LibraryAutomationSystem.Entity;
using LibraryAutomationSytem.BL;
using LibraryAutomationSystem.DAL;

using System.Web.UI.WebControls;

namespace sample_web_application
{
    public partial class Registration : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillGrid();
               
            }

        }
        protected void BtnRegister(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                User user = new User(txtName.Text, txtUserName.Text, txtConfirmPassword.Text, txtDate.Text, txtDOJ.Text, radioGender.Text, txtPhoneNumber.Text, txtE_mail.Text, txtAddress.Text);
                bool myBool = BuisnessLayer.RegisterMember(user.memberName, user.memberUserName, user.memberPassword, user.memberDOB, user.memberDOJ, user.memberSex, user.memberPhoneNumber, user.e_Mail, user.memberAddress);
                if (myBool)
                {
                    Response.Redirect("Registration.aspx");
                    FillGrid();
                    Response.Write("Register successfully");

                }
                else
                {
                    Response.Write("Unsuccessfully");
                }


            }
        }
        protected void FillGrid()
        {
            BuisnessLayer.RefreshData(lasGridView);
        }

        protected void RowEditing(object sender, GridViewEditEventArgs e)
        {
            lasGridView.PageIndex = e.NewEditIndex;
            BuisnessLayer.RefreshData(lasGridView);
        }

        protected void RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            lasGridView.EditIndex = -1;
            BuisnessLayer.RefreshData(lasGridView);
        }

        protected void RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

            BuisnessLayer.UpdateRow(lasGridView, e);
            lasGridView.EditIndex = -1;
            BuisnessLayer.RefreshData(lasGridView);
        }

        protected void RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            BuisnessLayer.DeleteRow(lasGridView, e);
            BuisnessLayer.RefreshData(lasGridView);
        }
    }
}