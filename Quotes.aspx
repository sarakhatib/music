<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Quotes.aspx.cs" Inherits="Quotes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <br />
    <center>
        <asp:DataList ID="DataListQuotes" runat="server">
            <HeaderTemplate>
                <font face="Blackadder ITC" size="7" color="#ff0066">Quotes </font>
            </HeaderTemplate>
            <ItemTemplate>
                <asp:Label ID="LabelQuote" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"TheQuote")%>'></asp:Label>
                <br />
               - <asp:Label ID="LabelWrittenBy" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"WrittenBy")%>'></asp:Label>
            </ItemTemplate>
        </asp:DataList>
    </center>
    <asp:LinkButton ID="LinkButtonGetAllQuotes" runat="server" 
        onclick="LinkButtonGetAllQuotes_Click">Show All Quotes</asp:LinkButton>
</asp:Content>
