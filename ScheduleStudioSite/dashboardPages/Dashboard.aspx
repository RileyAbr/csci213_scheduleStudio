<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="dashboardPages_Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="AppointmentID" DataSourceID="DashboardSource" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="AppointmentID" HeaderText="AppointmentID" InsertVisible="False" ReadOnly="True" SortExpression="AppointmentID" />
            <asp:BoundField DataField="AdvisorName" HeaderText="AdvisorName" ReadOnly="True" SortExpression="AdvisorName" />
            <asp:BoundField DataField="AdvisorLocation" HeaderText="AdvisorLocation" SortExpression="AdvisorLocation" />
            <asp:BoundField DataField="AppointmentDate" HeaderText="AppointmentDate" SortExpression="AppointmentDate" />
            <asp:BoundField DataField="AppointmentTime" HeaderText="AppointmentTime" SortExpression="AppointmentTime" />
            <asp:BoundField DataField="AppointmentReason" HeaderText="AppointmentReason" SortExpression="AppointmentReason" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="AppointmentID" DataSourceID="DashboardSource2" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="AppointmentID" HeaderText="AppointmentID" InsertVisible="False" ReadOnly="True" SortExpression="AppointmentID" />
            <asp:BoundField DataField="StudentName" HeaderText="StudentName" ReadOnly="True" SortExpression="StudentName" />
            <asp:BoundField DataField="AppointmentDate" HeaderText="AppointmentDate" SortExpression="AppointmentDate" />
            <asp:BoundField DataField="AppointmentTime" HeaderText="AppointmentTime" SortExpression="AppointmentTime" />
            <asp:BoundField DataField="AppointmentReason" HeaderText="AppointmentReason" SortExpression="AppointmentReason" />
        </Columns>
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />
    </asp:GridView>
    <asp:SqlDataSource ID="DashboardSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringStudent %>" SelectCommand="SELECT ap.AppointmentID, ad.AdvisorFirstName + ' ' + ad.AdvisorLastName AS AdvisorName, ad.AdvisorLocation, ap.AppointmentDate, ap.AppointmentTime, ap.AppointmentReason FROM AppointmentTable AS ap INNER JOIN AdvisorTable AS ad ON ap.AdvisorID = ad.AdvisorID WHERE (ap.StudentID = @StudentID)">
        <SelectParameters>
            <asp:SessionParameter Name="StudentID" SessionField="StdID" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="DashboardSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringStudent %>" SelectCommand="SELECT ap.AppointmentID, st.StudentFirstName + ' ' + st.StudentLastName AS StudentName, ap.AppointmentDate, ap.AppointmentTime, ap.AppointmentReason FROM AppointmentTable AS ap INNER JOIN StudentTable AS st ON ap.StudentID = st.StudentID WHERE (ap.AdvisorID = @AdvisorID)">
        <SelectParameters>
            <asp:SessionParameter Name="AdvisorID" SessionField="AdvID" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:Button ID="appBtn" runat="server" OnClick="appBtn_Click" Text="Manage Appointments" />
    <asp:Button ID="msgBtn" runat="server" OnClick="msgBtn_Click" Text="Manage Messages" />
</asp:Content>

