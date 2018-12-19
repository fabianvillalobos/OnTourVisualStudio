<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="~/Controller/ListarTransaccion.aspx.cs" Inherits="ListarTransaccion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="row">
            <div class="col-xs-6">
                <h3>Transacciones</h3>
                <br />
            </div>
            <div class="col-xs-6 text-right padding-top-20">
                <a href="NuevaTransferencia.aspx?ID_CONTRATO=<%=Request.QueryString["ID_CONTRATO"] %>" class="btn btn-success"><i class='glyphicon glyphicon-plus'></i> <span>Nueva transacción</span></a>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-12">
                <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered" EmptyDataText="No Hay transacciones asociadas" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="ID_TRANSACCION" HeaderText="ID Transacción" SortExpression="ID_TRANSACCION"/>
                    <asp:BoundField DataField="FECHA_TRANSACCION" HeaderText="Fecha Transacción" SortExpression="FECHA_TRANSACCION" DataFormatString='{0:MM-dd-yyyy}' />
                    <asp:BoundField DataField="MONTO_TRANSACCION" HeaderText="Monto Transacción" SortExpression="MONTO_TRANSACCION" DataFormatString='${0:#,0}' />
                    <asp:BoundField DataField="ID_CUENTA" HeaderText="ID Cuenta" SortExpression="ID_CUENTA"  Visible="false" />
                    <asp:BoundField DataField="ACTIVO" HeaderText="Activo" SortExpression="ACTIVO"  Visible="false" />
                    <asp:BoundField DataField="DESC_TRANSACCION" HeaderText="Descripción Transacción" SortExpression="DESC_TRANSACCION" />
                    <asp:BoundField DataField="NUMRUT_CLI" HeaderText="Rut Cliente" SortExpression="NUMRUT_CLI" />
                    <asp:BoundField DataField="NOMBRE" HeaderText="Nombre" SortExpression="NOMBRE" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT ONTOUR.TRANSACCION.ID_TRANSACCION, ONTOUR.TRANSACCION.FECHA_TRANSACCION, ONTOUR.TRANSACCION.MONTO_TRANSACCION, ONTOUR.TRANSACCION.ID_CUENTA, ONTOUR.TRANSACCION.ACTIVO, ONTOUR.TIPO_TRANSACCION.DESC_TRANSACCION, ONTOUR.CUENTA.NUMRUT_CLI,ONTOUR.CLIENTE.NOMBRE_CLIE ||' '|| ONTOUR.CLIENTE.APELLIDO_PAT_CLI ||' '||NVL(ONTOUR.CLIENTE.APELLIDO_MAT_CLI,'') AS NOMBRE FROM ONTOUR.TRANSACCION INNER JOIN ONTOUR.TIPO_TRANSACCION ON ONTOUR.TRANSACCION.ID_TIPO_TRANSACCION = ONTOUR.TIPO_TRANSACCION.ID_TIPO_TRANSACCION INNER JOIN ONTOUR.CUENTA ON ONTOUR.TRANSACCION.ID_CUENTA = ONTOUR.CUENTA.ID_CUENTA INNER JOIN ONTOUR.CLIENTE ON ONTOUR.CUENTA.NUMRUT_CLI = ONTOUR.CLIENTE.NUMRUT_CLI WHERE (ONTOUR.CUENTA.ID_CONTRATO = :id)">
                <SelectParameters>
                    <asp:Parameter Name="id" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            </div>
            <div class="col-xs-6 text-left padding-top-20">
                <asp:Button ID="btnVolverAContratos" runat="server" CssClass="btn btn-success" Text="Volver a Contratos" OnClick="btnVolverAContratos_Click" />
            </div>
        </div>
    </div>
</asp:Content>

