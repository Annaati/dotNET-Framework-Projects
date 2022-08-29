<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Dashboard.master" AutoEventWireup="true" CodeFile="process.aspx.cs" Inherits="admin_process" %>

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
                <asp:GridView ID="GVProcess" AutoGenerateColumns="false" CssClass="table " runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
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


    <div class="modal fade" id="modal-lg">
        <div class="modal-dialog modal-lg">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Processes</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                        </div>
                        <div class="modal-footer justify-content-between">
                            <button type="button" class="btn btn-primary">Save changes</button>
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
    <!-- /.modal -->

</asp:Content>

