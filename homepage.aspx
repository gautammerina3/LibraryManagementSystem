<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="E_library_Management_System.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section>
        <center>
        <h3> LIBRARY MANAGEMENT SYSTEM </h3>
        </center>
        <img src="images/home-background.jpg" class="img-fluid" height="100%" width="100%"/>
    </section>

    <section>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <center>
                    <h2>Our Features</h2>
                    <p><b> Our 3 Primary Features</b></p>
                    </center>
                </div>
            </div>

            <div class="row">
                <div class="col-md-4">
                    <center>
                    <img width="150px" src="images/book-inventory.jpg" />
                    <h4> Digital Book Inventory</h4>
                    </center>
                </div>
                <div class="col-md-4">
                    <center>
                    <img width="150px" src="images/book_search.png" />
                    <h4> Digital Book Search</h4>
                    </center>
                </div>
                <div class="col-md-4">
                    <center>
                    <img width="150px" src="images/book_issue.jpg" />
                    <h4> Digital Book Issue</h4>
                    </center>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
