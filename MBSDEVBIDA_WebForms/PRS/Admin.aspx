<%@ Page Title="User Administration" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Admin" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <hgroup class="title">
    <h1><%: Title %></h1>
</hgroup>
<article>
    <form id="form1" >
    <div>
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AXMbsDevConnectionString %>" SelectCommand="SELECT * FROM [MBSWBWEBUSERCONTACT]" OnSelecting="SqlDataSource1_Selecting"></asp:SqlDataSource>
    
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="WEBLOGON,CONTACTPERSONID,DATAAREAID" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="ACCOUNTNUM" HeaderText="ACCOUNTNUM" SortExpression="ACCOUNTNUM" />
                <asp:BoundField DataField="NAME" HeaderText="NAME" SortExpression="NAME" />
                <asp:BoundField DataField="EMAIL" HeaderText="EMAIL" SortExpression="EMAIL" />
                <asp:BoundField DataField="WEBLOGON" HeaderText="WEBLOGON" ReadOnly="True" SortExpression="WEBLOGON" />
                <asp:BoundField DataField="WEBPASSWORD" HeaderText="WEBPASSWORD" SortExpression="WEBPASSWORD" />
                <asp:BoundField DataField="CONTACTPERSONID" HeaderText="CONTACTPERSONID" ReadOnly="True" SortExpression="CONTACTPERSONID" />
                <asp:BoundField DataField="SALESREPID" HeaderText="SALESREPID" SortExpression="SALESREPID" />
                <asp:BoundField DataField="DATAAREAID" HeaderText="DATAAREAID" ReadOnly="True" SortExpression="DATAAREAID" />
                <asp:BoundField DataField="RECID" HeaderText="RECID" InsertVisible="False" ReadOnly="True" SortExpression="RECID" />
            </Columns>
        </asp:GridView>
    
    </div>
    </form>
</article>
</asp:Content>