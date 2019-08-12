<%@ Page Title="Student Appointments" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdvisorManageAppointments.aspx.cs" Inherits="AdvisorManageAppointments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style3 {
            font-size: large;
        }
        .auto-style4 {
            font-size: medium;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal" AutoGenerateColumns="False" DataKeyNames="AppointmentID" DataSourceID="AdvisorAppointment">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="AppointmentID" HeaderText="AppointmentID" InsertVisible="False" ReadOnly="True" SortExpression="AppointmentID" />
            <asp:BoundField DataField="StudentName" HeaderText="StudentName" ReadOnly="True" SortExpression="StudentName" />
            <asp:BoundField DataField="AppointmentDate" HeaderText="AppointmentDate" SortExpression="AppointmentDate" />
            <asp:BoundField DataField="AppointmentTime" HeaderText="AppointmentTime" SortExpression="AppointmentTime" />
            <asp:BoundField DataField="AppointmentReason" HeaderText="AppointmentReason" SortExpression="AppointmentReason" />
        </Columns>
        <FooterStyle BackColor="White" ForeColor="#333333" />
        <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="White" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F7F7F7" />
        <SortedAscendingHeaderStyle BackColor="#487575" />
        <SortedDescendingCellStyle BackColor="#E5E5E5" />
        <SortedDescendingHeaderStyle BackColor="#275353" />
    </asp:GridView>
    <asp:SqlDataSource ID="AdvisorAppointment" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringStudent %>" SelectCommand="SELECT ap.AppointmentID, st.StudentFirstName + ' ' + st.StudentLastName AS StudentName, ap.AppointmentDate, ap.AppointmentTime, ap.AppointmentReason FROM AppointmentTable AS ap INNER JOIN StudentTable AS st ON ap.StudentID = st.StudentID WHERE (ap.AdvisorID = @AdvisorID)">
        <SelectParameters>
            <asp:SessionParameter Name="AdvisorID" SessionField="AdvID" />
        </SelectParameters>
</asp:SqlDataSource>
    <asp:Label ID="notifLb" runat="server"></asp:Label>
    <br />
    <br />
    <span class="auto-style3">Add Appointment</span><table style="width:100%;">
        <tr>
            <td>Date</td>
            <td>Time</td>
            <td>Reason</td>
        </tr>
        <tr>
            <td>
                <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
            </td>
            <td>XX:XX:XX Format<br />
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:TextBox ID="TextBox3" runat="server" Height="83px" Width="192px"></asp:TextBox>
            </td>
        </tr>
        </table>
    <asp:Button ID="addBtn" runat="server" Height="30px" OnClick="addBtn_Click" Text="Add Appointment" Width="150px" />
    <br />
    <br />
    <span class="auto-style3">Delete Appointment<br />
    <span class="auto-style4">Select an entry above, then chose the button to delete the appointment</span></span><br />
    <asp:Button ID="dltBtn" runat="server" Height="30px" OnClick="dltBtn_Click" Text="Delete Appointment" Width="150px" />
</asp:Content>

