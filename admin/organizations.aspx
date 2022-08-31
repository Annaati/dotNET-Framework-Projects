<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Dashboard.master" AutoEventWireup="true" CodeFile="organizations.aspx.cs" Inherits="admin_organizations" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="card">
        <div class="card-body">
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal-default">
                Add Organization
            </button>
        </div>


        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
            <ContentTemplate>
                <asp:GridView ID="GVOrganizations" AutoGenerateColumns="false" CssClass="table " runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
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
                        <asp:BoundField DataField="orgName" HeaderText="org. Name" />
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
                            <h4 class="modal-title">Organizations</h4>
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
                                        <label>Org. Name</label>
                                        <asp:RequiredFieldValidator ID="RFVOrgName" ForeColor="Red" ControlToValidate="TxtOrgName"
                                            ValidationGroup="ValidateOrganization" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="TxtOrgName" runat="server" placeholder=" Enter Org. Name" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-md-6 col-sm-12">
                                    <div class="from-group">
                                        <label>Org. Description</label>
                                        <asp:RequiredFieldValidator ID="RFVOrgDescr" ForeColor="Red" ControlToValidate="TxtOrgDescr"
                                            ValidationGroup="ValidateOrganization" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="TxtOrgDescr" runat="server" placeholder=" Enter Org. Description" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-md-6 col-sm-12">
                                    <label>Org. Tell Number</label>
                                    <div class="form-group">
                                        <asp:RequiredFieldValidator ID="RFVOrgTellNum" ForeColor="Red" ControlToValidate="TxtOrgTellNum"
                                            ValidationGroup="ValidateOrganization" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="TxtOrgTellNum" runat="server" placeholder=" Enter Org. Tell Number" CssClass="form-control" TextMode="Number"></asp:TextBox>
                                    </div>

                                </div>

                                <div class="col-md-6 col-sm-12">
                                    <div class="from-group">
                                        <label>Org. Email</label>
                                        <asp:RequiredFieldValidator ID="RFVOrgEmail" ForeColor="Red" ControlToValidate="TxtOrgEmail"
                                            ValidationGroup="ValidateOrganization" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="TxtOrgEmail" runat="server" placeholder="Enter Org. Email " CssClass="form-control" TextMode="Email"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-md-6 col-sm-12">
                                    <div class="from-group">
                                        <label>Password</label>
                                        <asp:RequiredFieldValidator ID="RFVPassword" ForeColor="Red" ControlToValidate="TxtPassword"
                                            ValidationGroup="ValidateOrganization" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="TxtPassword" runat="server" placeholder="Enter Password " CssClass="form-control" TextMode="Password"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-md-6 col-sm-12">
                                    <div class="from-group">
                                        <label>Org. Logo</label>
                                        <asp:RequiredFieldValidator ID="RFVOrgLogo" ForeColor="Red" ControlToValidate="OrgLogo"
                                            ValidationGroup="ValidateOrganization" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                        <asp:FileUpload ID="OrgLogo" runat="server" Class="form-control" />
                                    </div>
                                    <br />
                                </div>

                                <%-- Registered Date --%>
                                <%-- User Id --%>

                                <div class="col-md-6 col-sm-12">
                                    <div class="from-group">
                                        <label>Status</label>
                                        <asp:RequiredFieldValidator ID="RFVStatus" ForeColor="Red" ControlToValidate="DDLStatus"
                                            ValidationGroup="ValidateOrganization" runat="server" ErrorMessage="*" InitialValue="Select Status..."></asp:RequiredFieldValidator>
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
                            <asp:Button ID="BtnSave" OnClick="BtnSave_Click" PostBackUrl="~/admin/organizations.aspx" runat="server"
                                class="btn btn-primary" ValidationGroup="g1" Text="Save Changes "></asp:Button>

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

