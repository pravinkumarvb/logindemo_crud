<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PasswordRecovery.aspx.cs" Inherits="PasswordRecovery" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Password Recovery : MySite</title>
    <style type="text/css">
        .auto-style1 {
            width:auto;
            background-color:aquamarine;
        }
        .auto-style2 {
            text-align: right;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <center><h2>Password Recovery Wizard</h2></center>
    </div>
        <div>
            <center><asp:Label ID="lblMsg" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label></center>
            <asp:HiddenField ID="hdfUserID" runat="server" />
            <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                <asp:View ID="View1" runat="server">
                    <center>
                    <table class="auto-style1">
                        <tr>
                            <td class="auto-style2">Enter Your Username:</td>
                            <td>
                                <asp:TextBox ID="txtUserName" runat="server" MaxLength="50" Width="288px" ValidationGroup="A"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserName" Display="Dynamic" ErrorMessage="Required" ForeColor="Red" SetFocusOnError="True" ValidationGroup="A"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtUserName" Display="Dynamic" ErrorMessage="Invalid Email" ForeColor="Red" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="A"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>
                                <asp:Button ID="btnNextToSecQue" runat="server" Text="Next" OnClick="btnNextToSecQue_Click" ValidationGroup="A" />
                            </td>
                        </tr>
                    </table>
</center>
                </asp:View>
                <asp:View ID="View2" runat="server">
                 <center>
                    <table class="auto-style1">
                        <tr>
                            <td class="auto-style2">Security Question:</td>
                            <td>
                                <asp:Label ID="lblSecQue" runat="server" Font-Bold="True" ForeColor="Maroon"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">Enter Security Answer:</td>
                            <td>
                                <asp:TextBox ID="txtSecAns" runat="server" MaxLength="100" Width="288px" ValidationGroup="B"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtSecAns" Display="Dynamic" ErrorMessage="Required" ForeColor="Red" SetFocusOnError="True" ValidationGroup="B"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>
                                <asp:Button ID="btnNextToPassword" runat="server" Text="Next" ValidationGroup="B" OnClick="btnNextToPassword_Click" />
                            </td>
                        </tr>
                    </table>
                </center>
                </asp:View>
                <asp:View ID="View3" runat="server">
                    <center>
                        <h3>
                            <asp:Label ID="lblPassword" runat="server" ForeColor="#0066FF" ></asp:Label>
                        </h3>
                    </center>
                </asp:View>
            </asp:MultiView>

        </div>
    </form>
</body>
</html>
