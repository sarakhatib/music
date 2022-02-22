<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="OurSongs.aspx.cs" Inherits="OurSongs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h2>
        <font color="#ff0066">NOW You Can Listen To Mutual Songs Between You And Your Friends.</font></h2>
    <h4>
        <a href="ShareMusicWithFriends.aspx">Click Here To Start Sharing!</a></h4>
    <asp:Label ID="LabelError" runat="server" Text=""></asp:Label>
    <center>
        <asp:GridView ID="GridViewSongs" runat="server" AutoGenerateColumns="False" BackColor="White"
            BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1"
            GridLines="None" ShowFooter="true" OnRowCommand="GridViewSongs_RowCommand" 
            onrowdeleting="GridViewSongs_RowDeleting" 
            onrowediting="GridViewSongs_RowEditing" 
            onrowupdating="GridViewSongs_RowUpdating" 
            onrowcancelingedit="GridViewSongs_RowCancelingEdit">
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
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBoxEditSongName" runat="server" Text='<%# Bind("SongName") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorEditSongName" runat="server"
                            ControlToValidate="TextBoxEditSongName" Text="*" ForeColor="Red" ValidationGroup="Edit"
                            ErrorMessage="Song's Name is Required"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="TextBoxInsertSong" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorInsertSongName" runat="server"
                            ControlToValidate="TextBoxInsertSong" Text="*" ForeColor="Red" ValidationGroup="Insert"
                            ErrorMessage="Song's Name is Required"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Song's Artist">
                    <ItemTemplate>
                        <asp:Label ID="LabelSongArtist" runat="server" Text='<%# Bind("SongArtist") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBoxEditArtist" runat="server" Text='<%# Bind("SongArtist") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorEditSongArtist" runat="server"
                            ControlToValidate="TextBoxEditArtist" Text="*" ForeColor="Red" ValidationGroup="Edit"
                            ErrorMessage="Song's Artist is Required"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="TextBoxInsertArtist" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorInsertSongArtist" runat="server"
                            ControlToValidate="TextBoxInsertArtist" Text="*" ForeColor="Red" ValidationGroup="Insert"
                            ErrorMessage="Song's Artist is Required"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="YouTube Link For The Song">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButtonYouTubeLink" runat="server" Text='<%# Bind("YouTubeLink") %>'></asp:LinkButton>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBoxEditYouTubeLink" Text='<%# Bind("YouTubeLink") %>' runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator" runat="server" ControlToValidate="TextBoxEditYouTubeLink"
                            Text="*" ForeColor="Red" ValidationGroup="Edit" ErrorMessage="Song's YouTubeLink is Required"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="TextBoxInsertYouTubeLink" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorInsertYouTubeLink" runat="server"
                            ControlToValidate="TextBoxInsertYouTubeLink" Text="*" ForeColor="Red" ValidationGroup="Insert"
                            ErrorMessage="Song's YouTubeLink is Required"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Album">
                    <ItemTemplate>
                        <asp:Label ID="LabelAlbum" runat="server" Text='<%# Bind("Album") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBoxAlbum" Text='<%# Bind("Album") %>' runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorEditAlbum" runat="server" ControlToValidate="TextBoxAlbum"
                            Text="*" ForeColor="Red" ValidationGroup="Edit" ErrorMessage="Song's Album is Required"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="TextBoxInsertAlbum" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorInsertAlbum" runat="server"
                            ControlToValidate="TextBoxInsertAlbum" Text="*" ForeColor="Red" ValidationGroup="Insert"
                            ErrorMessage="Song's Album is Required"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Image ID="ImageArtist" runat="server" Width="100" Height="80" ImageUrl='<%# Bind("ImageOfArtist") %>' />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:FileUpload ID="FileUploadEditImage" runat="server" />
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:FileUpload ID="FileUploadImageOfArtist" runat="server" />
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Rate">
                    <ItemTemplate>
                        <asp:Label ID="LabelRate" runat="server" Text='<%# Bind("SongRate") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownListEditRate" runat="server">
                            <asp:ListItem Text="Rate This Song" Value="-1"></asp:ListItem>
                            <asp:ListItem Text="0" Value="0"></asp:ListItem>
                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                            <asp:ListItem Text="3" Value="3"></asp:ListItem>
                            <asp:ListItem Text="4" Value="4"></asp:ListItem>
                            <asp:ListItem Text="5" Value="5"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorEditRate" runat="server" ControlToValidate="DropDownListEditRate"
                            Text="*" ForeColor="Red" ValidationGroup="Edit" ErrorMessage="Song's Rate is Required"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:DropDownList ID="DropDownListRate" runat="server">
                            <asp:ListItem Text="Rate This Song" Value="-1"></asp:ListItem>
                            <asp:ListItem Text="0" Value="0"></asp:ListItem>
                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                            <asp:ListItem Text="3" Value="3"></asp:ListItem>
                            <asp:ListItem Text="4" Value="4"></asp:ListItem>
                            <asp:ListItem Text="5" Value="5"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorInsertRate" runat="server"
                            ControlToValidate="DropDownListRate" Text="*" ForeColor="Red" ValidationGroup="Insert"
                            ErrorMessage="Song's Rate is Required"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Favorite">
                    <ItemTemplate>
                        <asp:ImageButton ID="ImageButtonFavorite" CommandName="ButtonImage" CommandArgument='<%# Bind("SongID") %>'
                            Width="50" Height="50" ImageUrl="~/Images/EmptyStar.png" runat="server" />
                    </ItemTemplate>
                    <EditItemTemplate>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:LinkButton ID="LinkButtonInsert" CommandName="Insert" runat="server" Text="Insert"></asp:LinkButton>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Add To Playlist">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButtonAddToPlaylist" CommandName="AddToPlaylist" CommandArgument='<%# Bind("SongID") %>'
                            runat="server"><font size="10">+</font></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:ImageButton ID="ImageButtonLike" Width="50" CommandName="Like" CommandArgument='<%# Bind("SongID") %>'
                            Height="50" ImageUrl="~/Images/like.png" runat="server" />
                        &nbsp
                        <asp:ImageButton ID="ImageButtonDislike" Width="50" Height="50" CommandName="Dislike"
                            CommandArgument='<%# Bind("SongID") %>' ImageUrl="~/Images/dislike.png" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButtonEdit" CommandName="Edit" runat="server">Edit</asp:LinkButton>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:LinkButton ID="LinkButtonUpdate" CommandArgument='<%# Bind("SongID") %>' runat="server" CommandName="Update">Update</asp:LinkButton>
                        <asp:LinkButton ID="LinkButtonCancel1" CausesValidation="false"  CommandName="Cancel" runat="server">Cancel</asp:LinkButton>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                       <asp:LinkButton ID="LinkButtonDelete" CommandArgument='<%# Bind("SongID") %>' CommandName="Delete" runat="server">Delete</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </center>
    <asp:ValidationSummary ID="ValidationSummary" HeaderText="Please Fix The Following Mistakes:"
        ForeColor="Red" runat="server" />
    <asp:GridView ID="GridViewPlayList" BackColor="#ff6699" runat="server" ShowFooter="true"
        AutoGenerateColumns="false" OnRowCommand="GridViewPlayList_RowCommand">
        <Columns>
            <asp:TemplateField HeaderText="Choose Playlist">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButtonPlaylistName" CommandName="InsertPlaylist" CommandArgument='<%# Bind("PlaylistName") %>'
                        Text='<%# Bind("PlaylistName") %>' runat="server"></asp:LinkButton>
                </ItemTemplate>
                <FooterTemplate>
                    Add New Playlist:
                    <asp:TextBox ID="TextBoxNewPlaylist" runat="server"></asp:TextBox>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <FooterTemplate>
                    <asp:LinkButton ID="LinkButtonInsert" CommandName="Insert" runat="server">Add</asp:LinkButton>
                </FooterTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>
