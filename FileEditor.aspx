<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="FileEditor.aspx.cs" Inherits="FileEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Label ID="LabelError" ForeColor="Red" runat="server" Text=""></asp:Label>
    <h3>
        Please Select File Type:</h3>
    <asp:DropDownList ID="DropDownListFileType" runat="server" AutoPostBack="True">
        <asp:ListItem Text="Exam" Value="Exam"></asp:ListItem>
        <asp:ListItem Text="Homework" Value="Homework"></asp:ListItem>
    </asp:DropDownList>
    <h3>
        Discription:</h3>
    <asp:TextBox ID="TextBoxDiscription" runat="server" TextMode="MultiLine"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorTextBox" runat="server" ForeColor="Red"
        ControlToValidate="TextBoxDiscription" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
    <br />
    <br />
    <asp:FileUpload ID="FileUploadBrowser" runat="server" />
    &nbsp;&nbsp;
    <asp:Button ID="ButtonUpload" Text="Upload" runat="server" OnClick="ButtonUpload_Click" />
    <br />
    <%--//--%>
    <asp:GridView ID="GridViewFiles" runat="server" BackColor="White" BorderColor="#DEDFDE"
        BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical"
        OnRowDeleting="GridViewFiles_RowDeleting" OnRowCommand="GridViewFiles_RowCommand">
        <AlternatingRowStyle BackColor="White" />
        <FooterStyle BackColor="#CCCC99" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#F7F7DE" />
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#FBFBF2" />
        <SortedAscendingHeaderStyle BackColor="#848384" />
        <SortedDescendingCellStyle BackColor="#EAEAD3" />
        <SortedDescendingHeaderStyle BackColor="#575357" />
        <Columns>
            <asp:TemplateField HeaderText="Download">
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLinkFileName" NavigateUrl='<%#Bind("FileName") %>' Text="Download"
                        runat="server"></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Delete">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButtonDelete" CommandArgument='<%#Bind("FileID")%>' CommandName="Delete"
                        runat="server">Delete</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>
