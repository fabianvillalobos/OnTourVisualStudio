<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="~/Controller/ListarTransaccion.aspx.cs" Inherits="ListarTransaccion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID_TRANSACCION" DataSourceID="SqlDataSourceTransaccion">
        <Columns>
            <asp:BoundField DataField="ID_TRANSACCION" HeaderText="ID" ReadOnly="True" SortExpression="ID_TRANSACCION" />
            <asp:BoundField DataField="FECHA_TRANSACCION" HeaderText="Fecha" SortExpression="FECHA_TRANSACCION" />
            <asp:BoundField DataField="MONTO_TRANSACCION" HeaderText="Monto" SortExpression="MONTO_TRANSACCION" />
            <asp:BoundField DataField="ID_CUENTA" HeaderText="Cuenta Relacionada" SortExpression="ID_CUENTA" />
            <asp:BoundField DataField="ID_TIPO_TRANSACCION" HeaderText="Tipo de Transaccion" SortExpression="ID_TIPO_TRANSACCION" />
            <asp:BoundField DataField="ACTIVO" HeaderText="ACTIVO" SortExpression="ACTIVO" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceTransaccion" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;TRANSACCION&quot;"></asp:SqlDataSource>
</asp:Content>

