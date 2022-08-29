<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Dashboard.master" AutoEventWireup="true" CodeFile="users.aspx.cs" Inherits="admin_users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="card">
        <div class="card-body">
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal-default">
                Add user
            </button>
        </div>


        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
            <ContentTemplate>
                <asp:GridView ID="GVUsers" AutoGenerateColumns="false" CssClass="table " runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <HeaderStyle BackColor="#3a4353" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#0000A9" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#000065" />



                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="id" />
                        <asp:BoundField DataField="fullName" HeaderText="fullName" />
                        <asp:BoundField DataField="gender" HeaderText="gender" />
                        <asp:BoundField DataField="dob" HeaderText="dob" />
                        <asp:BoundField DataField="tellNum" HeaderText="tellNum" />
                        <asp:BoundField DataField="email" HeaderText="email" />
                        <asp:BoundField DataField="regDate" HeaderText="Registered Date" />
                        <asp:BoundField DataField="userId" HeaderText="userId" />
                        <asp:BoundField DataField="status" HeaderText="status" />

                        <asp:TemplateField HeaderText="Edit">

                            <ItemTemplate>

                                <asp:LinkButton ID="BtnEdit" OnClick="BtnEdit_Click" ItemStyle-HorizontalAlign="right" runat="server"><i class="fa fa-edit  btn btn-success"></i></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>


                </asp:GridView>

            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

    <script type="text/javascript">
        function openuserModal() {
            $('#modal-default').modal('show');
        }
        function PreventModalClose() {
            $('#BtnSave').on
            modal('show');
        }
    </script>

    <div class="modal fade" id="modal-default" data-keybaord="false" data-backdrop="static">
        <div class="modal-dialog modal-lg">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">users</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="row">
                            <asp:Label ID="LblMsg" runat="server" Text="" Style="height: 20px; padding-left: 30%; font-size: 22px;"></asp:Label>
                        </div>
                        <hr style="border: 2px solid blue; width: 96%;" />
                        <div class="modal-body">
                            <%-- <p>One fine body&hellip;</p>--%>

                            <div class="row">

                                <div class="col-md-6 col-sm-12">
                                    <div class="from-group">
                                        <label>Full Name</label>
                                        <asp:RequiredFieldValidator ID="RFVFullName" ForeColor="Red" ControlToValidate="TxtFullName"
                                            ValidationGroup="ValidateUsers" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="TxtFullName" runat="server" placeholder=" Enter Full Name" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-md-6 col-sm-12">
                                    <div class="from-group">
                                        <label>Gender</label>
                                        <asp:RequiredFieldValidator ID="RFVGender" ForeColor="Red" ControlToValidate="DDLGender"
                                            ValidationGroup="ValidateUsers" runat="server" ErrorMessage="*" InitialValue="Select Gender..."></asp:RequiredFieldValidator>
                                        <asp:DropDownList ID="DDLGender" CssClass="form-control" runat="server">
                                            <asp:ListItem Text="Select Gender..." Value="Select Gender..." />
                                            <asp:ListItem Text="Male" Value="Male" />
                                            <asp:ListItem Text="Female" Value="Female" />
                                        </asp:DropDownList>
                                    </div>
                                </div>

                                <div class="col-md-6 col-sm-12">
                                    <div class="from-group">
                                        <label>Date of Birth</label>
                                        <asp:RequiredFieldValidator ID="RFVDOB" ForeColor="Red" ControlToValidate="TxtDOB"
                                            ValidationGroup="ValidateUsers" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="TxtDOB" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-md-6 col-sm-12">
                                    <label>Tell Number</label>
                                    <div class="form-group">
                                        <asp:RequiredFieldValidator ID="RFVTellNum" ForeColor="Red" ControlToValidate="TxtTellNum"
                                            ValidationGroup="ValidateUsers" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="TxtTellNum" runat="server" placeholder=" Enter Tell Number" CssClass="form-control" TextMode="Number"></asp:TextBox>
                                    </div>

                                </div>

                                <div class="col-md-6 col-sm-12">
                                    <div class="from-group">
                                        <label>Email</label>
                                        <asp:RequiredFieldValidator ID="RFVEmail" ForeColor="Red" ControlToValidate="TxtEmail"
                                            ValidationGroup="ValidateUsers" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="TxtEmail" runat="server" placeholder="Enter Email " CssClass="form-control" TextMode="Email"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-md-6 col-sm-12">
                                    <div class="from-group">
                                        <label>Password</label>
                                        <asp:RequiredFieldValidator ID="RFVPassword" ForeColor="Red" ControlToValidate="TxtPassword"
                                            ValidationGroup="ValidateUsers" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="TxtPassword" runat="server" placeholder="Enter Password " CssClass="form-control" TextMode="Password"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-md-6 col-sm-12">
                                    <div class="from-group">
                                        <label>Profile Pic</label>
                                        <asp:RequiredFieldValidator ID="RFVImg" ForeColor="Red" ControlToValidate="FUImg"
                                            ValidationGroup="ValidateUsers" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                        <asp:FileUpload ID="FUImg" runat="server" Class="form-control" />
                                    </div>
                                    <br />
                                </div>

                                <div class="col-md-6 col-sm-12">
                                    <div class="from-group">
                                        <label>Status</label>
                                        <asp:RequiredFieldValidator ID="RFVStatus" ForeColor="Red" ControlToValidate="DDLStatus"
                                            ValidationGroup="ValidateUsers" runat="server" ErrorMessage="*" InitialValue="Select Status..."></asp:RequiredFieldValidator>
                                        <asp:DropDownList ID="DDLStatus" CssClass="form-control" runat="server">
                                            <asp:ListItem Text="Select Status..." Value="Select Status..." />
                                            <asp:ListItem Text="Active" Value="Active" />
                                            <asp:ListItem Text="In-Active" Value="In-Active" />
                                            <asp:ListItem Text="Pending" Value="Pending" />
                                        </asp:DropDownList>
                                    </div>
                                </div>

                            </div>

                        </div>
                        <div class="modal-footer justify-content-between">
                            <asp:Button ID="BtnSave" OnClick="BtnSave_Click" PostBackUrl="~/admin/users.aspx" runat="server" 
                                class="btn btn-primary" ValidationGroup="ValidateUsers" Text="Save Changes "></asp:Button>
                        </div>
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="BtnSave" />
                </Triggers>
            </asp:UpdatePanel>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>

</asp:Content>

