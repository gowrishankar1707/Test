<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LibraryAutomationSystemGridView.aspx.cs" Inherits="LibraryAutomationSystem.LibraryAutomationSystemGridView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="lasGridView" runat="server" AutoGenerateColumns="false" OnRowDeleting="lasGridView_RowDeleting" OnRowEditing="lasGridView_RowEditing"  OnRowCancelingEdit="lasGridView_RowCancelingEdit" OnSelectedIndexChanged="lasGridView_SelectedIndexChanged">
                <Columns>
                    <asp:TemplateField HeaderText="Name">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("Name") %>' runat="server"></asp:Label>
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
                            <asp:Label Text='<%# Eval("UserName") %>' runat="server"></asp:Label>
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
                            <asp:Label Text='<%# Eval("DOB") %>' runat="server"></asp:Label>
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
                            <asp:Label Text='<%# Eval("DOJ") %>' runat="server"></asp:Label>
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
                            <%--<asp:Label Text='<%# Eval("Gender") %>' runat="server"></asp:Label>--%>
                             <asp:TextBox ID="txtGender" Text='<%# Eval("Gender") %>' runat="server"></asp:TextBox>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <%--<asp:TextBox ID="txtGender" Text='<%# Eval("Gender") %>' runat="server"></asp:TextBox>--%>
                            <asp:DropDownList ID="ddGender" runat="server"  SelectedValue='<%# Eval("Gender") %>'>
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
                            <asp:Label Text='<%# Eval("E_Mail") %>' runat="server"></asp:Label>
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
                            <asp:Label Text='<%# Eval("PhoneNumber") %>' runat="server"></asp:Label>
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
                            <asp:Label Text='<%# Eval("UserAddress") %>' runat="server"></asp:Label>
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
                    <asp:CommandField ShowEditButton="true"  ControlStyle-BorderWidth="5px" ControlStyle-BackColor="#ffff00" ControlStyle-BorderColor="#808080"/>
                    <asp:CommandField ShowDeleteButton="true" ControlStyle-BorderWidth="5px" ControlStyle-BackColor="#ffff00" ControlStyle-BorderColor="#808080" />



                </Columns>

            </asp:GridView>
        </div>
    </form>
</body>
</html>
