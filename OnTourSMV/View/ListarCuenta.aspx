<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="~/Controller/ListarCuenta.aspx.cs" Inherits="ListarCuenta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container">
        <div class="row">
            <h2>Cuenta</h2>
            <br />

            <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered" EmptyDataText="No Hay cuentas asociadas" AutoGenerateColumns="False" DataKeyNames="ID_CUENTA" DataSourceID="SqlDataSourceCuenta">
                <Columns>
                    <asp:BoundField DataField="ID_CUENTA" HeaderText="ID" ReadOnly="True" SortExpression="ID_CUENTA" />
                    <asp:BoundField DataField="SALDO" HeaderText="Saldo de la Cuenta" SortExpression="SALDO" DataFormatString='${0:#,0}' />
                    <asp:BoundField DataField="ID_CONTRATO" HeaderText="Contrato Relacionado" SortExpression="ID_CONTRATO" />
                    <asp:BoundField DataField="NUMRUT_CLI" HeaderText="Rut del Cliente" SortExpression="NUMRUT_CLI" />
                    <asp:BoundField DataField="ACTIVO" HeaderText="ACTIVO" SortExpression="ACTIVO" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceCuenta" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;CUENTA&quot;"></asp:SqlDataSource>
        </div>
    </div>
<div class="modal fade" id="modalMensaje" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="display: none;">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <asp:Label ID="lblModalTitulo" Text="" runat="server" CssClass="modal-title"></asp:Label>
            </div>
            <div class="modal-body">
                <asp:Label ID="lblModalMensaje" Text="" runat="server" />
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>
</div>
</asp:Content>

