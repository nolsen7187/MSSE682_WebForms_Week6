<%@ Page Title="Reports" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ReportList.aspx.cs" Inherits="ReportList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <nav>
        <ul id="menu">
            <li><a id="registerLink" runat="server" href="~/Reports/Rpt_Customer">Customer Report</a></li>
            <li><a id="loginLink" runat="server" href="~/Reports/Rpt_SalesRep">Sales Rep Report</a></li>                
        </ul>
    </nav>  
</asp:Content>

