<%@ Page Title="" Language="C#" MasterPageFile="~/DashBoard.master" AutoEventWireup="true" CodeFile="rptUsers.aspx.cs" Inherits="rptUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

   

    <script type="text/javascript">
        $(document).ready(function () {
            var table = $('#datatable').dataTable();
            var tableTools = new $.fn.dataTable.TableTools(table, {
                'aButtons': [
                    {
                        'sExtends': 'xls',
                        'sButtonText': 'Save to Excel',
                        'sFileName': 'Data.xls'
                    },
                    {
                        'sExtends': 'print',
                        'bShowAll': true,
                    },
                    {
                        'sExtends': 'pdf',
                        'bFooter': false
                    },
                    'copy',
                    'csv'
                ],
                'sSwfPath': '//cdn.datatables.net/tabletools/2.2.4/swf/copy_csv_xls_pdf.swf'
            });
            $(tableTools.fnContainer()).insertBefore('#datatable_wrapper');
        });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%--<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>--%>
    <!-- Main content -->
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card card-primary card-outline">
                    <div class="card-body">
                    </div>
                    <div class="row">
                        <asp:Label ID="LlbGVError" runat="server" Text="" Style="height: 20px; padding-left: 30%; font-size: 22px;"></asp:Label>
                        <table id="datatable">
                            <thead>
                                <tr>
                                    <th>ID
                                    </th>
                                    <th>City
                                    </th>
                                    <th>Country
                                    </th>
                                    <th>Continent
                                    </th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th>ID
                                    </th>
                                    <th>City
                                    </th>
                                    <th>Country
                                    </th>
                                    <th>Continent
                                    </th>
                                </tr>
                            </tfoot>
                            <tbody>
                                <tr>
                                    <td>1</td>
                                    <td>Montería</td>
                                    <td>Colombia</td>
                                    <td>South America</td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td>Birmingham</td>
                                    <td>United Kingdom</td>
                                    <td>Europe</td>
                                </tr>
                                <tr>
                                    <td>3</td>
                                    <td>Bangalore</td>
                                    <td>India</td>
                                    <td>Asia</td>
                                </tr>
                                <tr>
                                    <td>4</td>
                                    <td>Tokyo</td>
                                    <td>Japan</td>
                                    <td>Asia</td>
                                </tr>
                                <tr>
                                    <td>5</td>
                                    <td>Kuala Lumpur</td>
                                    <td>Malaysia</td>
                                    <td>Asia</td>
                                </tr>
                                <tr>
                                    <td>6</td>
                                    <td>Rio de Janeiro</td>
                                    <td>Brazil</td>
                                    <td>South America</td>
                                </tr>
                                <tr>
                                    <td>7</td>
                                    <td>Ipoh</td>
                                    <td>Malaysia</td>
                                    <td>Asia</td>
                                </tr>
                                <tr>
                                    <td>8</td>
                                    <td>Tawau</td>
                                    <td>Malaysia</td>
                                    <td>Asia</td>
                                </tr>
                                <tr>
                                    <td>9</td>
                                    <td>Hiroshima</td>
                                    <td>Japan</td>
                                    <td>Asia</td>
                                </tr>
                                <tr>
                                    <td>10</td>
                                    <td>Cannes</td>
                                    <td>France</td>
                                    <td>Europe</td>
                                </tr>
                                <tr>
                                    <td>11</td>
                                    <td>London</td>
                                    <td>United Kingdom</td>
                                    <td>Europe</td>
                                </tr>
                                <tr>
                                    <td>12</td>
                                    <td>Saku</td>
                                    <td>Japan</td>
                                    <td>Asia</td>
                                </tr>
                                <tr>
                                    <td>13</td>
                                    <td>Nice</td>
                                    <td>France</td>
                                    <td>Europe</td>
                                </tr>

                                <tr>
                                    <td>14</td>
                                    <td>Manchester</td>
                                    <td>United Kingdom</td>
                                    <td>Europe</td>
                                </tr>
                                <tr>
                                    <td>15</td>
                                    <td>Salvador</td>
                                    <td>Brazil</td>
                                    <td>South America</td>
                                </tr>

                                <tr>
                                    <td>16</td>
                                    <td>Cali</td>
                                    <td>Colombia</td>
                                    <td>South America</td>
                                </tr>
                                <tr>
                                    <td>17</td>
                                    <td>Chennai</td>
                                    <td>India</td>
                                    <td>Asia</td>
                                </tr>
                                <tr>
                                    <td>18</td>
                                    <td>Brasília</td>
                                    <td>Brazil</td>
                                    <td>South America</td>
                                </tr>
                                <tr>
                                    <td>19</td>
                                    <td>Mumbai</td>
                                    <td>India</td>
                                    <td>Asia</td>
                                </tr>
                                <tr>
                                    <td>20</td>
                                    <td>Paris</td>
                                    <td>France</td>
                                    <td>Europe</td>
                                </tr>
                                <tr>
                                    <td>21</td>
                                    <td>Bello</td>
                                    <td>Colombia</td>
                                    <td>South America</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="card-footer">
                        <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>--%>
                        <asp:GridView ID="GVUsers" AutoGenerateColumns="False" class="table table-bordered table-striped table-hover" runat="server" CellPadding="4" GridLines="None" ForeColor="#333333">
                            <AlternatingRowStyle BackColor="White" />
                            <EditRowStyle BackColor="#2461BF" />
                            <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
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
                                <asp:BoundField DataField="tellNum" HeaderText="Tell Num" />
                                <asp:BoundField DataField="email" HeaderText="Email" />
                                <asp:BoundField DataField="regDate" HeaderText="Reg. Date" />
                                <asp:BoundField DataField="status" HeaderText="Status" />
                            </Columns>
                        </asp:GridView>
                        <%--</ContentTemplate>
                            </asp:UpdatePanel>--%>
                    </div>
                    <!-- /.card -->
                </div>
            </div>
            <!-- /.col -->
        </div>
        <!-- ./row -->
    </div>
    <!-- /.container-fluid -->

</asp:Content>

