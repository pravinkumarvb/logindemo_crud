<%@ Page Title="Employee Master" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="EmpMaster.aspx.cs" Inherits="Admin_EmpMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .auto-style3 {
        text-align: right;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center><h2>Employee Master</h2></center>
    <div>

        <table class="auto-style1">
            <tr>
                <td class="auto-style3">Enter Full Name:</td>
                <td>
                    <asp:TextBox ID="txtFullName" runat="server" MaxLength="100" Width="284px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFullName" Display="Dynamic" ErrorMessage="Required" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Select Designation:</td>
                <td>
                    <asp:DropDownList ID="ddlDes" runat="server" DataSourceID="SqlDataSource1" 
                        DataTextField="DesName" DataValueField="DesID">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:MyCon %>" 
                        SelectCommand="SELECT [DesID], [DesName] FROM [Desg] ORDER BY [DesID]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Enter Salary:</td>
                <td>
                    <asp:TextBox ID="txtSalary" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtSalary" Display="Dynamic" ErrorMessage="Required" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtSalary" Display="Dynamic" ErrorMessage="Enter Only Numeric values" ForeColor="Red" Operator="DataTypeCheck" SetFocusOnError="True" Type="Double"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:HiddenField ID="hdfEmpID" runat="server" />
                </td>
                <td>
                    <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
                    <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" />
                    <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
        </table>

    </div>
    <div>
        <center>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" DataKeyNames="EmpID" DataSourceID="SqlDataSource2" CellPadding="4" ForeColor="#333333" 
            OnRowCommand="GridView1_RowCommand">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="EmpID" HeaderText="Emp ID" InsertVisible="False" ReadOnly="True" SortExpression="EmpID" />
                <asp:BoundField DataField="EmpName" HeaderText="Full Name" SortExpression="EmpName" />
                <asp:BoundField DataField="DesName" HeaderText="Designation" SortExpression="DesName" />
                <asp:BoundField DataField="EmpSalary" HeaderText="Salary" SortExpression="EmpSalary" />
                <asp:ButtonField CommandName="Ed" Text="Edit" />
                <asp:ButtonField CommandName="Del" Text="Delete" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:MyCon %>" 
            SelectCommand="SELECT Emp.EmpID, Emp.EmpName, Desg.DesName, Emp.EmpSalary FROM Desg INNER JOIN Emp ON Desg.DesID = Emp.DesID ORDER BY Emp.EmpID"></asp:SqlDataSource>
        </center>
    </div>
</asp:Content>

