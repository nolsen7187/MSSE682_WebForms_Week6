<%@ Page Title="CustInvoiceTrans DataGrid" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Tbl_CustInvoiceTrans.aspx.cs" Inherits="Admin" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <hgroup class="title">
    <h1><%: Title %></h1>
</hgroup>
<article>
    <form id="form1" >
    <div>
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AXMbsDevConnectionString %>" SelectCommand="SELECT * FROM [CUSTINVOICETRANS]" OnSelecting="SqlDataSource1_Selecting"></asp:SqlDataSource>
    
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="DATAAREAID,RECID" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="INVOICEID" HeaderText="INVOICEID" SortExpression="INVOICEID" />
                <asp:BoundField DataField="INVOICEDATE" HeaderText="INVOICEDATE" SortExpression="INVOICEDATE" />
                <asp:BoundField DataField="INVENTTRANSID" HeaderText="INVENTTRANSID" SortExpression="INVENTTRANSID" />
                <asp:BoundField DataField="ITEMID" HeaderText="ITEMID" SortExpression="ITEMID" />
                <asp:BoundField DataField="NAME" HeaderText="NAME" SortExpression="NAME" />
                <asp:BoundField DataField="QTY" HeaderText="QTY" SortExpression="QTY" />
                <asp:BoundField DataField="SALESPRICE" HeaderText="SALESPRICE" SortExpression="SALESPRICE" />
                <asp:BoundField DataField="LINEAMOUNT" HeaderText="LINEAMOUNT" SortExpression="LINEAMOUNT" />
                <asp:BoundField DataField="DATAAREAID" HeaderText="DATAAREAID" ReadOnly="True" SortExpression="DATAAREAID" />
                <asp:BoundField DataField="RECID" HeaderText="RECID" InsertVisible="False" ReadOnly="True" SortExpression="RECID" />
            </Columns>
        </asp:GridView>
    
    </div>
    </form>
</article>
</asp:Content>