<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="ContactUs.aspx.cs" Inherits="ContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Label ID="LabelERROR" runat="server" Text=""></asp:Label>
    <center>
        <h1>
            <font color="#ff0066">Contact Us</font></h1>
    </center>
    <table width="80%">
        <tr>
            <td>
                <font color="#990033">
                    <h2>
                        Subject:
                    </h2>
                </font>
            </td>
            <td>
                <asp:TextBox ID="TextBoxSubject" runat="server" Height="50%"></asp:TextBox><asp:RequiredFieldValidator
                    ID="RequiredFieldValidator2" runat="server" ErrorMessage="Subject Required" ControlToValidate="TextBoxSubject"
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <font color="#990033">
                    <h2>
                        Note:
                    </h2>
                </font>
            </td>
            <td>
                <asp:TextBox ID="TextBoxNote" runat="server" TextMode="MultiLine" Height="50%"></asp:TextBox><asp:RequiredFieldValidator
                    ID="RequiredFieldValidator3" runat="server" ErrorMessage="Note Required" ControlToValidate="TextBoxNote"
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="Save" runat="server" Text="Save" OnClick="Save_Click" BackColor="#660033"
                    BorderColor="#ff0066" ForeColor="#ff6699" />
            </td>
            <td>
                <asp:Button ID="Cancel" runat="server" Text="Cancel" OnClick="Cancel_Click" BackColor="#660033"
                    BorderColor="#ff0066" CausesValidation="false" ForeColor="#ff6699" />
            </td>
        </tr>
    </table>
</asp:Content>
