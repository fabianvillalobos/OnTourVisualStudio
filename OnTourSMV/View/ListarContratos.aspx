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
            <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered" EmptyDataText="No Hay contratos asociados" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowSorting="True">
                <Columns>
                    <asp:BoundField DataField="ID_CONTRATO" HeaderText="ID_CONTRATO" SortExpression="ID_CONTRATO" />
                    <asp:BoundField DataField="NOMBRE" HeaderText="NOMBRE" SortExpression="NOMBRE" />
                    <asp:BoundField DataField="APELLIDO" HeaderText="APELLIDO" SortExpression="APELLIDO" />
                    <asp:BoundField DataField="FECHA_INICIO" HeaderText="FECHA_INICIO" SortExpression="FECHA_INICIO"/>
                    <asp:BoundField DataField="TERMINO" HeaderText="TERMINO" SortExpression="TERMINO" />
                    <asp:BoundField HeaderText="ESTADO" DataField="ESTADO" SortExpression="ESTADO" />
                    <asp:BoundField DataField="RESERVA" HeaderText="RESERVA" SortExpression="RESERVA" />
                    <asp:BoundField DataField="META" HeaderText="META" SortExpression="META" />
                    <asp:BoundField DataField="SALDO" HeaderText="SALDO" SortExpression="SALDO" />
                </Columns>
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT ONTOUR.CONTRATO.ID_CONTRATO, ONTOUR.CLIENTE.NOMBRE_CLIE AS Nombre, ONTOUR.CLIENTE.APELLIDO_PAT_CLI AS Apellido, ONTOUR.CONTRATO.FECHA_INICIO, ONTOUR.CONTRATO.FECHA_TERMINO AS Termino, ONTOUR.CONTRATO.ESTADO AS Estado, ONTOUR.CONTRATO.MONTO_RESERVA AS Reserva, ONTOUR.CONTRATO.META AS Meta, ONTOUR.CUENTA.SALDO AS Saldo FROM ONTOUR.CONTRATO INNER JOIN ONTOUR.CLIENTE ON ONTOUR.CONTRATO.NUMRUT_CLI_TITULAR = ONTOUR.CLIENTE.NUMRUT_CLI INNER JOIN ONTOUR.EMPLEADO ON ONTOUR.CONTRATO.NUMRUT_EMP = ONTOUR.EMPLEADO.NUMRUT_EMP INNER JOIN ONTOUR.CUENTA ON ONTOUR.CONTRATO.ID_CONTRATO = ONTOUR.CUENTA.ID_CONTRATO AND ONTOUR.CLIENTE.NUMRUT_CLI = ONTOUR.CUENTA.NUMRUT_CLI"></asp:SqlDataSource>
        </div>
    </div>
    </center>
</asp:Content>

