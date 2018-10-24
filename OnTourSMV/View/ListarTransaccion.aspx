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
                    <asp:BoundField DataField="ID_TRANSACCION" HeaderText="ID" SortExpression="ID_TRANSACCION" />
                    <asp:BoundField DataField="FECHA_TRANSACCION" HeaderText="Fecha de Transaccion" SortExpression="FECHA_TRANSACCION" DataFormatString='{0:MM-dd-yyyy}' />
                    <asp:BoundField DataField="MONTO_TRANSACCION" HeaderText="Monto" SortExpression="MONTO_TRANSACCION" />
                    <asp:BoundField DataField="ID_CUENTA" HeaderText="Id Cuenta" SortExpression="ID_CUENTA" />
                    <asp:BoundField DataField="ACTIVO" HeaderText="ACTIVO" SortExpression="ACTIVO" />
                    <asp:BoundField DataField="DESC_TRANSACCION" HeaderText="Tipo de Transaccion" SortExpression="DESC_TRANSACCION" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT ONTOUR.TRANSACCION.ID_TRANSACCION, ONTOUR.TRANSACCION.FECHA_TRANSACCION, ONTOUR.TRANSACCION.MONTO_TRANSACCION, ONTOUR.TRANSACCION.ID_CUENTA, ONTOUR.TRANSACCION.ACTIVO, ONTOUR.TIPO_TRANSACCION.DESC_TRANSACCION FROM ONTOUR.TRANSACCION INNER JOIN ONTOUR.TIPO_TRANSACCION ON ONTOUR.TRANSACCION.ID_TIPO_TRANSACCION = ONTOUR.TIPO_TRANSACCION.ID_TIPO_TRANSACCION"></asp:SqlDataSource>
        </div>
    </div>
</asp:Content>

