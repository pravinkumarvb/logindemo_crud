<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            color: #FF0000;
        }
        .auto-style2 {
            width:auto;
            border:1px solid black;
        }
        .auto-style3 {
            text-align: right;
        }
        .auto-style4 {
            text-align: center;
            color: #FFFFFF;
            background-color: #66CCFF;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <center><h2 class="auto-style1">Employee Management System</h2></center>
    <div>
    <center>
        <table class="auto-style2" style="background-color:aquamarine">
            <tr>
                <td class="auto-style4" colspan="2"><strong>Login</strong></td>
            </tr>
            <tr>
                <td class="auto-style3">Enter Username:</td>
                <td>
                    <asp:TextBox ID="txtUserName" runat="server" MaxLength="50" Width="239px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserName" Display="Dynamic" ErrorMessage="Required" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Enter Password:</td>
                <td>
                    <asp:TextBox ID="txtPassword" runat="server" MaxLength="50" TextMode="Password" Width="239px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword" Display="Dynamic" ErrorMessage="Required" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
                    <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/CreateNewUser.aspx">Create New Account</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/PasswordRecovery.aspx">Forgot Password?</asp:HyperLink>
                </td>
            </tr>
        </table>
    </center>
    </div>
    </form>
</body>
</html>
