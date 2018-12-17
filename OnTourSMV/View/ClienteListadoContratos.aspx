<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" EnableEventValidation="false" AutoEventWireup="true" CodeFile="~/Controller/ClienteListadoContratos.aspx.cs" Inherits="ClienteListadoContratos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="row">
            <div class="col-xs-6">
                <h3>Mis Contratos</h3>
            </div>
            <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered" EmptyDataText="No Hay contratos asociados" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowPaging="True">
                <Columns>
                    <asp:BoundField DataField="ID_CONTRATO" HeaderText="ID" SortExpression="ID_CONTRATO" />
                    <asp:TemplateField HeaderText="Nombre Mandante" SortExpression="Nombre">
                        <ItemTemplate>
                            <asp:Label ID="Rut" runat="server" Text='<%#Eval("NOMBRE")+ " " + Eval("APELLIDO")%>' ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="FECHA_INICIO" HeaderText="Inicio" SortExpression="FECHA_INICIO" DataFormatString='{0:MM-dd-yyyy}'/>
                    <asp:BoundField DataField="TERMINO" HeaderText="Termino" SortExpression="TERMINO" DataFormatString='{0:MM-dd-yyyy}'/>
                    <asp:TemplateField HeaderText="Estado" SortExpression="Estado">
                        <ItemTemplate>
                            <asp:Label Visible='<%# Eval("Estado").ToString().Equals("P") %>' Text="<div class='progreso btn-primary'>En Progreso</div>" runat="server" />
                            <asp:Label Visible='<%# Eval("Estado").ToString().Equals("T") %>' Text="<div class='progreso btn-success'>Terminado</div>" runat="server" />
                            <asp:Label Visible='<%# Eval("Estado").ToString().Equals("F") %>' Text="<div class='progreso btn-danger'>Cancelado</div>" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="RESERVA" HeaderText="Reserva" SortExpression="RESERVA" DataFormatString='${0:#,0}' />
                    <asp:BoundField DataField="META" HeaderText="Meta" SortExpression="META" DataFormatString='${0:#,0}' />
                    <asp:BoundField DataField="SALDO" HeaderText="Saldo Pendiente" SortExpression="SALDO" DataFormatString='${0:#,0}' />
                    <asp:HyperLinkField HeaderText="Actividades" ControlStyle-CssClass="btn btn-success progreso btn-editar" DataNavigateUrlFields="ID_CONTRATO" DataNavigateUrlFormatString="ListarActividadesContrato.aspx?ID_CONTRATO={0}" Text="<i class='glyphicon glyphicon-search'></i> <span>Ver</span>" />
                    <asp:HyperLinkField HeaderText="Transacciones" ControlStyle-CssClass="btn btn-success progreso btn-editar" DataNavigateUrlFields="ID_CONTRATO" DataNavigateUrlFormatString="ListarTransaccion.aspx?ID_CONTRATO={0}" Text="<i class='glyphicon glyphicon-search'></i> <span>Ver</span>" />
                    <asp:HyperLinkField HeaderText="Ver" ControlStyle-CssClass="btn btn-success progreso btn-editar" DataNavigateUrlFields="ID_CONTRATO" DataNavigateUrlFormatString="ClienteDetalleContrato.aspx?ID_CONTRATO={0}" Text="<i class='glyphicon glyphicon-search'></i> <span>Ver</span>" />
                </Columns>
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT ONTOUR.CONTRATO.ID_CONTRATO, ONTOUR.CLIENTE.NOMBRE_CLIE AS Nombre, ONTOUR.CLIENTE.APELLIDO_PAT_CLI AS Apellido, ONTOUR.CONTRATO.FECHA_INICIO, ONTOUR.CONTRATO.FECHA_TERMINO AS Termino, ONTOUR.CONTRATO.ESTADO AS Estado, ONTOUR.CONTRATO.MONTO_RESERVA AS Reserva, ONTOUR.CONTRATO.META AS Meta, ONTOUR.CUENTA.SALDO AS Saldo FROM ONTOUR.CONTRATO INNER JOIN ONTOUR.CLIENTE ON ONTOUR.CONTRATO.NUMRUT_CLI_TITULAR = ONTOUR.CLIENTE.NUMRUT_CLI INNER JOIN ONTOUR.EMPLEADO ON ONTOUR.CONTRATO.NUMRUT_EMP = ONTOUR.EMPLEADO.NUMRUT_EMP INNER JOIN ONTOUR.CUENTA ON ONTOUR.CONTRATO.ID_CONTRATO = ONTOUR.CUENTA.ID_CONTRATO AND ONTOUR.CLIENTE.NUMRUT_CLI = ONTOUR.CUENTA.NUMRUT_CLI" OnInit="cargarContratosPorCliente"></asp:SqlDataSource>
        </div>
    </div>
</asp:Content>

