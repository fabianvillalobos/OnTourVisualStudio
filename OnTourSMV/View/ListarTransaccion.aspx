<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="~/Controller/ListarTransaccion.aspx.cs" Inherits="ListarTransaccion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container">
        <div class="row">
            <h2>Transacciones</h2>
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered" EmptyDataText="No Hay transacciones asociadas" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="ID_TRANSACCION" HeaderText="ID Transacción" SortExpression="ID_TRANSACCION" />
                    <asp:BoundField DataField="FECHA_TRANSACCION" HeaderText="Fecha Transacción" SortExpression="FECHA_TRANSACCION" />
                    <asp:BoundField DataField="MONTO_TRANSACCION" HeaderText="Monto Transacción" SortExpression="MONTO_TRANSACCION" />
                    <asp:BoundField DataField="ID_CUENTA" HeaderText="ID Cuenta" SortExpression="ID_CUENTA" />
                    <asp:BoundField DataField="ACTIVO" HeaderText="Activo" SortExpression="ACTIVO" />
                    <asp:BoundField DataField="DESC_TRANSACCION" HeaderText="Descripción Transacción" SortExpression="DESC_TRANSACCION" />
                    <asp:BoundField DataField="NUMRUT_CLI" HeaderText="Rut Cliente" SortExpression="NUMRUT_CLI" />
                    <asp:BoundField DataField="NOMBRE_CLIE" HeaderText="Nombre Cliente" SortExpression="NOMBRE_CLIE" />
                    <asp:BoundField DataField="APELLIDO_PAT_CLI" HeaderText="Apellido Paterno" SortExpression="APELLIDO_PAT_CLI" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT ONTOUR.TRANSACCION.ID_TRANSACCION, ONTOUR.TRANSACCION.FECHA_TRANSACCION, ONTOUR.TRANSACCION.MONTO_TRANSACCION, ONTOUR.TRANSACCION.ID_CUENTA, ONTOUR.TRANSACCION.ACTIVO, ONTOUR.TIPO_TRANSACCION.DESC_TRANSACCION, ONTOUR.CUENTA.NUMRUT_CLI, ONTOUR.CLIENTE.NOMBRE_CLIE, ONTOUR.CLIENTE.APELLIDO_PAT_CLI FROM ONTOUR.TRANSACCION INNER JOIN ONTOUR.TIPO_TRANSACCION ON ONTOUR.TRANSACCION.ID_TIPO_TRANSACCION = ONTOUR.TIPO_TRANSACCION.ID_TIPO_TRANSACCION INNER JOIN ONTOUR.CUENTA ON ONTOUR.TRANSACCION.ID_CUENTA = ONTOUR.CUENTA.ID_CUENTA INNER JOIN ONTOUR.CLIENTE ON ONTOUR.CUENTA.NUMRUT_CLI = ONTOUR.CLIENTE.NUMRUT_CLI"></asp:SqlDataSource>
        </div>
    </div>
</asp:Content>

