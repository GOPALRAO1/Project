<%@ Page Title="" Language="C#" MasterPageFile="~/Homepage.Master" AutoEventWireup="true" CodeBehind="QRTimesheet.aspx.cs" Inherits="QuadResProject.AdminTimesheet" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>


    <style>
        /* Set height of the grid so .sidenav can be 100% (adjust if needed) */
        .row.content {
            height: 2000px;
        }

        /* Set gray background color and 100% height */
        .sidenav {
            background-color: ghostwhite;
            height: 100%;
        }

        /* Set black background color, white text and some padding */
        /*footer {
            background-color: #555;
            color: white;
            padding: 15px;
            width: 100%;
        }*/


        /* On small screens, set height to 'auto' for sidenav and grid */
        @media screen and (max-width: 767px) {
            .sidenav {
                height: auto;
                padding: 10%;
            }

            .row.content {
                height: auto;
                background-color: ivory;
            }
        }

        .container-fluid {
            font-family: 'Segoe UI';
        }

        .form-control {
            width: 180px;
        }
        .txtcomment{
            margin-top: 33px;
        }
      
    
    </style>
    

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row content">
            <div class="col-md-10 col-md-offset-1">
                <h2><b>TimeSheet Portal</b></h2>
                <hr />
                <div class="well">
                    
                    <asp:Label ID="labelUserTimesheet" CssClass="UsrTime" runat="server" Text="Click on create to generate your TimeSheet..." Font-Bold="true" Font-Size="20px" style="margin-top:"></asp:Label>
                    <div class="col-md-12">
                        
                        <div class="col-md-3">
                            <asp:Label ID="Label2" runat="server" Text="Employee Name:" Font-Bold="true"></asp:Label>
                            
                            <asp:DropDownList ID="ddlUsers" runat="server" CssClass="btn btn-primary dropdown-toggle" DataSourceID="SqlDataSource2" DataTextField="FullName" DataValueField="FullName">
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-3">
                            <asp:Label ID="Label4" runat="server" Text=""><strong>From: </strong></asp:Label>
                            <asp:TextBox ID="TextBox1" runat="server" TextMode="Date" CssClass=" datepicker form-control"></asp:TextBox>

                        </div>

                        <div class="col-md-3">


                            <asp:Label ID="Label5" runat="server" Text="Label"><strong>To:</strong></asp:Label>
                            <asp:TextBox ID="TextBox2" runat="server" TextMode="Date" CssClass=" datepicker form-control"></asp:TextBox>

                        </div>
                        <div class="col-md-3">
                            <br />
                            <asp:Button ID="Button1" runat="server" OnClick="DisplayEmpTimesheet_Click" Text="Display" CssClass="btn btn-primary" />



                            <asp:Button ID="genTimeSheet" runat="server" OnClick="genTimeSheet_Click1" Text="Create" CssClass="btn btn-primary"/>


                        </div>
                    </div>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:constr1 %>" SelectCommand="SELECT [FullName] FROM [EmployeeData]"></asp:SqlDataSource>
                    <br />
                    <br />
                    <br />


                </div>

                <hr>
                <asp:Label ID="Label3" runat="server" Text="User Timesheet" Font-Bold="true" Font-Size="XX-Large"></asp:Label>
                <br />

                <asp:GridView ID="GridView1" runat="server" CssClass="table" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Sno" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" ShowFooter="True">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" SortExpression="EmployeeID" />
                        <asp:BoundField DataField="Sno" HeaderText="Sno" InsertVisible="False" ReadOnly="True" SortExpression="Sno" />
                        <asp:TemplateField HeaderText="Task" SortExpression="Task">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtTask" runat="server" Text='<%# Bind("Task") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblTask" runat="server" Text='<%# Bind("Task") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txttask" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="TimeSpent" SortExpression="TimeSpent">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtTimeSpent" runat="server" Text='<%# Bind("TimeSpent") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblTimeSpent" runat="server" Text='<%# Bind("TimeSpent") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txttimespent" runat="server" CssClass="form-control"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Remarks" SortExpression="Remarks">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtRemarks" runat="server" Text='<%# Bind("Remarks") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblRemarks" runat="server" Text='<%# Bind("Remarks") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtremarks" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="CreatedDate" SortExpression="CreatedDate">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtCreatedDate" runat="server" Text='<%# Bind("CreatedDate") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblCreatedDate" runat="server" Text='<%# Bind("CreatedDate") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:Button ID="btnInsert" runat="server" CssClass="btn btn-primary" Text="Create" OnClick="btnInsert_Click" />
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


                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:constr1 %>" SelectCommand="SELECT top 30 * FROM [EmployeeTimesheettbl] WHERE ([EmployeeID] = @EmployeeID)" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [EmployeeTimesheettbl] WHERE [Sno] = @original_Sno AND (([EmployeeID] = @original_EmployeeID) OR ([EmployeeID] IS NULL AND @original_EmployeeID IS NULL)) AND (([Task] = @original_Task) OR ([Task] IS NULL AND @original_Task IS NULL)) AND (([TimeSpent] = @original_TimeSpent) OR ([TimeSpent] IS NULL AND @original_TimeSpent IS NULL)) AND (([Remarks] = @original_Remarks) OR ([Remarks] IS NULL AND @original_Remarks IS NULL)) AND (([CreatedDate] = @original_CreatedDate) OR ([CreatedDate] IS NULL AND @original_CreatedDate IS NULL))" InsertCommand="INSERT INTO [EmployeeTimesheettbl] ([EmployeeID], [Task], [TimeSpent], [Remarks], [CreatedDate]) VALUES (@EmployeeID, @Task, @TimeSpent, @Remarks, @CreatedDate)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [EmployeeTimesheettbl] SET [EmployeeID] = @EmployeeID, [Task] = @Task, [TimeSpent] = @TimeSpent, [Remarks] = @Remarks, [CreatedDate] = @CreatedDate WHERE [Sno] = @original_Sno AND (([EmployeeID] = @original_EmployeeID) OR ([EmployeeID] IS NULL AND @original_EmployeeID IS NULL)) AND (([Task] = @original_Task) OR ([Task] IS NULL AND @original_Task IS NULL)) AND (([TimeSpent] = @original_TimeSpent) OR ([TimeSpent] IS NULL AND @original_TimeSpent IS NULL)) AND (([Remarks] = @original_Remarks) OR ([Remarks] IS NULL AND @original_Remarks IS NULL)) AND (([CreatedDate] = @original_CreatedDate) OR ([CreatedDate] IS NULL AND @original_CreatedDate IS NULL))">
                    <DeleteParameters>
                        <asp:Parameter Name="original_Sno" Type="Int32" />
                        <asp:Parameter Name="original_EmployeeID" Type="String" />
                        <asp:Parameter Name="original_Task" Type="String" />
                        <asp:Parameter Name="original_TimeSpent" Type="Double" />
                        <asp:Parameter Name="original_Remarks" Type="String" />
                        <asp:Parameter Name="original_CreatedDate" Type="DateTime" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="EmployeeID" Type="String" />
                        <asp:Parameter Name="Task" Type="String" />
                        <asp:Parameter Name="TimeSpent" Type="Double" />
                        <asp:Parameter Name="Remarks" Type="String" />
                        <asp:Parameter Name="CreatedDate" Type="DateTime" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="txtUserName.Text" Name="EmployeeID" SessionField="UserName" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="EmployeeID" Type="String" />
                        <asp:Parameter Name="Task" Type="String" />
                        <asp:Parameter Name="TimeSpent" Type="Double" />
                        <asp:Parameter Name="Remarks" Type="String" />
                        <asp:Parameter Name="CreatedDate" Type="DateTime" />
                        <asp:Parameter Name="original_Sno" Type="Int32" />
                        <asp:Parameter Name="original_EmployeeID" Type="String" />
                        <asp:Parameter Name="original_Task" Type="String" />
                        <asp:Parameter Name="original_TimeSpent" Type="Double" />
                        <asp:Parameter Name="original_Remarks" Type="String" />
                        <asp:Parameter Name="original_CreatedDate" Type="DateTime" />
                    </UpdateParameters>
                </asp:SqlDataSource>


                <asp:GridView ID="GridView2" runat="server" CssClass="table" CellPadding="4" AutoGenerateColumns="False" ForeColor="#333333" GridLines="None" Visible="False" ShowFooter="True" AllowPaging="false" AllowSorting="True" DataKeyNames="Sno" ShowHeaderWhenEmpty="True" EmptyDataText="No records available">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:TemplateField HeaderText="CreatedDate" SortExpression="CreatedDate">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CreatedDate") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("CreatedDate") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <!--<asp:Button ID="btnReject" runat="server" Text="Reject TimeSheet" CssClass="btn btn-danger"  />-->
                            </FooterTemplate>

                        </asp:TemplateField>
                        <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" SortExpression="EmployeeID" />
                        <asp:BoundField DataField="Sno" HeaderText="Sno" SortExpression="Sno" InsertVisible="False" ReadOnly="True" />
                        <asp:BoundField DataField="Task" HeaderText="Task" SortExpression="Task" />
                        <asp:BoundField DataField="TimeSpent" HeaderText="TimeSpent" SortExpression="TimeSpent" />
                        <asp:TemplateField HeaderText="Remarks" SortExpression="Remarks">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Remarks") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Remarks") %>'></asp:Label>
                            </ItemTemplate>

                            <FooterTemplate>
                                <!--<asp:Button ID="btnApprove" runat="server"  Text="Approve TimeSheet" Font-Size="Medium"  CssClass="btn btn-success" data-toggle="modal" data-target="#myApproveModal"/>-->

                            </FooterTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle ForeColor="White" HorizontalAlign="Center" BackColor="#284775" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>


                <asp:Label ID="lblSuccess" runat="server" Text="" class="label label-success"></asp:Label>
                <asp:Label ID="lblFail" runat="server" Text="" CssClass="label label-danger"></asp:Label>


                <asp:Panel ID="panelVerify" runat="server" CssClass="panel panel-default">
                    <div class="container">
                        
                        <!-- Trigger the modal with a button -->
                        <div class="col-md-12" style="margin-bottom:30px">
                            
                            <div class="col-md-4">
                                <h2 style="font-weight:700">Verify Timesheet</h2>
                                <br />
                        <button type="button" id="ApproveBtn" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myApproveModal" style="margin-top:-5px">Approve TimeSheet</button>
                            </div>
                        <!-- Approve Modal -->
                        <div class="modal fade" id="myApproveModal" role="dialog">
                            <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h4 class="modal-title">Feedback:</h4>
                                        <button type="button" class="close" data-target="#myApproveModal" data-toggle="modal">&times;</button>

                                    </div>
                                    <div class="modal-body">
                                        <p>If any remarks ? Please enter here !</p>
                                        <asp:TextBox ID="txtApproveFB" runat="server" CssClass="form-control" TextMode="MultiLine" Width="70%" Height="40%"></asp:TextBox>
                                    </div>
                                    <div class="modal-footer">
                                        <%--<asp:Button ID="btnApproveSend" runat="server" CssClass="btn btn-primary" data-dismiss="modal" Text="Send" />--%>
                                        <asp:Button ID="btnApproveSend" runat="server" Text="Send" OnClick="btnApproveSend_Click" CssClass="btn btn-primary" />
                                    </div>
                                </div>
                            </div>
                        </div>

                        <br />
                        <br />
                        <div class="container">
                            <div class="col-md-4">
                                <br /><br />
                            <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myRejectModal" style="margin-top:-2px" >Reject TimeSheet</button>
                                </div>
                            <!-- Reject Modal -->
                            <div class="modal fade" id="myRejectModal" role="dialog">
                                <div class="modal-dialog modal-dialog-centered">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h4 class="modal-title">Feedback:</h4>
                                            <button type="button" class="close" data-target="#myRejectModal" data-toggle="modal">&times;</button>

                                        </div>
                                        <div class="modal-body">
                                            <p>If any remarks ? Please enter here !</p>
                                            <asp:TextBox ID="txtRejectFB" runat="server" CssClass="form-control" TextMode="MultiLine" Width="70%" Height="40%"></asp:TextBox>
                                        </div>
                                        <div class="modal-footer">
                                            <%--<asp:Button ID="btnApproveSend" runat="server" CssClass="btn btn-primary" data-dismiss="modal" Text="Send" />--%>
                                            <asp:Button ID="btnRejectSend" runat="server" Text="Send" OnClick="btnRejectSend_Click" CssClass="btn btn-primary" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <br />
                            <br />
                            <div class="container">
                                <div class="col-md-4">
                                    <br />
                                <button type="button" id="txtcomment" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myCommentModal" style="margin-top:-22px">Comment TimeSheet</button>
                                    </div>
                                <!-- Comment Modal -->
                                <div class="modal fade" id="myCommentModal" role="dialog">
                                    <div class="modal-dialog modal-dialog-centered">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h4 class="modal-title">Feedback:</h4>
                                                <button type="button" class="close" data-target="#myCommentModal" data-toggle="modal">&times;</button>

                                            </div>
                                            <div class="modal-body">
                                                <p>If any remarks ? Please enter here !</p>
                                                <asp:TextBox ID="txtCommentFB" runat="server" CssClass="form-control" TextMode="MultiLine" Width="70%" Height="40%"></asp:TextBox>
                                            </div>
                                            <div class="modal-footer">
                                                <%--<asp:Button ID="btnApproveSend" runat="server" CssClass="btn btn-primary" data-dismiss="modal" Text="Send" />--%>
                                                <asp:Button ID="btnCommentSend" runat="server" Text="Send" OnClick="btnCommentSend_Click" CssClass="btn btn-primary" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                </div>
                            </div>

                        </div>
                        </div>
                </asp:Panel>
            </div>
        </div>
    </div>
    
    
</asp:Content>
