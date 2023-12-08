<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="usersignup.aspx.cs" Inherits="E_library_Management_System.usersignup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-8 mx-auto">
                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100" src="images/user.jpg" />
                                </center>
                            </div>
                        </div>

                         <div class="row">
                            <div class="col">
                                <center>
                                   <h3>Member Signup</h3>
                                </center>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col">
                               <hr>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                             <label>Full Name</label>
                               <div class="form-group">
                                   <asp:TextBox class="form-control" ID="TextBox1"
                                       placeholder="Full Name" runat="server"></asp:TextBox>
                               </div>
                            </div>

                            <div class="col-md-6">
                              <label>Date of birth</label>
                                <div class="form-group">
                                   <asp:TextBox class="form-control" ID="TextBox3"
                                       placeholder="Date Of birth" runat="server" TextMode="Date"></asp:TextBox>
                               </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                             <label>Contact Number</label>
                               <div class="form-group">
                                   <asp:TextBox class="form-control" ID="TextBox2"
                                       placeholder="Contact Number" runat="server" TextMode="Phone"></asp:TextBox>
                               </div>
                            </div>

                            <div class="col-md-6">
                              <label>Email ID</label>
                                <div class="form-group">
                                   <asp:TextBox class="form-control" ID="TextBox4"
                                       placeholder="Email ID" runat="server" TextMode="Email"></asp:TextBox>
                               </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                             <label>Street Address</label>
                               <div class="form-group">
                                   <asp:TextBox class="form-control" ID="TextBox8"
                                       placeholder="Street Address" runat="server" TextMode="SingleLine"></asp:TextBox>
                               </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                             <label>State</label>
                               <div class="form-group">
                                   <asp:DropDownList class="form-control" ID="DropDownList1" runat="server">
                                       <asp:ListItem Text="Select" Value="select" />
                                       <asp:ListItem Text="Minnesota" Value="Minnesota" />
                                       <asp:ListItem Text="New York" Value="New York" />
                                       <asp:ListItem Text="Texas" Value="Texas" />
                                       <asp:ListItem Text="Wisconsin" Value="Wisconsin" />
                                       <asp:ListItem Text="Michigan" Value="Michigan" />
                                   </asp:DropDownList>
                               </div>
                            </div>

                            <div class="col-md-4">
                              <label>City</label>
                                <div class="form-group">
                                   <asp:TextBox class="form-control" ID="TextBox6"
                                       placeholder="City" runat="server"></asp:TextBox>
                               </div>
                            </div>

                            
                            <div class="col-md-4">
                              <label>Zip Code</label>
                                <div class="form-group">
                                   <asp:TextBox class="form-control" ID="TextBox7"
                                       placeholder="Zip Code" runat="server" TextMode="Number"></asp:TextBox>
                               </div>
                            </div>
                        </div>

                        <hr />
                        <div class="row">
                            <div class="col">
                                <center>
                                <h5>Login Credentials</h5>
                                </center>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-md-6">
                                <label>Member ID</label>
                               <div class="form-group">
                                   <asp:TextBox class="form-control" ID="TextBox5"
                                       placeholder="Member ID" runat="server"></asp:TextBox>
                               </div>
                            </div>
                            <div class="col-md-6">
                                <label>Password</label>
                                <div class="form-group">
                                   <asp:TextBox class="form-control" ID="TextBox9"
                                       placeholder="Password" runat="server" TextMode="Password"></asp:TextBox>
                               </div>
                            </div>
                        </div>

                        <br />
                       
                        <div class="form-group">
                            <asp:Button ID="Button1" class="btn btn-primary btn-block btn-lg" runat="server" Text="Sign Up" OnClick="Button1_Click" /> 
                           </div>
                    </div>
                </div>

                
            </div>

            <a href="homepage.aspx"><< Back to home</a>
        </div>
    </div>
</asp:Content>
