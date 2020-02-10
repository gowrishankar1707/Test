<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" MasterPageFile="~/Home.Master" Inherits="sample_web_application.Registration" %>

<asp:Content ID="registerContent" runat="server" ContentPlaceHolderID="masterBody">
    <style>
        table, td {
            padding: 5px;
            background-color: antiquewhite;
        }

        .btnRegister {
            background-color: snow;
            border: none;
            color: blue;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            padding: 10px 20px;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 20px;
            width: 200px;
        }
    </style>


    <h1 align="Center" style="color: blueviolet;"><i><strong><ins>Registration</ins></strong></i></h1>

    <div align="center">
        <table style="align-self: auto">

            <tr>
                <td>Name:</td>
                <td>
                    <asp:TextBox runat="server" ID="txtName" MaxLength="64" placeholder="Enter the Name" ToolTip="Name" ValidationGroup="rfv" />

                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="Name is required" ValidationGroup="rfv" ControlToValidate="txtName"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>UserName:</td>
                <td>
                    <asp:TextBox runat="server" ID="txtUserName" MaxLength="64" placeholder="Enter the Name" ToolTip="Name" ValidationGroup="rfv" />

                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvUserName" runat="server" ErrorMessage="UserName is required" ValidationGroup="rfv" ControlToValidate="txtUserName"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Password:</td>
                <td>
                    <asp:TextBox runat="server" ID="txtPassword" MaxLength="128" placeholder="Enter the password" TextMode="Password" ToolTip="password" ValidationGroup="rfv" />

                </td>

            </tr>
            <tr>
                <td>ConfirmPassword:
                </td>
                <td>
                    <asp:TextBox runat="server" ID="txtConfirmPassword" placeholder="Enter the  Password" TextMode="Password" ToolTip="Confirm password">

                    </asp:TextBox>
                </td>
                <td>
                    <asp:CompareValidator ID="cmpPassword" runat="server" ErrorMessage="Your Password does'nt match" ControlToValidate="txtConfirmPassword" ControlToCompare="txtPassword" Operator="Equal" Type="String"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td>DOB:</td>
                <td>
                    <asp:TextBox runat="server" ID="txtDate" ToolTip="Date" ValidationGroup="rfv" TextMode="Date" />
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvDate" runat="server" ControlToValidate="txtDate" ValidationGroup="rfv" ErrorMessage="DOB is required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>DOJ:</td>
                <td>
                    <asp:TextBox runat="server" ID="txtDOJ" ToolTip="Date" ValidationGroup="rfv" TextMode="Date" />
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtDOJ" ValidationGroup="rfv" ErrorMessage="DOJ is required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Gender
                </td>
                <td>
                    <asp:RadioButtonList ID="radioGender" runat="server" ValidationGroup="rfv">
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Fe-Male</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvGender" runat="server" ControlToValidate="radioGender" ErrorMessage="Gender is must" ValidationGroup="rfv"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td>PhoneNumber</td>
                <td>
                    <asp:TextBox ID="txtPhoneNumber" runat="server" MaxLength="10" placeholder="Enter the Phone number" ValidationGroup="rfv"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvPhoneNumber" ControlToValidate="txtPhoneNumber" runat="server" ErrorMessage="Phone Number is required" ValidationGroup="rfv"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Email</td>
                <td>
                    <asp:TextBox ID="txtE_mail" runat="server" placeholder="Enter the Email" TextMode="Email" ValidationGroup="rfv"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvE_mail" runat="server" ErrorMessage="E-mail is requried" ValidationGroup="rfv" ControlToValidate="txtE_mail"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="regE_mail" runat="server" ControlToValidate="txtE_mail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Not an valid E-mail"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>Address
                </td>
                <td>
                    <asp:TextBox ID="txtAddress" runat="server" MaxLength="350" placeholder="Enter the address" ToolTip="Address" TextMode="MultiLine" Height="80px" Width="160px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ErrorMessage="Address is required" ControlToValidate="txtAddress" ValidationGroup="rfv"></asp:RequiredFieldValidator>
                </td>
            </tr>

        </table>
        <br />

        <asp:Button ID="btnRegis" CssClass="btnRegister" Text="Register" runat="server" ValidationGroup="rfv" OnClick="BtnRegister" Height="35px" />
        <br />
        <br />

        <asp:GridView ID="lasGridView" runat="server" AutoGenerateColumns="false" DataKeyNames="UserID" EmptyDataText="No data in gridview"  OnRowEditing="RowEditing" OnRowUpdating="RowUpdating" OnRowCancelingEdit="RowCancelingEdit"  OnRowDeleting="RowDeleting" >
            <Columns>
                <asp:TemplateField HeaderText="Name">
                    <ItemTemplate>
                        <%# Eval("Name") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtName" Text='<%# Eval("Name") %>' runat="server"></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtNameFooter" runat="server"></asp:TextBox>
                    </FooterTemplate>

                </asp:TemplateField>

            


                <asp:TemplateField HeaderText="UserName">
                    <ItemTemplate>
                        <%# Eval("UserName") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtUserName" Text='<%# Eval("UserName") %>' runat="server"></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtUserNameFooter" runat="server"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="DOB">
                    <ItemTemplate>
                        <%# Eval("DOB") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtDOB" Text='<%# Eval("DOB") %>'  runat="server"></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtDOBFooter" runat="server"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="DOJ">
                    <ItemTemplate>
                        <%# Eval("DOJ") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtDOJ" Text='<%# Eval("DOJ") %>'  runat="server"></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtDOJFooter" runat="server"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Gender">
                    <ItemTemplate>
                        <%# Eval("Gender") %>
                                            
                    </ItemTemplate>
                    <EditItemTemplate>
                       
                        <asp:DropDownList ID="ddGender" runat="server" SelectedValue='<%# Eval("Gender") %>'>
                            <asp:ListItem>Male</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtGenderFooter" runat="server"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Email">
                    <ItemTemplate>
                        <%# Eval("E_Mail") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEmail" Text='<%# Eval("E_Mail") %>' runat="server"></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtEmailFooter" runat="server"></asp:TextBox>
                    </FooterTemplate>

                </asp:TemplateField>

                <asp:TemplateField HeaderText="PhoneNumber">
                    <ItemTemplate>
                        <%# Eval("PhoneNumber") %>'
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtPhoneNumber" Text='<%# Eval("PhoneNumber") %>' runat="server"></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtPhoneNumberFooter" runat="server"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Address">
                    <ItemTemplate>
                        <%# Eval("UserAddress") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtAddress" Text='<%# Eval("UserAddress") %>' runat="server"></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtAddressFooter" runat="server"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowEditButton="true" ControlStyle-ForeColor="#800000" />
                <asp:CommandField ShowDeleteButton="true" ControlStyle-ForeColor="#663300" />



            </Columns>
        </asp:GridView>


    </div>

</asp:Content>


