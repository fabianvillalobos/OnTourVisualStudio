﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="~/Controller/ListarActividadesContrato.aspx.cs" Inherits="ListarActividadesContrato" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="row">
            <h2>Actividades</h2>
            <br />
            <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered" EmptyDataText="No Hay Actividades asociadas" AutoGenerateColumns="False" DataSourceID="SqlDataSourceActividades">
                <Columns>
                    <asp:BoundField DataField="ID_ACTIVIDAD" HeaderText="ID" SortExpression="ID_ACTIVIDAD" />
                    <asp:BoundField DataField="DESC_ACTIVIDAD" HeaderText="Descripcion" SortExpression="DESC_ACTIVIDAD" />
                    <asp:BoundField DataField="FECHA_REALIZACION_ACT" HeaderText="Fecha a Realizar" SortExpression="FECHA_REALIZACION_ACT" DataFormatString='{0:MM-dd-yyyy}' />
                    <asp:BoundField DataField="MONTO_RECAUDADO" HeaderText="Monto Recaudado" SortExpression="MONTO_RECAUDADO" DataFormatString='${0:#,0}' />
                    <asp:BoundField DataField="DESC_TIPO_ACT" HeaderText="Tipo de Actividad" SortExpression="DESC_TIPO_ACT" />
                    <asp:BoundField DataField="ID_CONTRATO" HeaderText="Contrato Relacionado" SortExpression="ID_CONTRATO" />
                    <asp:BoundField DataField="ACTIVO" HeaderText="ACTIVO" SortExpression="ACTIVO" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceActividades" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT ONTOUR.ACTIVIDAD.ID_ACTIVIDAD, ONTOUR.ACTIVIDAD.DESC_ACTIVIDAD, ONTOUR.ACTIVIDAD.FECHA_REALIZACION_ACT, ONTOUR.ACTIVIDAD.MONTO_RECAUDADO, ONTOUR.TIPO_ACTIVIDAD.DESC_TIPO_ACT, ONTOUR.ACTIVIDAD.ID_CONTRATO, ONTOUR.ACTIVIDAD.ACTIVO FROM ONTOUR.ACTIVIDAD INNER JOIN ONTOUR.TIPO_ACTIVIDAD ON ONTOUR.ACTIVIDAD.ID_TIPO_ACTIVIDAD = ONTOUR.TIPO_ACTIVIDAD.ID_TIPO_ACTIIVIDAD WHERE ONTOUR.ACTIVIDAD.ID_CONTRATO = @id"></asp:SqlDataSource>
        </div>
    </div>
</asp:Content>

