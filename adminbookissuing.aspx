<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminbookissuing.aspx.cs" Inherits="E_library_Management_System.adminbookissuing" %>
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
                                   <h4>Book Issuing</h4>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="images/books.jpg" />
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
                             <label>Member ID</label>
                               <div class="form-group">
                                   <asp:TextBox class="form-control" ID="TextBox1"
                                       placeholder="Member ID" runat="server"></asp:TextBox>
                                </div>
                             </div>
                       

                        <div class="col-md-6">
                              <label>Book ID</label>
                                <div class="form-group">
                                   <div class="input-group">
                                   <asp:TextBox class="form-control" ID="TextBox3"
                                       placeholder="Book ID" runat="server"></asp:TextBox>
                                    <asp:Button class="btn btn-primary" ID="Button1" runat="server" Text="Go" OnClick="Button_Go_Click" />
                                </div>
                               </div>
                            </div>
                    </div>
                         <div class="row">
                            <div class="col-md-6">
                             <label>Member Name</label>
                               <div class="form-group">
                                   <asp:TextBox class="form-control" ID="TextBox2"
                                       placeholder="Member Name" runat="server" ReadOnly="true"></asp:TextBox>
                                </div>
                             </div>
                

                        <div class="col-md-6">
                              <label>Book Name</label>
                                <div class="form-group">
                                   <asp:TextBox class="form-control" ID="TextBox4"
                                       placeholder="Book Name" runat="server"></asp:TextBox>
                               </div>
                            </div>
         </div>
                         <div class="row">
                            <div class="col-md-6">
                             <label>Issue Date</label>
                               <div class="form-group">
                                   <asp:TextBox class="form-control" ID="TextBox5"
                                       placeholder="Issue Date" runat="server" TextMode="Date" ></asp:TextBox>
                                </div>
                             </div>
                      
                            <div class="col-md-6">
                             <label>Due Date</label>
                               <div class="form-group">
                                   <asp:TextBox class="form-control" ID="TextBox6"
                                       placeholder="Due Date" runat="server" TextMode="Date"></asp:TextBox>
                                </div>
                             </div>
                         </div>
                        <br />

                        <div class="row">
                            <div class="col-6">
                                <asp:Button CssClass="btn btn-success btn-lg" ID="Button2" runat="server" Text="Issue" OnClick="Button_Issue_Click" />
                            </div>

                             <div class="col-6">
                                <asp:Button CssClass="btn btn-primary btn-lg" ID="Button3" runat="server" Text="Return" OnClick="Button_Return_Click" />
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
                                   <h4>Issued Book List</h4>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>

                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString %>" SelectCommand="SELECT * FROM [tbl_book_issue]"></asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnRowDataBound="GridView1_RowDataBound">
                                    <Columns>
                                        <asp:BoundField DataField="member_id" HeaderText="member_id" SortExpression="member_id" />
                                        <asp:BoundField DataField="member_name" HeaderText="member_name" SortExpression="member_name" />
                                        <asp:BoundField DataField="book_id" HeaderText="book_id" SortExpression="book_id" />
                                        <asp:BoundField DataField="book_name" HeaderText="book_name" SortExpression="book_name" />
                                        <asp:BoundField DataField="issue_date" HeaderText="issue_date" SortExpression="issue_date" />
                                        <asp:BoundField DataField="due_date" HeaderText="due_date" SortExpression="due_date" />
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
