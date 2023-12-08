<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminlogin.aspx.cs" Inherits="E_library_Management_System.adminlogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="250" src="images/admin.png" />
                                </center>
                            </div>
                        </div>

                         <div class="row">
                            <div class="col">
                                <center>
                                   <h3>Admin Login</h3>
                                </center>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col">
                               <hr>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <label>Admin ID</label>
                               <div class="form-group">
                                   <asp:TextBox class="form-control" ID="TextBox1"
                                       placeholder="Admin ID" runat="server"></asp:TextBox>
                               </div>
                                <br />
                                <label>Password</label>
                                <div class="form-group">
                                   <asp:TextBox class="form-control" ID="TextBox2"
                                       placeholder="Password" runat="server" TextMode="Password"></asp:TextBox>
                               </div>

                                <br />
                                <center>
                                <div class="form-group">
                                    <asp:Button ID="Button1"  class="btn btn-success btn-block btn-lg" runat="server" Text="Login" OnClick="Button_Login_Click" />
                               </div>
                                </center>
                            </div>
                        </div>

                    </div>
                </div>

                
            </div>

            <a href="homepage.aspx"><< Back to home</a>
        </div>
    </div>
</asp:Content>
