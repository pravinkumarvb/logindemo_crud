<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CreateNewUser.aspx.cs" Inherits="CreateNewUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Create New User</title>
    <style type="text/css">
        .auto-style1 {
            color: #3366FF;
        }

        .auto-style2 {
            width: auto;
        }

        .auto-style3 {
            color: #FF0000;
        }

        .auto-style4 {
            text-align: right;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">
                <div>
                    <center><h2 class="auto-style1">Create New Account</h2></center>
                </div>
                <div>
                    <center>
        <table class="auto-style2" style="background-color:aquamarine">
            <tr>
                <td class="auto-style4">Enter Username (Email):<span class="auto-style3">*</span></td>
                <td>
                    <asp:TextBox ID="txtUserName" runat="server" MaxLength="50" Width="288px"></asp:TextBox>
                    <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserName" Display="Dynamic" ErrorMessage="Required" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtUserName" Display="Dynamic" ErrorMessage="Invalid Email" ForeColor="Red" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">Enter Password:<span class="auto-style3">*</span></td>
                <td>
                    <asp:TextBox ID="txtPassword" runat="server" MaxLength="10" TextMode="Password" Width="288px"></asp:TextBox>
                    <ajaxToolkit:PasswordStrength ID="txtPassword_PasswordStrength" runat="server" BehaviorID="txtPassword_PasswordStrength" MinimumLowerCaseCharacters="1" MinimumNumericCharacters="1" MinimumSymbolCharacters="1" MinimumUpperCaseCharacters="1" PreferredPasswordLength="5" TargetControlID="txtPassword" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword" Display="Dynamic" ErrorMessage="Required" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">Retype Password:<span class="auto-style3">*</span></td>
                <td>
                    <asp:TextBox ID="txtRetypePassword" runat="server" MaxLength="10" TextMode="Password" Width="288px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtRetypePassword" Display="Dynamic" ErrorMessage="Required" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">Select Security Question:<span class="auto-style3">*</span></td>
                <td>
                    <asp:DropDownList ID="ddlSecQue" runat="server" Width="288px">
                        <asp:ListItem>Who is your favourite teacher?</asp:ListItem>
                        <asp:ListItem>Which is your fevorite place?</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">Enter Security Answer:<span class="auto-style3">*</span></td>
                <td>
                    <asp:TextBox ID="txtSecAns" runat="server" MaxLength="100" Width="288px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtSecAns" Display="Dynamic" ErrorMessage="Required" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">Enter Your Full Name:<span class="auto-style3">*</span></td>
                <td>
                    <asp:TextBox ID="txtFullName" runat="server" MaxLength="100" Width="412px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtFullName" Display="Dynamic" ErrorMessage="Required" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:Button ID="btnCreateAccount" runat="server" Text="Create Account" OnClick="btnCreateAccount_Click" />
                </td>
            </tr>
        </table>
        </center>
                </div>
            </asp:View>
            <asp:View ID="View2" runat="server">
                <div>
                    <center>
                        <h2>Your account is created successfully, <a href="Default.aspx">click here to login</a></h2>
                    </center>
                </div>
            </asp:View>
        </asp:MultiView>

    </form>
</body>
</html>
