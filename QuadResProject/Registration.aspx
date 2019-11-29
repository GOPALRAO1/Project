<%@ Page Title="" Language="C#" MasterPageFile="~/Homepage.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="QuadResProject.Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Homepage.css" rel="stylesheet" />
    <link href="LoginRegStyleSheet.css" rel="stylesheet" />

    
    <script type="text/javascript">


        $(document).ready(function () {

            $.validator.addMethod("emailmatch", function (value, element) {
                return this.optional(element) || /^[a-zA-Z0-9._-]+@[a-zA-Z0-9]+\.[a-zA-Z.]{2,5}$/i.test(value); //i.
            },
                "Please enter a valid email address");
            $.validator.addMethod("Empid", function (value, element) {
                return this.optional(element) || /^([A-Za-z]{2,}-\d+;)+$/.test(value); //i.
            }
                );
            $.validator.addMethod("QuadrantResource", function (value, element) {
                return this.optional(element) || /^.+@quadrantresource|quadrantresourceindia.com$/.test(value);

            }, "Only Quadrantresource/quadrantresourceindia.com  email address is allowed");

            $.validator.addMethod("namematch", function (value, element) {
                return this.optional(element) || /^[a-zA-Z\s]+$/.test(value);

            }, "Your name must contain only alphabets");
            $.validator.addMethod("pwcheck", function (value) {
                return /^[A-Za-z0-9\d=!\-@._*]*$/.test(value) // consists of only these
                    && /[a-z]/.test(value) // has a lowercase letter
                    && /\d/.test(value) // has a digit
            });
            $.validator.addMethod("passwordMatch", function (value, element) {
               
    // The two password inputs
    var password = $("#ContentPlaceHolder1_txtPassword").val();
    var confirmPassword =  $("#ContentPlaceHolder1_txtConfirmPassword").val();
                
    // Check for equality with the password inputs
    if (password != confirmPassword ) {
        return false;
    } else {
        return true;
    }

 

}, "Your Passwords Must Match");
            $.validator.addMethod("CheckDropDownList", function (value, element, param) {
                if (value == '0')
                    return false;
                else
                    return true;
            });


            $("#form1").validate({
                rules: {
                    <%=txtEmpId.UniqueID %>: {
                    //Empid: true,
                    required: true

                    },
                    <%=txtUserName.UniqueID %>: {
                        minlength: 3,
                        namematch: true,
                        required: true
                    },
                    <%=txtEmail.UniqueID %>: {

                        emailmatch: true,
                        QuadrantResource: true,
                        required: true
                    },
                    <%=txtMobile.UniqueID %>: {
                        minlength: 10,
                        required: true
                    },
                    <%=txtPassword.UniqueID %>: {
                        required: true,
                        pwcheck: true
                    },
                    <%=txtConfirmPassword.UniqueID %>: {
                        required: true,
                        passwordMatch: true,                        
                        pwcheck: true
                    },
                    <%=txtGender.UniqueID %> : {
                        CheckDropDownList: true
                    },
                    <%=txtRole.UniqueID %>: {

                        CheckDropDownList: true
                    }
                },
                messages: {
                    <%=txtEmpId.UniqueID %>: {
                        required: "Should be of this format Example:QR-530"


                    },
                    <%=txtUserName.UniqueID %>: {
                        minlength: "Name should be atleast 3 characters long",
                        required: "Please enter your Name"

                    },
                    <%=txtEmail.UniqueID %>: {

                        required: "Please enter your Email Id"
                    },
                    <%=txtMobile.UniqueID %>: {
                        required: "Plaese enter your Mobile number",
                        minlength: "Mobile should contain atleast 10 Numbers "
                    },
                    <%=txtPassword.UniqueID %>: {
                        required: "Please enter your Password",
                        pwcheck: "Password should include upper/lower/digits"
                    },
                    <%=txtConfirmPassword.UniqueID %>: {
                        required: "Please Confirm Password",
                        pwcheck: "Password should include upper/lower/digits",
                        passwordMatch:"Password mismatch"
                    },
                    <%=txtGender.UniqueID %>: {

                        CheckDropDownList: "Select Gender"
                    },
                    <%=txtRole.UniqueID %>: {

                        CheckDropDownList: "select Role"
                    }
                }
            });
                
        });

    </script>
    <style>
        .dropdown{
            display:none;
        }
        #Button3{
             display:none;
        }
           #Button2{
             display:none;
        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" ValidateRequestMode="Disabled">


    <section class="container" id="containerDiv" style="max-width: 50%;">

        <div class="form-group" style="margin-top: 4px; margin-bottom:100px;">
            <asp:Panel ID="Panel1" runat="server" DefaultButton="Button"> 
            <div class="Header">
                <img src="qrlogo.png" style="text-align:center" />
            </div>

            <div class="col-md-12 row">

                <div class="col-md-6">
                    <b>
                        <asp:Label ID="Label1" runat="server" Text="EmployeeId"></asp:Label></b>

                    <asp:TextBox ID="txtEmpId" placeholder="EmpId" CssClass="form-control" runat="server"  CausesValidation="True"></asp:TextBox>

                </div>
                <div class="col-md-6">
                    <b>
                        <asp:Label ID="Label2" runat="server" Text="FullName"></asp:Label></b>

                    <asp:TextBox ID="txtUserName" placeholder="Enter Name" CssClass="form-control" runat="server" CausesValidation="True"></asp:TextBox>
                </div>

            </div>
            <div class="col-md-12 row">
                <div class="col-md-6">
                    <b>
                        <asp:Label ID="Label3" runat="server" Text="Email"></asp:Label></b>

                    <asp:TextBox ID="txtEmail" ClientIDMode="Static" CausesValidation="true" placeholder="Example@mail.com" CssClass="form-control" runat="server"  TextMode="Email"></asp:TextBox>
                </div>
                <div class="col-md-6">
                    <b>
                        <asp:Label ID="Label9" runat="server" Text="Mobile"></asp:Label></b>

                    <asp:TextBox ID="txtMobile" placeholder="Mobile Number" CssClass="form-control" runat="server" TextMode="Phone" CausesValidation="True"></asp:TextBox>

                </div>
            </div>
            <div class="col-md-12 row">
                <div class="col-md-6">
                    <b>
                        <asp:Label ID="Label10" runat="server" Text="Password"></asp:Label></b>

                    <asp:TextBox ID="txtPassword" placeholder="Password" CssClass="form-control" runat="server" TextMode="Password" CausesValidation="True"></asp:TextBox>
                </div>
                <div class="col-md-6">
                    <b>
                        <asp:Label ID="Label11" runat="server" Text="ConfirmPassword"></asp:Label></b>

                    <asp:TextBox ID="txtConfirmPassword" placeholder="Confirm Password" CssClass="form-control" runat="server" TextMode="Password" CausesValidation="True"></asp:TextBox>
                </div>
            </div>
            <div class="col-md-12 row">
                <div class="col-md-6">
                    <b>
                        <asp:Label ID="Label7" runat="server" Text="Gender"></asp:Label></b>

                    <asp:DropDownList ID="txtGender" runat="server" placeholder="Select Gender" CssClass="form-control" CausesValidation="True">
                        <asp:ListItem Value="0">-Select-</asp:ListItem>
                        <asp:ListItem Value="1">Male</asp:ListItem>
                        <asp:ListItem Value="2">Female</asp:ListItem>
                        <asp:ListItem Value="3">Other</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-md-6">
                    <b>
                        <asp:Label ID="Label8" runat="server" Text="Role"></asp:Label></b>

                    <asp:DropDownList ID="txtRole" runat="server" placeholder="Select Role" CssClass="form-control" CausesValidation="True">
                        <asp:ListItem Value="0">-Select-</asp:ListItem>
                        <asp:ListItem Value="1">Director</asp:ListItem>
                        <asp:ListItem Value="2">Lead</asp:ListItem>
                        <asp:ListItem Value="3">Employee</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>

    
   <div class="col-md-12" style="margin-top: 20px;text-align:center;">
               


 
                    <asp:Button ID="Button" runat="server" Text="Register" Font-Bold="true" CssClass="btn btn-danger form-control" OnClick="Button_Click1" style="width: 50%;"  />
           
                </div>
            <div class="col-md-12" style="margin-top: 20px;text-align:center;">
                     <h6 style="color:white; text-align:center">Already a member? <asp:LinkButton ID="LinkButton1" href="Login.aspx" runat="server" ForeColor="White" Font-Size="Medium">Login Here!!</asp:LinkButton></h6>
          
            <div class="col-md-12 row txt-aln-ctr">
                <asp:Label ID="Label4" runat="server" CssClass="wdt-100" forecolor="Green" Font-Size="Large" Text=""></asp:Label>
            </div>
            <div class="col-md-12 row txt-aln-ctr">
                <asp:Label ID="Label5" runat="server" CssClass="wdt-100" forecolor="Red" Font-Size="Large" Text=""></asp:Label>
            </div>
        </div>
                </asp:Panel>
            </div>

    </section>

</asp:Content>
