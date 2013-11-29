<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="DataGridList.aspx.cs" Inherits="DataGridList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <nav>
        <ul id="menu">
            <li><a id="registerLink" runat="server" href="~/DataGrid/Tbl_CustInvoiceJour">CustInvoiceJour</a></li>
            <li><a id="loginLink" runat="server" href="~/DataGrid/Tbl_CustInvoiceTrans">CustInvoiceTrans</a></li>                
        </ul>
    </nav>  
</asp:Content>

