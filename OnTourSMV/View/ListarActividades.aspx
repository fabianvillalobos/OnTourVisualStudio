<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="~/Controller/ListarActividades.aspx.cs" Inherits="ListarActividades" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceActividades" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:BoundField DataField="ID_ACTIVIDAD" HeaderText="ID" SortExpression="ID_ACTIVIDAD" />
            <asp:BoundField DataField="DESC_ACTIVIDAD" HeaderText="Descripcion" SortExpression="DESC_ACTIVIDAD" />
            <asp:BoundField DataField="FECHA_REALIZACION_ACT" HeaderText="Fecha a Realizar" SortExpression="FECHA_REALIZACION_ACT" DataFormatString='{0:MM-dd-yyyy}' />
            <asp:BoundField DataField="MONTO_RECAUDADO" HeaderText="Monto Recaudado" SortExpression="MONTO_RECAUDADO" DataFormatString='${0:#,0}' />
            <asp:BoundField DataField="DESC_TIPO_ACT" HeaderText="Tipo de Actividad" SortExpression="DESC_TIPO_ACT" />
            <asp:BoundField DataField="ID_CONTRATO" HeaderText="Contrato Relacionado" SortExpression="ID_CONTRATO" />
            <asp:BoundField DataField="ACTIVO" HeaderText="ACTIVO" SortExpression="ACTIVO" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceActividades" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT ONTOUR.ACTIVIDAD.ID_ACTIVIDAD, ONTOUR.ACTIVIDAD.DESC_ACTIVIDAD, ONTOUR.ACTIVIDAD.FECHA_REALIZACION_ACT, ONTOUR.ACTIVIDAD.MONTO_RECAUDADO, ONTOUR.TIPO_ACTIVIDAD.DESC_TIPO_ACT, ONTOUR.ACTIVIDAD.ID_CONTRATO, ONTOUR.ACTIVIDAD.ACTIVO FROM ONTOUR.ACTIVIDAD INNER JOIN ONTOUR.TIPO_ACTIVIDAD ON ONTOUR.ACTIVIDAD.ID_TIPO_ACTIVIDAD = ONTOUR.TIPO_ACTIVIDAD.ID_TIPO_ACTIIVIDAD"></asp:SqlDataSource>
</asp:Content>

