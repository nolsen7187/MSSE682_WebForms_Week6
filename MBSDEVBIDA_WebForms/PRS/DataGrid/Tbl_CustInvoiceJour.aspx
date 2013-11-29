<%@ Page Title="CustInvoiceJour DataGrid" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Tbl_CustInvoiceJour.aspx.cs" Inherits="Admin" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <hgroup class="title">
    <h1><%: Title %></h1>
</hgroup>
<article>
    <form id="form1" >
    <div>
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AXMbsDevConnectionString %>" SelectCommand="SELECT * FROM [CUSTINVOICEJOUR]" OnSelecting="SqlDataSource1_Selecting"></asp:SqlDataSource>
    
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="DATAAREAID,RECID" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="SALESID" HeaderText="SALESID" SortExpression="SALESID" />
                <asp:BoundField DataField="ORDERACCOUNT" HeaderText="ORDERACCOUNT" SortExpression="ORDERACCOUNT" />
                <asp:BoundField DataField="INVOICEDATE" HeaderText="INVOICEDATE" SortExpression="INVOICEDATE" />
                <asp:BoundField DataField="SALESBALANCE" HeaderText="SALESBALANCE" SortExpression="SALESBALANCE" />
                <asp:BoundField DataField="INVOICEAMOUNT" HeaderText="INVOICEAMOUNT" SortExpression="INVOICEAMOUNT" />
                <asp:BoundField DataField="INVOICEID" HeaderText="INVOICEID" SortExpression="INVOICEID" />
                <asp:BoundField DataField="SUMTAX" HeaderText="SUMTAX" SortExpression="SUMTAX" />
                <asp:BoundField DataField="MBSPRIMARYSALESREP" HeaderText="MBSPRIMARYSALESREP" SortExpression="MBSPRIMARYSALESREP" />
                <asp:BoundField DataField="DATAAREAID" HeaderText="DATAAREAID" ReadOnly="True" SortExpression="DATAAREAID" />
                <asp:BoundField DataField="RECID" HeaderText="RECID" InsertVisible="False" ReadOnly="True" SortExpression="RECID" />
            </Columns>
        </asp:GridView>
    
    </div>
    </form>
</article>
</asp:Content>