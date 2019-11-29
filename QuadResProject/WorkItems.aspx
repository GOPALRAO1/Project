<%@ Page Title="" Language="C#" MasterPageFile="~/Homepage.Master" AutoEventWireup="true" CodeBehind="WorkItems.aspx.cs" Inherits="QuadResProject.WorkItems" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .table{
            
        }
        .container-fluid{
            margin-left:auto;
            margin-right:auto;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">

        <div class="col-md-12">
    <div class="align-content-center"> <h1 style="font-weight:700">Work Items</h1>
        <asp:GridView ID="GridView1" runat="server" CssClass="table" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="WorkItemId" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" ShowFooter="True" OnDataBound="OnDataBound">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775"/>
            <Columns>
                <asp:TemplateField FooterText="WorkItemId" HeaderText="WorkItemId" SortExpression="WorkItemId">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("WorkItemId") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("WorkItemId") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox6" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                   
                </asp:TemplateField>
                <asp:TemplateField FooterText="AssignedTo" HeaderText="AssignedTo" SortExpression="AssignedTo">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("AssignedTo") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("AssignedTo") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DropDownList1" InitialValue="--None--" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField FooterText="Title" HeaderText="Title" SortExpression="Title">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Title") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Title") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="TextBox7" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox7" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField FooterText="TaskDescription" HeaderText="TaskDescription" SortExpression="TaskDescription">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("TaskDescription") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("TaskDescription") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="TextBox8" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox8" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField FooterText="TaskStatus" HeaderText="TaskStatus" SortExpression="TaskStatus">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("TaskStatus") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("TaskStatus") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control">
                            <asp:ListItem>Do</asp:ListItem>
                            <asp:ListItem>Doing</asp:ListItem>
                            <asp:ListItem>Done</asp:ListItem>
                        </asp:DropDownList>
                        
                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="DropDownList2" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>--%>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField FooterText="TeamName" HeaderText="TeamName" SortExpression="TeamName">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("TeamName") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("TeamName") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:DropDownList ID="DropDownList3" runat="server" CssClass="form-control">
                            
                        </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="DropDownList3" InitialValue="--None--" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                        <asp:Button ID="Button1" runat="server" Text="+CreateNewWorkItem" CssClass="form-control" OnClick="btnCreateWorkItem_Click" />
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
            </Columns>
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
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:constr1 %>" DeleteCommand="DELETE FROM WorkItemNewtbl WHERE (WorkItemId = @original_WorkItemId) AND (AssignedTo = @original_AssignedTo OR AssignedTo IS NULL AND @original_AssignedTo IS NULL) AND (Title = @original_Title OR Title IS NULL AND @original_Title IS NULL) AND (TaskDescription = @original_TaskDescription OR TaskDescription IS NULL AND @original_TaskDescription IS NULL) AND (TaskStatus = @original_TaskStatus OR TaskStatus IS NULL AND @original_TaskStatus IS NULL) AND (TeamNameId = @original_TeamNameId OR TeamNameId IS NULL AND @original_TeamNameId IS NULL)" InsertCommand="INSERT INTO WorkItemNewtbl(WorkItemId, AssignedTo, Title, TaskDescription, TaskStatus, TeamNameId, Team) VALUES (@WorkItemId, @AssignedTo, @Title, @TaskDescription, @TaskStatus, @TeamNameId, @TeamName)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT w.WorkItemId, w.AssignedTo, w.Title, w.TaskDescription, w.TaskStatus, t.TeamName FROM WorkItemNewtbl AS w INNER JOIN TeamNewtbl AS t ON w.TeamNameId = t.TeamId" UpdateCommand="UPDATE [WorkItemNewtbl] SET [AssignedTo] = @AssignedTo, [Title] = @Title, [TaskDescription] = @TaskDescription, [TaskStatus] = @TaskStatus, [TeamNameId] = @TeamNameId WHERE [WorkItemId] = @original_WorkItemId AND (([AssignedTo] = @original_AssignedTo) OR ([AssignedTo] IS NULL AND @original_AssignedTo IS NULL)) AND (([Title] = @original_Title) OR ([Title] IS NULL AND @original_Title IS NULL)) AND (([TaskDescription] = @original_TaskDescription) OR ([TaskDescription] IS NULL AND @original_TaskDescription IS NULL)) AND (([TaskStatus] = @original_TaskStatus) OR ([TaskStatus] IS NULL AND @original_TaskStatus IS NULL)) AND (([TeamNameId] = @original_TeamNameId) OR ([TeamNameId] IS NULL AND @original_TeamNameId IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_WorkItemId" Type="String" />
                <asp:Parameter Name="original_AssignedTo" Type="String" />
                <asp:Parameter Name="original_Title" Type="String" />
                <asp:Parameter Name="original_TaskDescription" Type="String" />
                <asp:Parameter Name="original_TaskStatus" Type="String" />
                <asp:Parameter Name="original_TeamNameId" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="WorkItemId" Type="String" />
                <asp:Parameter Name="AssignedTo" Type="String" />
                <asp:Parameter Name="Title" Type="String" />
                <asp:Parameter Name="TaskDescription" Type="String" />
                <asp:Parameter Name="TaskStatus" Type="String" />
                <asp:Parameter Name="TeamNameId" Type="String" />
                <asp:Parameter Name="TeamName" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="AssignedTo" Type="String" />
                <asp:Parameter Name="Title" Type="String" />
                <asp:Parameter Name="TaskDescription" Type="String" />
                <asp:Parameter Name="TaskStatus" Type="String" />
                <asp:Parameter Name="TeamNameId" Type="String" />
                <asp:Parameter Name="original_WorkItemId" Type="String" />
                <asp:Parameter Name="original_AssignedTo" Type="String" />
                <asp:Parameter Name="original_Title" Type="String" />
                <asp:Parameter Name="original_TaskDescription" Type="String" />
                <asp:Parameter Name="original_TaskStatus" Type="String" />
                <asp:Parameter Name="original_TeamNameId" Type="String" />
            </UpdateParameters>
    </asp:SqlDataSource>
        <br />
        <br />
        </div>
        </div>
        </div>
</asp:Content>
