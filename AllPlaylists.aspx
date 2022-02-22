<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="AllPlaylists.aspx.cs" Inherits="AllPlaylists" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Repeater ID="RepeaterPlaylists" runat="server" 
        onitemcommand="RepeaterPlaylists_ItemCommand">
        <HeaderTemplate>
            <table>
                <tr>
                    <td>
                        <font color="#cc0066">Your Playlists:</font>
                    </td>
                </tr>
        </HeaderTemplate>
        <ItemTemplate>
            <tr bgcolor="#ff6699">
                <td>
                    <asp:LinkButton ID="LinkButtonPlaylist" CommandName="CallPlaylist" Text='<%# Bind("PlaylistName") %>' CommandArgument='<%# Bind("PlaylistName") %>' runat="server"></asp:LinkButton>
                </td>
            </tr>
        </ItemTemplate>
        <AlternatingItemTemplate>
            <tr bgcolor="#ffcccc">
                <td>
                    <asp:LinkButton ID="LinkButtonPlaylist1" CommandName="CallPlaylist" Text='<%# Bind("PlaylistName") %>' CommandArgument='<%# Bind("PlaylistName") %>' runat="server"></asp:LinkButton>
                </td>
            </tr>
        </AlternatingItemTemplate>
        <SeparatorTemplate>
            <tr>
                <td>
                    <hr color="#cc0066" size="5" />
                </td>
            </tr>
        </SeparatorTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:Repeater>
</asp:Content>
