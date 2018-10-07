<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="~/Controller/ListarCuenta.aspx.cs" Inherits="ListarCuenta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID_CUENTA" DataSourceID="SqlDataSourceCuenta">
        <Columns>
            <asp:BoundField DataField="ID_CUENTA" HeaderText="ID" ReadOnly="True" SortExpression="ID_CUENTA" />
            <asp:BoundField DataField="SALDO" HeaderText="Saldo de la Cuenta" SortExpression="SALDO" />
            <asp:BoundField DataField="ID_CONTRATO" HeaderText="Contrato Relacionado" SortExpression="ID_CONTRATO" />
            <asp:BoundField DataField="NUMRUT_CLI" HeaderText="Rut del Cliente" SortExpression="NUMRUT_CLI" />
            <asp:BoundField DataField="ACTIVO" HeaderText="ACTIVO" SortExpression="ACTIVO" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceCuenta" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;CUENTA&quot;"></asp:SqlDataSource>
</asp:Content>

