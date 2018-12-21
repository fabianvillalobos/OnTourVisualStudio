<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="~/Controller/ListarActividadesContrato.aspx.cs" Inherits="ListarActividadesContrato" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="row">
            <div class="col-xs-6">
                <h2>Actividades</h2>
                <br />
            </div>
            <div class="col-xs-6 text-right padding-top-20">
                <asp:Button ID="btnNuevaActividad" runat="server" CssClass="btn btn-primary" Text="Nueva Actividad" OnClick="btnNuevaActividad_Click" />
            </div>
            <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered" EmptyDataText="No Hay Actividades asociadas" AutoGenerateColumns="False" DataSourceID="SqlDataSourceActividades">
                <Columns>
                    <asp:BoundField DataField="ID_ACTIVIDAD" HeaderText="ID" SortExpression="ID_ACTIVIDAD" />
                    <asp:BoundField DataField="DESC_ACTIVIDAD" HeaderText="Descripcion" SortExpression="DESC_ACTIVIDAD" />
                    <asp:BoundField DataField="FECHA_REALIZACION_ACT" HeaderText="Fecha Realizada" SortExpression="FECHA_REALIZACION_ACT" DataFormatString='{0:MM-dd-yyyy}' />
                    <asp:BoundField DataField="MONTO_RECAUDADO" HeaderText="Monto Recaudado" SortExpression="MONTO_RECAUDADO" DataFormatString='${0:#,0}' />
                    <asp:BoundField DataField="DESC_TIPO_ACT" HeaderText="Tipo de Actividad" SortExpression="DESC_TIPO_ACT" />
<%--                    <asp:BoundField DataField="ID_CONTRATO" HeaderText="Contrato Relacionado" SortExpression="ID_CONTRATO" />--%>
                    <asp:BoundField DataField="ACTIVO" HeaderText="ACTIVO" SortExpression="ACTIVO" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceActividades" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT ONTOUR.ACTIVIDAD.ID_ACTIVIDAD, ONTOUR.ACTIVIDAD.DESC_ACTIVIDAD, ONTOUR.ACTIVIDAD.FECHA_REALIZACION_ACT, ONTOUR.ACTIVIDAD.MONTO_RECAUDADO, ONTOUR.TIPO_ACTIVIDAD.DESC_TIPO_ACT, ONTOUR.ACTIVIDAD.ID_CONTRATO, ONTOUR.ACTIVIDAD.ACTIVO FROM ONTOUR.ACTIVIDAD INNER JOIN ONTOUR.TIPO_ACTIVIDAD ON ONTOUR.ACTIVIDAD.ID_TIPO_ACTIVIDAD = ONTOUR.TIPO_ACTIVIDAD.ID_TIPO_ACTIIVIDAD WHERE (ONTOUR.ACTIVIDAD.ID_CONTRATO = :id)">
                <SelectParameters>
                    <asp:Parameter Name="id" Type="String" />
                </SelectParameters>  
            </asp:SqlDataSource>
        <div class="col-xs-6 text-left padding-top-20">
                <asp:Button ID="btnVolverAContratos" runat="server" CssClass="btn btn-success" Text="Volver a Contratos" OnClick="btnVolverAContratos_Click" />
            </div>
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

