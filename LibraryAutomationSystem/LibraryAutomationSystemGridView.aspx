<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LibraryAutomationSystemGridView.aspx.cs" Inherits="LibraryAutomationSystem.LibraryAutomationSystemGridView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form runat="server">
        <div>
            <asp:GridView ID="lasGridView" runat="server" AutoGenerateColumns="false"  DataKeyNames="UserID"   AllowPaging="true" GridLines="Horizontal"  EmptyDataText="No data in gridview" OnPageIndexChanging="lasGridView_PageIndexChanging" OnRowEditing="lasGridView_RowEditing" OnRowCancelingEdit="lasGridView_RowCancelingEdit" OnRowDeleting="lasGridView_RowDeleting" OnRowUpdating="lasGridView_RowUpdating">
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

<%--                    <asp:TemplateField HeaderText="UserID">
                        <ItemTemplate>
                          '<%# Bind("UserID") %>' 
                        </ItemTemplate>
                    </asp:TemplateField>--%>


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
                            <asp:TextBox ID="txtDOB" Text='<%# Eval("DOB") %>' runat="server"></asp:TextBox>
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
                            <asp:TextBox ID="txtDOJ" Text='<%# Eval("DOJ") %>' runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtDOJFooter" runat="server"></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Gender">
                        <ItemTemplate>
                          <%# Eval("Gender") %>
                            <%--                             <asp:TextBox ID="txtGender" Text='<%# Eval("Gender") %>' runat="server"></asp:TextBox>--%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <%--<asp:TextBox ID="txtGender" Text='<%# Eval("Gender") %>' runat="server"></asp:TextBox>--%>
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
            <br />
            <asp:Label ID="lblSuccessfully" runat="server" Text="Done Successfully" ForeColor="#cc3300"></asp:Label>
            <br />
            <asp:Label ID="lblErrorMessage" runat="server" Text="Error Message" ForeColor="#996600"></asp:Label>
            <br />
        </div>
    </form>
</body>
</html>
