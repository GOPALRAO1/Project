<%@ Page Title="" Language="C#" MasterPageFile="~/Homepage.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="QuadResProject.Home" %>

 

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Keep your content from head -->

 

    <style>
        /* Make the image fully responsive */
        .carousel-inner img {
            width: 100%;
            height: 525px;
        }
        .dropdown{
            display:none;
        }

 

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Kep your content from body -->
    <div style="min-width: 100%">
        <div id="demo" class="carousel slide" data-ride="carousel">
            <!-- The slideshow -->
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="office.jpg" alt="time" />
                </div>
                <div class="carousel-item">
                    <img src="off4.JPG" alt="office" />
                </div>
                <div class="carousel-item">
                    <img src="office1.jpg" alt="office premise" />
                </div>
                <div class="carousel-item">
                    <img src="office2.jpg" alt="conference" />
                </div>
                <div class="carousel-item">
                    <img src="office3.png" alt="building" />
                </div>
            </div>
            <!-- Left and right controls -->
            <a class="carousel-control-prev" href="#demo" data-slide="prev">
                <span class="carousel-control-prev-icon"></span>
            </a>
            <a class="carousel-control-next" href="#demo" data-slide="next">
                <span class="carousel-control-next-icon"></span>
            </a>
        </div>
    </div>
</asp:Content>