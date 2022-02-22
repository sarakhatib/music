<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Admin.aspx.cs" Inherits="Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <center style="font-family: 'Comic Sans MS'; font-size: x-large; color: #FF0066">
        <b>ADMIN</b>
    <br />
    <br />
    <asp:Button ID="ButtonUsersEditor" runat="server" Text="UsersEditor" OnClick="ButtonUsersEditor_Click"
        BackColor="#FF9999" BorderColor="#FF0066" BorderStyle="Groove" Font-Names="Comic Sans MS"
        Font-Size="Medium" ForeColor="#FF0066" />
    <br />
    <br />
    <asp:Button ID="ButtonNotes" runat="server" Text="Notes" BackColor="#FF9999" BorderColor="#FF0066"
        BorderStyle="Groove" Font-Names="Comic Sans MS" Font-Size="Medium" ForeColor="#FF0066"
        OnClick="ButtonNotes_Click" />
    <br />
    <br />
    <asp:Button ID="ButtonFiles" runat="server" Text="Files Editor" BackColor="#FF9999"
        BorderColor="#FF0066" BorderStyle="Groove" Font-Names="Comic Sans MS" Font-Size="Medium"
        ForeColor="#FF0066" onclick="ButtonFiles_Click" />
         <br />
    <br />
    <asp:Button ID="ButtonSongEditor" runat="server" Text="Song Editor" BackColor="#FF9999"
        BorderColor="#FF0066" BorderStyle="Groove" Font-Names="Comic Sans MS" Font-Size="Medium"
        ForeColor="#FF0066" onclick="ButtonSongEditor_Click" /></center>
</asp:Content>
