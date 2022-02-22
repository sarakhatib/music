<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="CertainMessage.aspx.cs" Inherits="CertainMessage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Label ID="LabelError" runat="server" ForeColor="Red" Text=""></asp:Label>
    <table>
        <tr>
            <td>
                To:
            </td>
            <td>
                <asp:Label ID="LabelUserIDTo" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                From:
            </td>
            <td>
                <asp:Label ID="LabelUserIDFrom" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                Sent At:
            </td>
            <td>
                <asp:Label ID="LabelTime" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                Subject:
            </td>
            <td>
                <asp:TextBox ID="TextBoxSubject" ReadOnly="true" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Message:
            </td>
            <td>
                <asp:TextBox ID="TextBoxMessage" TextMode="MultiLine" ReadOnly="true" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
        <td >
            <asp:Button ID="ButtonResponse" runat="server" Text="Response" 
                onclick="ButtonResponse_Click" />
        </td>
        <td>
            <asp:Button ID="ButtonDelete" runat="server" Text="Delete" 
                onclick="ButtonDelete_Click" />
        </td>
        </tr>
    </table>
</asp:Content>
