<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="UserProfile.aspx.cs" Inherits="UserProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <center>
        <table border="2" bgcolor="#ff0066" frame=below>
            <tr>
                <td>
                    <asp:LinkButton ID="LinkButtonEditMyDetails" runat="server" 
                        onclick="LinkButtonEditMyDetails_Click">Edit My Details</asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td>
                    <a href="MyMessages.aspx">My Messages</a>
                </td>
            </tr>
            <tr>
                <td>
                    <a href="WriteMessage.aspx">Send Message</a>
                </td>
            </tr>
        </table>
    </center>
</asp:Content>
