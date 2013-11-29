<%@ Page Title="Customer Business Intel" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Rpt_Customer.aspx.cs" Inherits="Rpt_Customer" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" Height="443px" style="margin-right: 138px" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="1170px">
        <LocalReport ReportPath="Reports\Rpt_Customer.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="SqlDataSource1" Name="DataSet1" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AXMbsDevConnectionString %>" SelectCommand="SELECT * FROM [CUSTINVOICEJOUR]"></asp:SqlDataSource>
</asp:Content>

