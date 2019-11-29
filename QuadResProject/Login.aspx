<%@ Page Title="" Language="C#" MasterPageFile="~/Homepage.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="QuadResProject.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>EmployeeTimesheetLogin</title>
    <link href="LoginRegStyleSheet.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="Boostrap/css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="Boostrap/js/bootstrap.js" />
    <link rel="stylesheet" type="text/css" href="Boostrap/fonts/glyphicons-halflings-regular.woff" />
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script src="lib/jquery/jquery.min.js"></script>
    <script src="lib/jquery-validate/jquery.validate.min.js"></script>
    <script src="lib/jquery-validation-unobtrusive/jquery.validate.unobtrusive.min.js"></script>
    <style>
        .container {
            position: center;
            border-radius: 5px;
            background-color: transparent;
            padding: 20px 0 30px 0;
            width: 250px;
            margin-top: 1.75%;
            height: auto;
            /*margin-left: 50%;*/
            text-align: center;
        }
        label.error {
            color: red;
            display: inline-flex;
        }
        .Textstyle {
            width: 50%;
            height: 35px;
        }
        .submitbutton {
            background-color: coral;
        }
        .backgroundimage1 {
            background-image: url("Images/logo.png");
            text-align: left;
            background-repeat: no-repeat;
        }
        .Labelstyle {
            color: orangered;
        }
        /*.backgroundimage2 {
            background-image: url("metro.jpg");
            background-repeat: no-repeat;
            width: 100%;
            height: 100%;
            background-size: cover;
        }*/
                .dropdown{
            display:none;
        }
    </style>
<script type="text/javascript">
        $(document).ready(function () {
 
            $("#form1").validate({
                rules: {
                    <%=txtUserName.UniqueID %>: {
                    
                    required: true
                    },
                    <%=txtPassword.UniqueID %>: {
                    required: true
                    }
                },
                messages: {
                    <%=txtUserName.UniqueID %>: {
                       
                        required: "**Please enter your EmpId"
                    },
                
                    <%=txtPassword.UniqueID %>: {
                        required: "**Please enter your Password"
                    }
                }
            });
                
        });
    </script>
    <style>
                #Button3{
             display:none;
        }
           #Button2{
             display:none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <asp:Panel ID="Panel1" runat="server" DefaultButton="btnLogin"> 
        <img src="Images/logo.png" style="text-align: left; margin-left:-36px;margin-bottom:-30px" />
        <br />
        <br />
        <br />
        <%--<h1 style="color: steelblue; text-align: center; text-size-adjust: auto;">Login</h1>--%>
        <asp:TextBox ID="txtUserName" CssClass="form-control" runat="server" name="EmployeeId" placeholder="EmployeeId"></asp:TextBox>
        <br /> 
        <asp:TextBox ID="txtPassword" type="Password" CssClass="form-control" runat="server" name="Password" placeholder="Password"></asp:TextBox>
        
        <br />
         
        <asp:Button ID="btnLogin" runat="server" CssClass="btn btn-primary" Font-Bold="true"
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            Text="Login" OnClick="btnLogin_Click" style="margin-bottom:15px"/>
        <h6 style="color:white; text-align:center">Forgot Password? <a href="ForgotPassword.aspx" style="color:white"> Click Here..</a></h6>
  
       
         <h6 style="color:red; text-align:center" >Not Registered? <asp:LinkButton ID="LinkButton1" href="Registration.aspx" ForeColor="Red" runat="server"> Click Here..</asp:LinkButton></h6>
         <br />
        <asp:Label ID="Label1" CssClass="Labelstyle" runat="server" Text=""></asp:Label>
            </asp:Panel>
    </div>
</asp:Content>
