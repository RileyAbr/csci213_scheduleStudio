<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="logon.aspx.cs" Inherits="logon" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
    <br />
</p>
<p>
&nbsp;
    </p>
<p>
    <asp:Login ID="Login1" runat="server" Height="250px" Width="315px">
    </asp:Login>
</p>
<asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="Login1" />
<br />
</asp:Content>

