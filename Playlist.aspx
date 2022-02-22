<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Playlist.aspx.cs" Inherits="Playlist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Label ID="LabelError" runat="server" Text=""></asp:Label>
    <center>
        <asp:GridView ID="GridViewSongs" runat="server" AutoGenerateColumns="False" BackColor="White"
            BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1"
            GridLines="None" onrowdeleting="GridViewSongs_RowDeleting">
            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
            <HeaderStyle BackColor="#cc0066" Font-Bold="True" ForeColor="#E7E7FF" />
            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#ff3399" ForeColor="Black" />
            <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#594B9C" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#33276A" />
            <Columns>
                <asp:TemplateField Visible="false">
                    <ItemTemplate>
                        <asp:Label ID="LabelSongID" runat="server" Text='<%# Bind("SongID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Song's Name">
                    <ItemTemplate>
                        <asp:Label ID="LabelSongName" runat="server" Text='<%# Bind("SongName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Song's Artist">
                    <ItemTemplate>
                        <asp:Label ID="LabelSongArtist" runat="server" Text='<%# Bind("SongArtist") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="YouTube Link For The Song">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButtonYouTubeLink" runat="server" Text='<%# Bind("YouTubeLink") %>'></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Album">
                    <ItemTemplate>
                        <asp:Label ID="LabelAlbum" runat="server" Text='<%# Bind("Album") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Image ID="ImageArtist" runat="server" Width="100" Height="80" ImageUrl='<%# Bind("ImageOfArtist") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Rate">
                    <ItemTemplate>
                        <asp:Label ID="LabelRate" runat="server" Text='<%# Bind("SongRate") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButtonRemove" CommandName="Delete" runat="server">Remove</asp:LinkButton>
                </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </center>
</asp:Content>
