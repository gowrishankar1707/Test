<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Home.Master" CodeBehind="LoginForm.aspx.cs" Inherits="sample_web_application.LoginForm" %>




<asp:Content ID="LoginContent" runat="server" ContentPlaceHolderID="masterBody">
    <style>
        table,td{
            margin: 10px;
            padding: 10px;
            background-color:burlywood;
        }
        .styleButton
        {

        }
        
    </style>
 
    <h1 align="Center" style="color:blueviolet;"><i><ins>Login Page</ins> </i> </h1>

    <div align="Center">
    <table style="align-self:auto">
       
        
        <tr>
            <td><strong> UserName</strong></td>
            <td>
             <asp:TextBox ID="txtUserName" placeholder="UserName" runat="server" TextMode="SingleLine" MaxLength="25" ></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfvUserName" ControlToValidate="txtUserName" runat="server" BackColor="#cc3300"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td><strong>Password</strong></td>
            <td>
               <asp:TextBox ID="txtPassword" placeholder="Password" runat="server" TextMode="Password" MaxLength="20" ></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPassword" BackColor="#996600"></asp:RequiredFieldValidator>
            </td>
        </tr>
    </table>
         <asp:Button ID="Login_Button"   CssClass="styleButton" runat="server" BorderStyle="Ridge"  Text="Submit" OnClick="Button1_Click"  BorderColor="Transparent"/>
    </div>


</asp:Content>

   