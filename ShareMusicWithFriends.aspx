<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="ShareMusicWithFriends.aspx.cs" Inherits="ShareMusicWithFriends" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Label ID="LabelError" runat="server" Text=""></asp:Label>
    <center>
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
                    <asp:Button ID="ButtonStartSharing" runat="server" Text="Start Sharing" align="left"
                        BackColor="#FF66CC" BorderColor="Fuchsia" ForeColor="#660033" 
                        onclick="ButtonStartSharing_Click" />
                </td>
                <td>
                    <asp:Button ID="ButtonCancel" runat="server" Text="Cancel" align="left" BackColor="#FF66CC"
                        BorderColor="Fuchsia" ForeColor="#660033" onclick="ButtonCancel_Click" />
                </td>
            </tr>
        </table>
    </center>
</asp:Content>
