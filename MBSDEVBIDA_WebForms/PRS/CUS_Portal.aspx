<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="CUS_Portal.aspx.cs" Inherits="CUS_Portal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <nav>
        <ul id="menu">Customer Portal Links:
            <li><a id="registerLink" runat="server" href="~/DataGrid/Tbl_CustInvoiceJour">CustInvoiceJour</a></li>
            <li><a id="loginLink" runat="server" href="~/DataGrid/Tbl_CustInvoiceTrans">CustInvoiceTrans</a></li>  
            <li><a id="A1" runat="server" href="~/Reports/Rpt_Customer">Customer Report</a></li>
            <li><a id="A2" runat="server" href="~/Secure">Logout</a></li>                 
        </ul>
    </nav>  
</asp:Content>

