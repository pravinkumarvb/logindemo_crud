<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        Select Designation:<asp:DropDownList ID="ddlDes" runat="server" AutoPostBack="True" 
            DataSourceID="SqlDataSource1" DataTextField="DesName" DataValueField="DesID">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:MyCon %>" 
            SelectCommand="SELECT [DesID], [DesName] FROM [Desg] ORDER BY [DesID]"></asp:SqlDataSource>
        <br />
        <br />
        Select Employee:<asp:DropDownList ID="ddlEmp" runat="server" DataSourceID="SqlDataSource2" 
            DataTextField="EmpName" DataValueField="EmpID">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MyCon %>" 
            SelectCommand="SELECT [EmpID], [EmpName] FROM [Emp] WHERE ([DesID] = @DesID) ORDER BY [EmpName]">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlDes" Name="DesID" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="EmpID" DataSourceID="SqlDataSource3">
            <Columns>
                <asp:BoundField DataField="EmpID" HeaderText="EmpID" InsertVisible="False" ReadOnly="True" SortExpression="EmpID" />
                <asp:BoundField DataField="EmpName" HeaderText="EmpName" SortExpression="EmpName" />
                <asp:BoundField DataField="DesName" HeaderText="DesName" SortExpression="DesName" />
                <asp:BoundField DataField="EmpSalary" HeaderText="EmpSalary" SortExpression="EmpSalary" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:MyCon %>" SelectCommand="SELECT Emp.EmpID, Emp.EmpName, Desg.DesName, Emp.EmpSalary FROM Desg INNER JOIN Emp ON Desg.DesID = Emp.DesID WHERE (Emp.DesID = @DesID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlDes" Name="DesID" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
