<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="InspiredByMusic.aspx.cs" Inherits="InspiredByMusic" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <font color="#ff0066">
        <h3>
            There is some World Records That Was Inspired By Music, And They Are:</h3>
    </font>
    <asp:Label ID="LabelError" runat="server" Text=""></asp:Label>
    <center>
        <asp:DataList ID="DataListInspiredByMusic" runat="server">
            <ItemTemplate>
                <center>
                    <asp:Image ID="ImageInspired" Width="100" Height="100" ImageUrl='<%# DataBinder.Eval(Container.DataItem,"InspiredPic") %>'
                        runat="server" />
                    <br />
                    <font color="#ff0066" >
                        <asp:Label ID="LabelDescribe" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"Describe") %>'></asp:Label>
                    </font>
                </center>
            </ItemTemplate>
        </asp:DataList>
    </center>
</asp:Content>
