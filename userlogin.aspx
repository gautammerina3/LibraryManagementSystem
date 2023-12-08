<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="userlogin.aspx.cs" Inherits="E_library_Management_System.userlogin" %>

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
                                    <img width="250" src="images/user.jpg" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Member Login</h3>
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
                                <label>Member ID</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="TextBox1"
                                        placeholder="Member ID" runat="server"></asp:TextBox>
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
                                        <asp:Button ID="Button1" class="btn btn-success btn-block btn-lg" runat="server" Text="Login" OnClick="Button1_Click" />
                                    </div>
                                    <br />
                                    <label>Not a member? Sign Up now!</label>
                                    <div class="form-group">
                                        <a href="usersignup.aspx"></a>
                                        <input id="Button2" class="btn btn-primary btn-block btn-lg" type="button" value="Sign Up" />

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
