<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="~/Controller/ListarActividades.aspx.cs" Inherits="ListarActividades" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID_ACTIVIDAD,ID_TIPO_ACTIVIDAD" DataSourceID="SqlDataSourceActividades">
        <Columns>
            <asp:BoundField DataField="ID_ACTIVIDAD" HeaderText="ID" ReadOnly="True" SortExpression="ID_ACTIVIDAD" />
            <asp:BoundField DataField="DESC_ACTIVIDAD" HeaderText="Descripcion" SortExpression="DESC_ACTIVIDAD" />
            <asp:BoundField DataField="FECHA_REALIZACION_ACT" HeaderText="Fecha a Realizar" SortExpression="FECHA_REALIZACION_ACT" />
            <asp:BoundField DataField="MONTO_RECAUDADO" HeaderText="Monto Recaudado" SortExpression="MONTO_RECAUDADO" />
            <asp:BoundField DataField="ACTIVO" HeaderText="ACTIVO" SortExpression="ACTIVO" />
            <asp:BoundField DataField="ID_TIPO_ACTIVIDAD" HeaderText="Tipo de Actividad" ReadOnly="True" SortExpression="ID_TIPO_ACTIVIDAD" />
            <asp:BoundField DataField="ID_CONTRATO" HeaderText="Contrato Relacionado" SortExpression="ID_CONTRATO" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceActividades" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;ACTIVIDAD&quot;"></asp:SqlDataSource>
</asp:Content>

