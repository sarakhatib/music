<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="UsersEditor.aspx.cs" Inherits="UsersEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Label ID="LabelError" ForeColor="Red" runat="server" Text=""></asp:Label>
    <table>
        <tr>
            <td style="font-size: x-large; color: #660033; font-family: 'Berlin Sans FB Demi';">
                <strong>Available Users:</strong>
            </td>
        </tr>
        <tr>
            <td>
                <asp:DataList ID="DataListUsers" runat="server" BackColor="White" BorderColor="#E7E7FF"
                    BorderStyle="None" RepeatColumns="2" BorderWidth="1px" CellPadding="3" GridLines="Horizontal"
                    OnCancelCommand="DataListUsers_CancelCommand1" OnDeleteCommand="DataListUsers_DeleteCommand"
                    OnEditCommand="DataListUsers_EditCommand" OnItemCommand="DataListUsers_ItemCommand"
                    OnUpdateCommand="DataListUsers_UpdateCommand">
                    <AlternatingItemStyle BackColor="#660033" ForeColor="#ff66ff" />
                    <FooterStyle BackColor="#660033" ForeColor="#ff66ff" />
                    <HeaderStyle BackColor="#ff66ff" Font-Bold="True" ForeColor="#660033" />
                    <HeaderTemplate>
                        The Websit's Users
                    </HeaderTemplate>
                    <ItemStyle BackColor="#ff66ff" ForeColor="#660033" />
                    <ItemTemplate>
                       UserID:  <asp:Label ID="LabelUserID" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"UserID")%>'></asp:Label>
                        <br />
                        UserNickname: <asp:Label ID="LabelUserNickname" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"UserNickname")%>'></asp:Label>
                        <br />
                        PassWord: <asp:Label ID="LabelPassWord" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"PassWord")%>'></asp:Label>
                        <br />
                        UserFN: <asp:Label ID="LabelUserFN" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"UserFN")%>'></asp:Label>
                        <br />
                        UserLN: <asp:Label ID="LabelUserLN" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"UserLN")%>'></asp:Label>
                        <br />
                        DOB: <asp:Label ID="LabelDOB" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"DOB")%>'></asp:Label>
                        <br />
                        Email: <asp:Label ID="LabelEmail" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"Email")%>'></asp:Label>
                        <br />
                        UserGroup: <asp:Label ID="LabelUserGroup" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"UserGroup")%>'></asp:Label>
                        <br />
                        <asp:LinkButton ID="LinkButtonEdit" Text="Edit" CommandName="Edit" runat="server"></asp:LinkButton>
                        &nbsp; &nbsp;
                        <asp:LinkButton ID="LinkButtonDelete" Text="Delete" CommandName="Delete" OnClientClick="return confirm('Are You Sure?')" runat="server"></asp:LinkButton>
                    </ItemTemplate>
                    <EditItemTemplate>
                        UserID: <asp:Label ID="LabelUserIDEdit" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"UserID")%>'></asp:Label>
                        <br />
                        UserNickname:
                        <asp:TextBox ID="TextBoxUserNickname" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"UserNickname")%>'></asp:TextBox>
                        <br />
                        PassWord:
                        <asp:TextBox ID="TextBoxPassWord" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"PassWord")%>'></asp:TextBox>
                        <br />
                        UserFN:
                        <asp:TextBox ID="TextBoxUserFN" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"UserFN")%>'></asp:TextBox>
                        <br />
                        UserLN:
                        <asp:TextBox ID="TextBoxUserLN" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"UserLN")%>'></asp:TextBox>
                        <br />
                        DOB:
                        <asp:TextBox ID="TextBoxDOB" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"DOB")%>'></asp:TextBox>
                        <br />
                        Email:
                        <asp:TextBox ID="TextBoxEmail" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"Email")%>'></asp:TextBox>
                        <br />
                        UserGroup:
                        <asp:TextBox ID="TextBoxUserGroup" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"UserGroup")%>'></asp:TextBox>
                        <br />
                        <asp:LinkButton ID="LinkButtonUpdate" Text="Update" CommandName="Update" runat="server"></asp:LinkButton>
                        &nbsp; &nbsp;
                        <asp:LinkButton ID="LinkButtonCancel" Text="Cancel" CommandName="Cancel" runat="server"></asp:LinkButton>
                    </EditItemTemplate>
                    <FooterTemplate>
                        UserNickname:
                        <asp:TextBox ID="TextBoxUserNicknameInsert" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"UserNickname")%>'></asp:TextBox>
                        <br />
                        PassWord:
                        <asp:TextBox ID="TextBoxPassWordInsert" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"PassWord")%>'></asp:TextBox>
                        <br />
                        UserFN:
                        <asp:TextBox ID="TextBoxUserFNInsert" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"UserFN")%>'></asp:TextBox>
                        <br />
                        UserLN:
                        <asp:TextBox ID="TextBoxUserLNInsert" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"UserLN")%>'></asp:TextBox>
                        <br />
                        DOB:
                        <asp:TextBox ID="TextBoxDOBInsert" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"DOB")%>'></asp:TextBox>
                        <br />
                        Email:
                        <asp:TextBox ID="TextBoxEmailInsert" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"Email")%>'></asp:TextBox>
                        <br />
                        UserGroup:
                        <asp:TextBox ID="TextBoxUserGroupInsert" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"UserGroup")%>'></asp:TextBox>
                        <br />
                        <asp:LinkButton ID="LinkButtonInsert" Text="Insert" CommandName="Insert" runat="server"></asp:LinkButton>
                        &nbsp; &nbsp;
                        <asp:LinkButton ID="LinkButtonCancelInsert" Text="Cancel" CommandName="Cancel" runat="server"></asp:LinkButton>
                    </FooterTemplate>
                </asp:DataList>
            </td>
        </tr>
    </table>
</asp:Content>
