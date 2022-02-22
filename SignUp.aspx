<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="SignUp.aspx.cs" Inherits="SignUp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Label ID="LabelErrors" runat="server" Text=""></asp:Label>
    <table style="width: 486px; margin-right: 28px;">
        <tr>
            <td colspan="2">
                <h1 style="font-family: 'Courier New', Courier, monospace; color: #53224A">
                    <asp:Label ID="LabelUser" runat="server" Text=""></asp:Label>
                </h1>
            </td>
        </tr>
        <asp:Label ID="LabelID" runat="server" Text=""></asp:Label>
        <tr>
            <td style="color: #990033; width: 235px;">
                Username:
            </td>
            <td style="width: 639px">
                <asp:TextBox ID="TextBoxUserNickname" runat="server" BorderColor="#FF0066" ForeColor="#FF0066"
                    Style="color: #990033"></asp:TextBox>
                <asp:RequiredFieldValidator Text="*" ID="RequiredFieldValidatorUserNickname" runat="server"
                    ErrorMessage="Required Username!" ControlToValidate="TextBoxUserNickname" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="color: #990033; width: 235px;">
                First Name:
            </td>
            <td style="width: 639px">
                <asp:TextBox ID="TextBoxFirstName" runat="server" BorderColor="#FF0066" ForeColor="#FF0066"
                    Style="color: #990033"></asp:TextBox>
                <asp:RequiredFieldValidator Text="*" ID="RequiredFieldValidatorFirstName" runat="server"
                    ErrorMessage="Required First Name" ControlToValidate="TextBoxFirstName" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="color: #990033; width: 235px;">
                Last Name:
            </td>
            <td style="width: 639px">
                <asp:TextBox ID="TextBoxLastName" runat="server" BorderColor="#FF0066" ForeColor="#FF0066"
                    Style="color: #990033"></asp:TextBox>
                <asp:RequiredFieldValidator Text="*" ID="RequiredFieldValidatorLastName" runat="server"
                    ErrorMessage="Required Last Name" ControlToValidate="TextBoxLastName" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="color: #990033; width: 235px; height: 30px;">
                Date Of Birth:
            </td>
            <td style="width: 639px; height: 30px;">
                <asp:DropDownList ID="DropDownListYear" runat="server">
                    <asp:ListItem Value="-1">Choose Year</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="DropDownListMonth" runat="server" 
                    onselectedindexchanged="DropDownListMonth_SelectedIndexChanged">
                    <asp:ListItem Value="-1">Choose Month</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="DropDownListDay" runat="server">
                    <asp:ListItem Value="-1">Choose Day</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorYear" runat="server" ErrorMessage="Year Required"
                    ControlToValidate="DropDownListYear" Text="*" InitialValue="-1" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorMonth" Text="*" ForeColor="Red"
                    InitialValue="-1" ControlToValidate="DropDownListMonth" runat="server" ErrorMessage="Month Required"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorDay" ControlToValidate="DropDownListDay"
                    InitialValue="-1" Text="*" ForeColor="Red" runat="server" ErrorMessage="Day Required"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="color: #990033; width: 235px;">
                Password:
            </td>
            <td style="width: 639px">
                <asp:TextBox ID="TextBoxPassword" runat="server" BorderColor="#FF0066" ForeColor="#FF0066"
                    Style="color: #990033"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" runat="server" ErrorMessage="Password Required"
                    Text="*" ControlToValidate="TextBoxPassword" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="color: #990033; width: 235px;">
                Retype Password:
            </td>
            <td style="width: 639px">
                <asp:TextBox ID="TextBoxRetype" runat="server" BorderColor="#FF0066" ForeColor="#FF0066"
                    Style="color: #990033"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorRetype" runat="server" ErrorMessage="Retype Password is Required"
                    Text="*" ControlToValidate="TextBoxRetype" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidatorRetype" ControlToValidate="TextBoxRetype"
                    runat="server" ErrorMessage="Both Passwords Should Match" ForeColor="Red" Text="*"
                    ControlToCompare="TextBoxPassword" Type="String" Operator="Equal"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td style="color: #990033; width: 235px;">
                E-Mail:
            </td>
            <td style="width: 639px">
                <asp:TextBox ID="TextBoxEmail" runat="server" BorderColor="#FF0066" ForeColor="#FF0066"
                    Style="color: #990033"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ErrorMessage="Email Required"
                    Text="*" ControlToValidate="TextBoxEmail" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Email"
                    Text="*" ControlToValidate="TextBoxEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                    ForeColor="Red"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 235px">
                <asp:Button ID="Save" runat="server" Text="Save" OnClick="Save_Click" BackColor="#FF99CC"
                    BorderColor="#FF0066" Style="color: #990033" />
            </td>
            <td style="width: 639px">
                <asp:Button ID="Cancel" runat="server" Text="Cancel" OnClick="Cancel_Click" CausesValidation="false"
                    BackColor="#FF99CC" BorderColor="#FF0066" Style="color: #990033" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" HeaderText="Please Fix The Following Errors" />
            </td>
        </tr>
    </table>
</asp:Content>
