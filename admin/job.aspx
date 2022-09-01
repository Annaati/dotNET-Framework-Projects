<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Dashboard.master" AutoEventWireup="true" CodeFile="job.aspx.cs" Inherits="admin_job" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="card">
        <div class="card-body">
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal-default">
                Add New Job
            </button>
        </div>


        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
            <ContentTemplate>
                <asp:GridView ID="GVJobs" AutoGenerateColumns="false" CssClass="table " runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
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
                        <asp:BoundField DataField="catName" HeaderText="cat. Name" />
                        <asp:BoundField DataField="jpName" HeaderText="Position Name" />
                        <asp:BoundField DataField="pfName" HeaderText="Job Platform" />
                        <asp:BoundField DataField="orgName" HeaderText="org. Name" />
                        <asp:BoundField DataField="publishedDate" HeaderText="pub. Date" />
                        <asp:BoundField DataField="deadLine" HeaderText="DeadLine" />
                        <asp:BoundField DataField="numPositions" HeaderText="No. Positions" />
                        <asp:BoundField DataField="startDate" HeaderText="starting Date" />
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
                                <div class="col-md-4 col-sm-12">
                                    <div class="from-group">
                                        <label>Select Job Category</label>
                                        <asp:RequiredFieldValidator ID="RFVcatName" ForeColor="Red" ControlToValidate="DDLcatName"
                                            ValidationGroup="ValidateJobs" runat="server" ErrorMessage="*" InitialValue="Select Job Cat..."></asp:RequiredFieldValidator>
                                        <asp:DropDownList ID="DDLcatName" CssClass="form-control" runat="server" AutoPostBack="true"></asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-md-4 col-sm-12">
                                    <div class="from-group">
                                        <label>Select Position Name</label>
                                        <asp:RequiredFieldValidator ID="RFVjpName" ForeColor="Red" ControlToValidate="DDLjpName"
                                            ValidationGroup="ValidateJobs" runat="server" ErrorMessage="*" InitialValue="Select Position Name..."></asp:RequiredFieldValidator>
                                        <asp:DropDownList ID="DDLjpName" CssClass="form-control" runat="server" AutoPostBack="true"></asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-md-4 col-sm-12">
                                    <div class="from-group">
                                        <label>Select Job Platform</label>
                                        <asp:RequiredFieldValidator ID="RFVJPlatform" ForeColor="Red" ControlToValidate="DDLJPlatform"
                                            ValidationGroup="ValidateJobs" runat="server" ErrorMessage="*" InitialValue="Select Job Platform..."></asp:RequiredFieldValidator>
                                        <asp:DropDownList ID="DDLJPlatform" CssClass="form-control" runat="server" AutoPostBack="true"></asp:DropDownList>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-5 col-sm-12">
                                    <div class="from-group">
                                        <label>Select org. Name</label>
                                        <asp:RequiredFieldValidator ID="RFVorgName" ForeColor="Red" ControlToValidate="DDLorgName"
                                            ValidationGroup="ValidateJobs" runat="server" ErrorMessage="*" InitialValue="Select Job org. Name..."></asp:RequiredFieldValidator>
                                        <asp:DropDownList ID="DDLorgName" CssClass="form-control" runat="server" AutoPostBack="true"></asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-md-5 col-sm-12">
                                    <div class="from-group">
                                        <label>Select Application process</label>
                                        <asp:RequiredFieldValidator ID="RFVAppprocess" ForeColor="Red" ControlToValidate="DDLAppprocess"
                                            ValidationGroup="ValidateJobs" runat="server" ErrorMessage="*" InitialValue="Select Job Application process..."></asp:RequiredFieldValidator>
                                        <asp:DropDownList ID="DDLAppprocess" CssClass="form-control" runat="server" AutoPostBack="true"></asp:DropDownList>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-8 col-sm-12">
                                    <div class="from-group">
                                        <label>Job Description</label>
                                        <asp:RequiredFieldValidator ID="RFVjDescr" ForeColor="Red" ControlToValidate="TxtjDescr"
                                            ValidationGroup="ValidateJobs" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="TxtjDescr" runat="server" placeholder=" Enter Job Description" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                                    </div>
                                </div>
                                 <div class="col-md-4 col-sm-12">
                                    <div class="from-group">
                                        <label>Pub. Date</label>
                                        <asp:RequiredFieldValidator ID="RFVpubdDate" ForeColor="Red" ControlToValidate="TxtpubdDate"
                                            ValidationGroup="ValidateJobs" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="TxtpubdDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                        <label>Dead Line</label>
                                        <asp:RequiredFieldValidator ID="RFVDeadLine" ForeColor="Red" ControlToValidate="TxtDeadLine"
                                            ValidationGroup="ValidateJobs" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="TxtDeadLine" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                                    </div>
                                </div>
                                 <div class="col-md-6 col-sm-12">
                                    <div class="from-group">
                                        <label>No. of Positions</label>
                                        <asp:RequiredFieldValidator ID="RFVNumPositions" ForeColor="Red" ControlToValidate="TxtNumPositions"
                                            ValidationGroup="ValidateJobs" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="TxtNumPositions" runat="server" placeholder="Enter Num Positions " CssClass="form-control" TextMode="Email"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-5 col-sm-12">
                                    <div class="from-group">
                                        <label>Start Date</label>
                                        <asp:RequiredFieldValidator ID="RFVStartDate" ForeColor="Red" ControlToValidate="TxtStartDate"
                                            ValidationGroup="ValidateJobs" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="TxtStartDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-7     col-sm-12">
                                    <div class="from-group">
                                        <label>Status</label>
                                        <asp:RequiredFieldValidator ID="RFVStatus" ForeColor="Red" ControlToValidate="DDLStatus"
                                            ValidationGroup="ValidateJobs" runat="server" ErrorMessage="*" InitialValue="Select Status..."></asp:RequiredFieldValidator>
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
                            <asp:Button ID="BtnSave" OnClick="BtnSave_Click" PostBackUrl="~/admin/job.aspx" runat="server"
                                class="btn btn-primary" ValidationGroup="ValidateJobs" Text="Save Changes "></asp:Button>
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

