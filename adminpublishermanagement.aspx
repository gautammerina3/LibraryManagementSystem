<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminpublishermanagement.aspx.cs" Inherits="E_library_Management_System.adminpublishermanagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
     </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                         <div class="row">
                            <div class="col">
                                <center>
                                   <h4>Publisher Details</h4>
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
                            <div class="col">
                               <hr>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                             <label>Publisher ID</label>
                               <div class="form-group">
                               <div class="input-group">
                                   <asp:TextBox class="form-control" ID="TextBox1"
                                       placeholder="Publisher ID" runat="server"></asp:TextBox>
                                   <asp:Button class="btn btn-primary" ID="Button1" runat="server" Text="Go" OnClick="Button_Go_Click" />
                                </div>
                               </div>
                            </div>

                            <div class="col-md-8">
                              <label>Publisher Name</label>
                                <div class="form-group">
                                   <asp:TextBox class="form-control" ID="TextBox3"
                                       placeholder="Publisher Name" runat="server"></asp:TextBox>
                               </div>
                            </div>
                        </div> 
                        
                        <br />

                        <div class="row">
                            <div class="col-4">
                                <asp:Button CssClass="btn btn-primary btn-lg" ID="Button2" runat="server" Text="Add" OnClick="Button_Add_Click" />
                            </div>

                             <div class="col-4">
                                <asp:Button CssClass="btn btn-success btn-lg" ID="Button3" runat="server" Text="Update" OnClick="Button_Update_Click" />
                            </div>

                             <div class="col-4">
                                <asp:Button CssClass="btn btn-danger btn-lg" ID="Button4" runat="server" Text="Delete" OnClick="Button_Delete_Click" />
                            </div>
                        </div>
                    </div>
                </div>

                
            </div>

      
            <div class="col-md-6">
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
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString %>" SelectCommand="SELECT * FROM [tbl_publisher_details]"></asp:SqlDataSource>
                            <div class="col">
                               <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="publisher_id" DataSourceID="SqlDataSource1">
                                   <Columns>
                                       <asp:BoundField DataField="publisher_id" HeaderText="publisher_id" ReadOnly="True" SortExpression="publisher_id" />
                                       <asp:BoundField DataField="publisher_name" HeaderText="publisher_name" SortExpression="publisher_name" />
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
