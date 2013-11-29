<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master"  Debug="true" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
<hgroup class="title">
    <h1><%: Title %></h1>
</hgroup>
<p>
    <form id="form1" >
    <div class="auto-style1">
    
        <strong style="text-align: left"><br />
        <br />
        <asp:Label ID="Label1" runat="server" Visible="False"></asp:Label>
        </strong>
    
    </div>
        <table class="auto-style2">
            <tr>
                <td class="auto-style6">Username</td>
                <td class="auto-style7">
                    <asp:TextBox ID="TextBoxUserName" runat="server" MaxLength="20" Width="180px"></asp:TextBox>
                </td>
                <td class="auto-style8">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="TextBoxUserName" ErrorMessage="Username is required." ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Password</td>
                <td class="auto-style5">
                    <asp:TextBox ID="TextBoxPassword" runat="server" MaxLength="20" TextMode="Password" Width="180px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="TextBoxPassword" ErrorMessage="Password is required." ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style5">
                    <asp:Button ID="LoginButton" runat="server" OnClick="LoginButton_Click" Text="Login" Width="100px" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
                <td>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Registration.aspx">Register New User Here</asp:HyperLink>
                </td>
            </tr>
        </table>
    </form>
</p>
</asp:Content>