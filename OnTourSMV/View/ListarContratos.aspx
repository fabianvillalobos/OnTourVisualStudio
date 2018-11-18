<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="~/Controller/ListarContratos.aspx.cs" Inherits="ListarContratos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container">
        <div class="row">
            <h2>Contratos</h2>
            <br />
            <asp:Button ID="btnNuevoContrato" runat="server" CssClass="btn btn-primary" Text="Nuevo Contrato" OnClick="btnNuevoContrato_Click" />
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered" EmptyDataText="No Hay contratos asociados" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSourceListaContratos" AllowSorting="True">
                <Columns>
                    <asp:BoundField DataField="ID_CONTRATO" HeaderText="ID_CONTRATO" SortExpression="ID_CONTRATO" />
                    <asp:BoundField DataField="NOMBRE_CLIE" HeaderText="NOMBRE_CLIE" SortExpression="NOMBRE_CLIE" />
                    <asp:BoundField DataField="APELLIDO_PAT_CLI" HeaderText="APELLIDO_PAT_CLI" SortExpression="APELLIDO_PAT_CLI" />
                    <asp:BoundField DataField="FECHA_INICIO" HeaderText="FECHA_INICIO" SortExpression="FECHA_INICIO"/>
                    <asp:BoundField DataField="FECHA_TERMINO" HeaderText="FECHA_TERMINO" SortExpression="FECHA_TERMINO" />
                    <asp:BoundField HeaderText="ESTADO" DataField="ESTADO" SortExpression="ESTADO" />
                    <asp:BoundField DataField="MONTO_RESERVA" HeaderText="MONTO_RESERVA" SortExpression="MONTO_RESERVA" />
                    <asp:BoundField DataField="META" HeaderText="META" SortExpression="META" />
                    <asp:BoundField DataField="SALDO" HeaderText="SALDO" SortExpression="SALDO" />
                </Columns>
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSourceListaContratos" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT ONTOUR.CONTRATO.ID_CONTRATO, ONTOUR.CLIENTE.NOMBRE_CLIE, ONTOUR.CLIENTE.APELLIDO_PAT_CLI, ONTOUR.CONTRATO.FECHA_INICIO, ONTOUR.CONTRATO.FECHA_TERMINO, ONTOUR.CONTRATO.ESTADO, ONTOUR.CONTRATO.MONTO_RESERVA, ONTOUR.CONTRATO.META, ONTOUR.CUENTA.SALDO FROM ONTOUR.CLIENTE INNER JOIN ONTOUR.CONTRATO ON ONTOUR.CLIENTE.NUMRUT_CLI = ONTOUR.CONTRATO.NUMRUT_CLI_TITULAR INNER JOIN ONTOUR.CUENTA ON ONTOUR.CLIENTE.NUMRUT_CLI = ONTOUR.CUENTA.NUMRUT_CLI AND ONTOUR.CONTRATO.ID_CONTRATO = ONTOUR.CUENTA.ID_CONTRATO"></asp:SqlDataSource>
        </div>
    </div>
    </center>
</asp:Content>

