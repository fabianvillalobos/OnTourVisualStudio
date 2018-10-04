<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="~/Controller/ListarCliente.aspx.cs" Inherits="ListarCliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridViewListarCLiente" runat="server" AutoGenerateColumns="False" DataKeyNames="NUMRUT_CLI" DataSourceID="SqlDataSourceListarCliente">
        <Columns>
            <asp:BoundField DataField="NUMRUT_CLI" HeaderText="Rut" ReadOnly="True" SortExpression="NUMRUT_CLI" />
            <asp:BoundField DataField="DRUT_CLI" HeaderText="DV" SortExpression="DRUT_CLI" />
            <asp:BoundField DataField="NOMBRE_CLIE" HeaderText="Nombre" SortExpression="NOMBRE_CLIE" />
            <asp:BoundField DataField="APELLIDO_PAT_CLI" HeaderText="Apellido Paterno" SortExpression="APELLIDO_PAT_CLI" />
            <asp:BoundField DataField="APELLIDO_MAT_CLI" HeaderText="Apellido Materno" SortExpression="APELLIDO_MAT_CLI" />
            <asp:BoundField DataField="MAIL_CLI" HeaderText="Mail" SortExpression="MAIL_CLI" />
            <asp:BoundField DataField="ACTIVO" HeaderText="ACTIVO" SortExpression="ACTIVO" />
            <asp:BoundField DataField="ID_USR" HeaderText="Tipo de Usuario" SortExpression="ID_USR" />
            <asp:BoundField DataField="DIRECCION_CLI" HeaderText="Direccion" SortExpression="DIRECCION_CLI" />
            <asp:BoundField DataField="FECHA_NACIMIENTO_CLI" HeaderText="Fecha de nacimiento" SortExpression="FECHA_NACIMIENTO_CLI" />
            <asp:BoundField DataField="FONO_CLI" HeaderText="Telefono" SortExpression="FONO_CLI" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceListarCliente" runat="server" ConnectionString="DATA SOURCE=ontour;PASSWORD=ontour;USER ID=ONTOUR" ProviderName="Oracle.ManagedDataAccess.Client" SelectCommand="SELECT * FROM &quot;CLIENTE&quot;"></asp:SqlDataSource>
</asp:Content>

