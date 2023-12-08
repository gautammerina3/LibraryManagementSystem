<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminusermanagement.aspx.cs" Inherits="E_library_Management_System.adminusermanagement" %>
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
                                   <h4>Member Details</h4>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100" src="images/user.jpg" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-3">
                             <label>Member ID</label>
                               <div class="form-group">
                               <div class="input-group">
                                   <asp:TextBox class="form-control" ID="TextBox1"
                                       placeholder="Member ID" runat="server"></asp:TextBox>
                                   <asp:Button class="btn btn-primary" ID="Button1" runat="server" Text="Go" OnClick="Button_Go_Click" />
                                </div>
                               </div>
                            </div>

                            <div class="col-md-3">
                              <label>Full Name</label>
                                <div class="form-group">
                                   <asp:TextBox class="form-control" ID="TextBox3"
                                       placeholder="Full Name" runat="server" ReadOnly="True"></asp:TextBox>
                               </div>
                            </div>

                           <div class="col-md-6">
                              <label>Account Status</label>
                                <div class="form-group">
                                   <div class="input-group">
                                   <asp:TextBox class="form-control" ID="TextBox2"
                                        runat="server" placeholder="status" ReadOnly="True"></asp:TextBox>
                                       <asp:LinkButton class="btn btn-success" ID="LinkButton1" runat="server" OnClick="Button_Active_Click">
                                           <i class="fas fa-check-circle"></i>
                                       </asp:LinkButton>
                                       <asp:LinkButton class="btn btn-warning" ID="LinkButton2" runat="server" OnClick="Button_Pending_Click">
                                           <i class="fas fa-pause-circle"></i>
                                       </asp:LinkButton>
                                       <asp:LinkButton class="btn btn-danger" ID="LinkButton3" runat="server" OnClick="Button_Deactive_Click">
                                           <i class="fas fa-time-circle"></i>
                                       </asp:LinkButton>
                                    
    
                                    </div>
                               </div>
                            </div>
                        </div> 
                        

                         <div class="row">
                            <div class="col-md-4">
                             <label>DOB</label>
                               <div class="form-group">
                                   <asp:TextBox class="form-control" ID="TextBox4"
                                       placeholder="DOB" runat="server" ReadOnly="True"></asp:TextBox>
                               </div>
                            </div>

                            <div class="col-md-4">
                              <label>Contact Number</label>
                                <div class="form-group">
                                   <asp:TextBox class="form-control" ID="TextBox5"
                                       placeholder="Contact Number" runat="server" ReadOnly="True"></asp:TextBox>
                               </div>
                            </div>

                             <div class="col-md-4">
                              <label>Email ID </label>
                                <div class="form-group">
                                   <asp:TextBox class="form-control" ID="TextBox6"
                                       placeholder="Email ID" runat="server" ReadOnly="True"></asp:TextBox>
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
                                   <asp:TextBox class="form-control" ID="TextBox10" runat="server"></asp:TextBox>
                               </div>
                            </div>

                            <div class="col-md-4">
                              <label>City</label>
                                <div class="form-group">
                                   <asp:TextBox class="form-control" ID="TextBox7"
                                       placeholder="City" runat="server"></asp:TextBox>
                               </div>
                            </div>

                            
                            <div class="col-md-4">
                              <label>Zip Code</label>
                                <div class="form-group">
                                   <asp:TextBox class="form-control" ID="TextBox9"
                                       placeholder="Zip Code" runat="server" TextMode="Number"></asp:TextBox>
                               </div>
                            </div>
                        </div>
                        <br />
                        <br />
                        <div class="row">
                             <div class="col-12">
                                <asp:Button CssClass="btn btn-danger btn-lg" ID="Button4" runat="server" Text="Delete User Parmanently" OnClick="Button_Delete_Click" />
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
                                   <h4>Publisher List</h4>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>

                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString %>" SelectCommand="SELECT * FROM [tbl_member_details]"></asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="member_id" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="member_id" HeaderText="ID" ReadOnly="True" SortExpression="member_id" />
                                        <asp:BoundField DataField="full_name" HeaderText="Name" SortExpression="full_name" />
                                        <asp:BoundField DataField="account_status" HeaderText="Status" SortExpression="account_status" />
                                        <asp:BoundField DataField="contact_no" HeaderText="Contact No" SortExpression="contact_no" />
                                        <asp:BoundField DataField="email" HeaderText="Email ID" SortExpression="email" />
                                        <asp:BoundField DataField="state" HeaderText="State" SortExpression="state" />
                                        <asp:BoundField DataField="city" HeaderText="City" SortExpression="city" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>

                     </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
