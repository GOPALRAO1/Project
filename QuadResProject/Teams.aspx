<%@ Page Title="" Language="C#" MasterPageFile="~/Homepage.Master" AutoEventWireup="true" CodeBehind="Teams.aspx.cs" Inherits="QuadResProject.Teams" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:gopalConnectionString7 %>" DeleteCommand="DELETE FROM [TeamNewtbl] WHERE [TeamId] = @original_TeamId AND [TeamName] = @original_TeamName" InsertCommand="INSERT INTO [TeamNewtbl] ([TeamName]) VALUES (@TeamName)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [TeamNewtbl]" UpdateCommand="UPDATE [TeamNewtbl] SET [TeamName] = @TeamName WHERE [TeamId] = @original_TeamId AND [TeamName] = @original_TeamName">
            <DeleteParameters>
                <asp:Parameter Name="original_TeamId" Type="Int32" />
                <asp:Parameter Name="original_TeamName" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="TeamName" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="TeamName" Type="String" />
                <asp:Parameter Name="original_TeamId" Type="Int32" />
                <asp:Parameter Name="original_TeamName" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>

    </div>

</asp:Content>
