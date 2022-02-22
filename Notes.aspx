<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Notes.aspx.cs" Inherits="Notes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Label ID="LabelERROR" runat="server" Text=""></asp:Label>
    <h1>
        <center>
            <font color="#cc0066"><b>Notes</b></font></center>
    </h1>
    <asp:GridView ID="GridViewNotes" AutoGenerateColumns="false" runat="server" 
        OnRowCommand="GridViewNotes_RowCommand" 
        onrowdeleting="GridViewNotes_RowDeleting">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButtonMarkAs" runat="server" CommandName="MarkAs" CommandArgument='<%# Bind("NoteID") %>'></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="NoteID">
                <ItemTemplate>
                    <asp:Label ID="LabelNoteID" runat="server" Text='<%# Bind("NoteID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Subject">
                <ItemTemplate>
                    <asp:Label ID="LabelSubject" runat="server" Text='<%# Bind("Subject") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Note">
                <ItemTemplate>
                    <asp:Label ID="LabelNote" runat="server" Text='<%# Bind("Note") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Read">
                <ItemTemplate>
                    <asp:CheckBox ID="CheckBoxRead" runat="server" Enabled="false" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:CheckBox ID="CheckBoxReadEdit" runat="server" />
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButtonDelete"  OnClientClick="return confirm('Are You Sure?');" CommandName="Delete" runat="server">Delete</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>
