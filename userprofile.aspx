<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="userprofile.aspx.cs" Inherits="E_library_Management_System.userviewprofile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container-fluid">
        <div class="row">
            <div class="col-md-5">
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
                                   <h4>Your Profile</h4>
                                     <span>Account Status - </span>
                                     <asp:Label ID="Label1" class="badge badge-info" runat="server" Text="Your Status"></asp:Label>
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
                            <div class="col-md-4">
                                <label>Member ID</label>
                               <div class="form-group">
                                   <asp:TextBox class="form-control" ID="TextBox5"
                                       placeholder="Member ID" runat="server" ReadOnly="true"></asp:TextBox>
                               </div>
                            </div>
                            <div class="col-md-4">
                                <label>Old Password</label>
                                <div class="form-group">
                                   <asp:TextBox class="form-control" ID="TextBox9"
                                       placeholder="Old Password" runat="server" TextMode="Password" ReadOnly="true"></asp:TextBox>
                               </div>
                            </div>

                            <div class="col-md-4">
                                <label>New Password</label>
                                <div class="form-group">
                                   <asp:TextBox class="form-control" ID="TextBox10"
                                       placeholder="New Password" runat="server" TextMode="Password"></asp:TextBox>
                               </div>
                            </div>
                        </div>

                        <br />
                       
                        <div class="row">
                            <div class="col-8 mx-auto">
                                <div class="form-group">
                                <center>
                                    <asp:Button CssClass="btn btn-primary btn-block btn-lg" 
                                        ID="Button1" runat="server" Text="Update" OnClick="Button_Update_Click" />
                                </center>
                                </div>
                            </div>

                        </div>
                        
                    </div>
                </div>

                
            </div>

      
            <div class="col-md-7">
                 <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100" src="images/books.jpg" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                   <h4>Your Issued Books</h4>
                              
                                     <asp:Label ID="Label2" class="badge badge-info" runat="server" Text="Your Book Status"></asp:Label>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" OnRowDataBound="GridView1_RowDataBound"></asp:GridView>
                            </div>
                        </div>

                     </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
