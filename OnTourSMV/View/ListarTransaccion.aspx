<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="~/Controller/ListarTransaccion.aspx.cs" Inherits="ListarTransaccion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:BoundField DataField="ID_TRANSACCION" HeaderText="ID" SortExpression="ID_TRANSACCION" />
            <asp:BoundField DataField="FECHA_TRANSACCION" HeaderText="Fecha de Transaccion" SortExpression="FECHA_TRANSACCION" DataFormatString='{0:MM-dd-yyyy}'/>
            <asp:BoundField DataField="MONTO_TRANSACCION" HeaderText="Monto" SortExpression="MONTO_TRANSACCION" />
            <asp:BoundField DataField="ID_CUENTA" HeaderText="Id Cuenta" SortExpression="ID_CUENTA" />
            <asp:BoundField DataField="ACTIVO" HeaderText="ACTIVO" SortExpression="ACTIVO" />
            <asp:BoundField DataField="DESC_TRANSACCION" HeaderText="Tipo de Transaccion" SortExpression="DESC_TRANSACCION" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT ONTOUR.TRANSACCION.ID_TRANSACCION, ONTOUR.TRANSACCION.FECHA_TRANSACCION, ONTOUR.TRANSACCION.MONTO_TRANSACCION, ONTOUR.TRANSACCION.ID_CUENTA, ONTOUR.TRANSACCION.ACTIVO, ONTOUR.TIPO_TRANSACCION.DESC_TRANSACCION FROM ONTOUR.TRANSACCION INNER JOIN ONTOUR.TIPO_TRANSACCION ON ONTOUR.TRANSACCION.ID_TIPO_TRANSACCION = ONTOUR.TIPO_TRANSACCION.ID_TIPO_TRANSACCION"></asp:SqlDataSource>
</asp:Content>

