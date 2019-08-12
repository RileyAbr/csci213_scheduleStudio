<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MailSender.aspx.cs" Inherits="MailSender" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style3 {
            font-size: large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p class="auto-style3">
        <strong>To:&nbsp;&nbsp;
        <asp:TextBox ID="TextBox4" runat="server" Width="788px"></asp:TextBox>
        </strong>
    </p>
    <p class="auto-style3">
        <strong>From:
        <asp:TextBox ID="TextBox1" runat="server" Width="778px"></asp:TextBox>
        </strong>
    </p>
    <p class="auto-style3">
        <strong>Subject:&nbsp;
        <asp:TextBox ID="TextBox2" runat="server" Width="758px"></asp:TextBox>
        </strong>
    </p>
    <p class="auto-style3">
        <strong>Message:</strong></p>
    <p class="auto-style3">
        <asp:TextBox ID="TextBox3" runat="server" Height="304px" Width="833px"></asp:TextBox>
    </p>
    <p class="auto-style3">
        &nbsp;</p>
    <p class="auto-style3">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="sendBTN" runat="server" Height="71px" Text="Send Message" Width="176px" OnClick="Button1_Click" BackColor="#006699" style="font-weight: 700; color: #FFFFFF; font-size: large"/>
    </p>
    <p class="auto-style3">
        &nbsp;</p>
</asp:Content>

