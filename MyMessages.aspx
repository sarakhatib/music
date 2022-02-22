<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="MyMessages.aspx.cs" Inherits="MyMessages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Label ID="LabelError" runat="server" Text=""></asp:Label>
  <center>
    <asp:DataList ID="DataListMessages" runat="server" 
    onitemcommand="DataListMessages_ItemCommand" 
    onitemdatabound="DataListMessages_ItemDataBound" 
        ondeletecommand="DataListMessages_DeleteCommand" BackColor="#FF99FF" 
        BorderColor="#FF6699" BorderStyle="Double" CaptionAlign="Top" CellPadding="2" 
        CellSpacing="2" ForeColor="#CC0066" RepeatColumns="2">
        <HeaderTemplate>
            <asp:Label ID="LabelHeader" runat="server" Text="My Messages:"></asp:Label>
        </HeaderTemplate>
        <ItemTemplate>
            <table border="2">
                <tr>
                    <td>
                        From:
                    </td>
                    <td>
                        <asp:Label ID="LabelFrom" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"FromUserID")%>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        Subject:
                    </td>
                    <td>
                        <asp:Label ID="LabelSubject" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"Subject")%>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:LinkButton ID="LinkButtonOpen" CommandName="OpenMessage" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"MessageID")%>'
                            runat="server" Text="Open"></asp:LinkButton>
                    </td>
                    <td>
                        <asp:LinkButton ID="LinkButtonMarkAs" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"MessageID")%>' CommandName="Mark As" runat="server"></asp:LinkButton> 
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="LabelTime" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"SentTime")%>'></asp:Label>
                    </td>
                </tr>
                <tr>
                <td colspan="2">
                    <asp:LinkButton ID="LinkButtonDelete" Text="Delete" CommandName="Delete" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"MessageID")%>' runat="server"></asp:LinkButton>
                </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:DataList>
    </center>
</asp:Content>
