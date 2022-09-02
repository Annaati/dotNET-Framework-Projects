<%@ Page Title="" Language="C#" MasterPageFile="~/DashBoard.master" EnableEventValidation="false" AutoEventWireup="true" CodeFile="users.aspx.cs" Inherits="admin_users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <div class="card card-outline card-info">
        <div class="card-body">
            <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#modal-default">
                Add 
            </button>


            <br />
            <br />
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="GVUsers" Width="100%" AutoGenerateColumns="false" CssClass="table table-hover" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />

                        <Columns>

                            <asp:BoundField DataField="id" HeaderText="Id" />
                            <asp:BoundField DataField="fullName" HeaderText="Full Name" />
                            <asp:BoundField DataField="gender" HeaderText="Gender" />
                            <asp:BoundField DataField="tellNum" HeaderText="Phone No" />
                            <asp:BoundField DataField="email" HeaderText="Email" />
                            <asp:BoundField DataField="regDate" HeaderText="Date Reg" />
                            <asp:BoundField DataField="status" HeaderText="Status" />

                            <asp:TemplateField HeaderText="Action">
                                <ItemTemplate>
                                    <asp:LinkButton ID="BtnEdit" runat="server" OnClick="BtnEdit_Click"><i class="fa fa-pen"></i></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>

                        </Columns>

                    </asp:GridView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>

    <script type="text/javascript">
        function openBranchModal() {
            $('#modal-default').modal('show');
        }
    </script>

    <div class="modal fade" id="modal-default">
        <div class="modal-dialog  modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Users</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                    <asp:Label ID="LblMsg" runat="server" Text=""></asp:Label>
                    <br />
                    <br />

                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <div class="form-row">

                                <div class="form-group col-md-5">
                                    <asp:Label ID="Label1" runat="server" Text="Branch Name"></asp:Label>
                                    <asp:RequiredFieldValidator ID="RFVFullName" ForeColor="Red" ControlToValidate="TxtFullName"
                                        ValidationGroup="VGUsers" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="TxtFullName" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group col-md-6">
                                    <asp:Label ID="Label6" runat="server" Text="Gender"></asp:Label>
                                    <asp:DropDownList ID="DDLGender" Class="form-control" runat="server">
                                        <asp:ListItem>Select Gender...</asp:ListItem>
                                        <asp:ListItem>Male</asp:ListItem>
                                        <asp:ListItem>Female</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="form-group col-md-6">
                                    <asp:Label ID="Label7" runat="server" Text="Date of Birth"></asp:Label>
                                    <asp:RequiredFieldValidator ID="RFVDOB" Text="*" ForeColor="Red" ControlToValidate="TxtDOB"
                                        ValidationGroup="ValidateUsers" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="TxtDOB" TextMode="Date" Class="form-control" runat="server"></asp:TextBox>
                                </div>

                                <div class="form-group col-md-6">
                                    <asp:Label ID="Label4" runat="server" Text="Phone No"></asp:Label>
                                    <asp:RequiredFieldValidator ID="RFVTellNum" Text="*" ForeColor="Red" ControlToValidate="TxtTellNum"
                                        ValidationGroup="ValidateUsers" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="TxtTellNum" Class="form-control" runat="server" TextMode="Number" placeholder="Enter Phone No"></asp:TextBox>
                                </div>

                                <div class="form-group col-md-6">
                                    <asp:Label ID="Label5" runat="server" Text="Email"></asp:Label>
                                    <asp:RequiredFieldValidator ID="RFVEmail" Text="*" ForeColor="Red" ControlToValidate="TxtEmail"
                                        ValidationGroup="ValidateUsers" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="TxtEmail" Class="form-control" runat="server" TextMode="Email" placeholder="Enter Email"></asp:TextBox>
                                </div>

                                <div class="form-group col-md-6">
                                    <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
                                    <asp:RequiredFieldValidator ID="RFVPassword" ForeColor="Red" ControlToValidate="TxtPassword"
                                        ValidationGroup="ValidateUsers" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="TxtPassword" Class="form-control" runat="server" placeholder="Enter Password"></asp:TextBox>
                                </div>

                                <div class="form-group col-md-6">
                                    <asp:Label ID="Label3" runat="server" Text="Status"></asp:Label>
                                    <asp:DropDownList ID="DDLStatus" Class="form-control" runat="server">
                                        <asp:ListItem>Select Status...</asp:ListItem>
                                        <asp:ListItem>active</asp:ListItem>
                                        <asp:ListItem>inActive</asp:ListItem>
                                        <asp:ListItem>pending</asp:ListItem>
                                    </asp:DropDownList>
                                </div>

                                <%--<div class="form-group col-md-6">
                                    <asp:FileUpload ID="FUImg" Class="form-control" runat="server" />
                                </div>--%>

                                <%-- Registered Date --%>
                                <%-- User Id --%>
                                <%-- Status --%>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>

                </div>

                <div class="modal-footer justify-content-between">
                            <asp:Button ID="BtnSave" PostBackUrl="~/users.aspx" runat="server" class="btn btn-primary"
                                ValidationGroup="VGUsers" Text="Save Changes" OnClick="BtnSave_Click"></asp:Button>
                </div>


            </div>
        </div>
    </div>

</asp:Content>

