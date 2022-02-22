<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="WriteMessage.aspx.cs" Inherits="WriteMessage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <br />
    <asp:Label ID="LabelError" runat="server" Text=""></asp:Label>
    <table bgcolor="#ff33cc">
        <tr>
            <td colspan="2">
                <font color="#660033">Write a Message to a User friend! </font>
            </td>
        </tr>
        <tr>
            <td>
                To:
            </td>
            <td>
                <asp:DropDownList ID="DropDownListUsers" runat="server">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorUsers" runat="server" Text="*"
                    ForeColor="Red" InitialValue="-1" ControlToValidate="DropDownListUsers" ErrorMessage="Chose Whom To Send This Message To"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                Subject:
            </td>
            <td>
                <asp:TextBox ID="TextBoxSubject" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Text="*"
                    ForeColor="Red" ControlToValidate="TextBoxSubject" ErrorMessage="Subject Is Required"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                Message:
            </td>
            <td>
                <asp:TextBox ID="TextBoxMessage" runat="server" Height="142px" TextMode="MultiLine"
                    Width="268px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Text="*"
                    ForeColor="Red" ControlToValidate="TextBoxMessage" ErrorMessage="Message Is Required"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="ButtonSend" runat="server" Text="Send" 
                    onclick="ButtonSend_Click" />
            </td>
            <td>
                <asp:Button ID="ButtonCancel" CausesValidation="false" runat="server" 
                    Text="Cancel" onclick="ButtonCancel_Click" />
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ValidationSummary" HeaderText="Please Fill What Is Missing:"
        ForeColor="Red" runat="server" />
</asp:Content>
