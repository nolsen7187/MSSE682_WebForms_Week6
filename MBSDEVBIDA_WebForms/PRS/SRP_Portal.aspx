<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="SRP_Portal.aspx.cs" Inherits="SRP_Portal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <nav>
        <ul id="menu">Sales Rep Portal Links:
            <li><a id="registerLink" runat="server" href="~/DataGrid/Tbl_CustInvoiceJour">CustInvoiceJour</a></li>
            <li><a id="loginLink" runat="server" href="~/DataGrid/Tbl_CustInvoiceTrans">CustInvoiceTrans</a></li>  
            <li><a id="A1" runat="server" href="~/Reports/Rpt_SalesRep">Sales Rep Report</a></li>     
            <li><a id="adminLink" runat="server" href="~/Admin">Admin</a></li>                     
        </ul>
    </nav>  
</asp:Content>

