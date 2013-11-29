<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" %>


<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
<hgroup class="title">
    <h1><%: Title %></h1>
</hgroup>
<p>
    <form id="form1" >
        <table class="auto-style2">
            <tr>
                <td class="auto-style3">UserName</td>
                <td class="auto-style6">
                    <asp:TextBox ID="TextBoxUserName" runat="server" MaxLength="20" Width="180px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBoxUserName" ErrorMessage="Username field required." ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Password</td>
                <td class="auto-style6">
                    <asp:TextBox ID="TextBoxPassword" runat="server" MaxLength="20" TextMode="Password" Width="180px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TextBoxPassword" ErrorMessage="Password required." ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">Retype Password</td>
                <td class="auto-style7">
                    <asp:TextBox ID="TextBoxReTypePassword" runat="server" MaxLength="20" TextMode="Password" Width="180px"></asp:TextBox>
                </td>
                <td class="auto-style5">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="TextBoxReTypePassword" ErrorMessage="Retype Password required." ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBoxPassword" ControlToValidate="TextBoxReTypePassword" ErrorMessage="Password does not match Retyped password."></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Email</td>
                <td class="auto-style6">
                    <asp:TextBox ID="TextEmail" runat="server" MaxLength="50" Width="180px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="TextEmail" ErrorMessage="Email required." ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextEmail" ErrorMessage="Please enter a valid email address." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Full Name</td>
                <td class="auto-style6">
                    <asp:TextBox ID="TextBoxFullName" runat="server" MaxLength="50" Width="180px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="TextBoxFullName" ErrorMessage="Full name required." ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Company</td>
                <td class="auto-style6">
                    <asp:DropDownList ID="DropDownListCompany" runat="server" Width="180px">
                        <asp:ListItem Selected="True">Select One...</asp:ListItem>
                        <asp:ListItem>MBS</asp:ListItem>
                        <asp:ListItem>TOC</asp:ListItem>
                        <asp:ListItem>COP</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="DropDownListCompany" ErrorMessage="Company required." ForeColor="Red" InitialValue="Select One..."></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">AccountNum</td>
                <td class="auto-style7">
                    <asp:TextBox ID="TextBoxAccountNum" runat="server" Width="180px"></asp:TextBox>
                </td>
                <td class="auto-style5">
                </td>
            </tr>
            <tr>
                <td class="auto-style3">ContactPersonId</td>
                <td class="auto-style6">
                    <asp:TextBox ID="TextBoxContactPersonId" runat="server" Width="180px"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">SalesRepId</td>
                <td class="auto-style6">
                    <asp:TextBox ID="TextBoxSalesRepId" runat="server" Width="180px"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                
                <td class="auto-style6">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Register" />
                    </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <asp:Label ID="SuccessLabel" runat="server" ForeColor="Red" style="font-weight: 700"></asp:Label>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style6">
                    <div class="float-center">
                        <script>
                            var d = new Date();
                            document.write(d);
                        </script>
                    </div>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
</p>

</asp:Content>