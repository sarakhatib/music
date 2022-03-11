<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Favorite.aspx.cs" Inherits="Favorite" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Label ID="LabelError" runat="server" Text=""></asp:Label>
    <asp:GridView ID="GridViewFavorite" runat="server" BackColor="#CCCCCC" BorderColor="#999999"
        BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" 
        AutoGenerateColumns="false" onrowdeleting="GridViewFavorite_RowDeleting">
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="#ff0066" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
        <RowStyle BackColor="White" ForeColor="#ff0066" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
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
                    <asp:HyperLink ID="HyperLinkYouTube" NavigateUrl='<%# Bind("YoutubeLink") %>' Text='<%# Bind("SongName") %>' runat="server"></asp:HyperLink>
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
                    <asp:LinkButton ID="LinkButtonDelete" CommandName="Delete" runat="server">Unfavorite</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <a herf="www.github.com"> github </a>
</asp:Content>
