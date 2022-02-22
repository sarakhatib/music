<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="LogIn.aspx.cs" Inherits="LogIn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <center>
        <asp:Label ID="Label1" runat="server" Text="To Log In" Style="font-size: xx-large;
            color: #660033"></asp:Label><br />
        <table border="1" width="50%">
            <tr>
                <td align="left" style="height: 25px; color: #990099;">
                    Username:
                </td>
                <td style="height: 25px">
                    <asp:TextBox ID="TextBoxUserName" runat="server" Style="color: #FF3399"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="height: 26px; color: #990099;" align="left">
                    Password:
                </td>
                <td style="height: 26px">
                    <asp:TextBox ID="TextBoxPassword" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="ButtonReset" runat="server" Text="Reset" OnClick="ButtonReset_Click"
                        align="left" BackColor="#FF66CC" BorderColor="Fuchsia" ForeColor="#660033" />
                </td>
                <td>
                    <asp:Button ID="ButtonLogIn" runat="server" Text="Login" OnClick="ButtonLogIn_Click"
                        align="left" BackColor="#FF66CC" BorderColor="Fuchsia" ForeColor="#660033" />
                </td>
            </tr>
        </table>
    </center>
</asp:Content>
