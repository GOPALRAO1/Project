<%@ Page Title="" Language="C#" MasterPageFile="~/Homepage.Master" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="QuadResProject.ForgotPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
		.auto-style6 {
            width: 290px;
        }
        .auto-style7 {
            display: block;
            font-size: 1rem;
            font-weight: 400;
            line-height: 1.5;
            color: #495057;
            background-clip: padding-box;
            border-radius: .25rem;
            transition: none;
            border: 1px solid #ced4da;
            background-color: #fff;
        }
        .auto-style8 {
            width: 117%;
            padding-right: 15px;
            padding-left: 15px;
            margin-right: auto;
            margin-left: auto;
            height: 98px;
        }
        .auto-style9 {
            width: 161%;
            padding-right: 15px;
            padding-left: 15px;
            margin-right: auto;
            margin-left: auto;
            height: 98px;
        }
        .dropdown{
            display:none;
        }
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<br />
    <div class="container">
    <table class="auto-style9">
        <tr>
            <td>Please enter your mail:</td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="auto-style7" TextMode="Email" Width="312px" Height="37px"></asp:TextBox></td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
            <td>
                <asp:Button ID="btnGet" CssClass="btn btn-primary" runat="server" Text="Get Details" OnClick="btnGet_Click" /></td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="lbmsg" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
        </div>
</asp:Content>