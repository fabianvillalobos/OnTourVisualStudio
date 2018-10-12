<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="~/Controller/ListarCliente.aspx.cs" Inherits="ListarCliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridViewListarCLiente" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceListarCliente" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:BoundField DataField="NUMRUT_CLI" HeaderText="Rut" SortExpression="NUMRUT_CLI" />
            <asp:BoundField DataField="DRUT_CLI" HeaderText="DV" SortExpression="DRUT_CLI" />
            <asp:BoundField DataField="NOMBRE_CLIE" HeaderText="Nombre" SortExpression="NOMBRE_CLIE" />
            <asp:BoundField DataField="APELLIDO_PAT_CLI" HeaderText="Apellido Paterno" SortExpression="APELLIDO_PAT_CLI" />
            <asp:BoundField DataField="APELLIDO_MAT_CLI" HeaderText="Apellido Materno" SortExpression="APELLIDO_MAT_CLI" />
            <asp:BoundField DataField="MAIL_CLI" HeaderText="Mail" SortExpression="MAIL_CLI" />
            <asp:BoundField DataField="ACTIVO" HeaderText="ACTIVO" SortExpression="ACTIVO" />
            <asp:BoundField DataField="DESC_TIPO_USUARIO" HeaderText="Tipo de Usuario" SortExpression="DESC_TIPO_USUARIO" />
            <asp:BoundField DataField="DIRECCION_CLI" HeaderText="Direccion" SortExpression="DIRECCION_CLI" />
            <asp:BoundField DataField="FECHA_NACIMIENTO_CLI" HeaderText="Fecha de Nacimiento" SortExpression="FECHA_NACIMIENTO_CLI" DataFormatString='{0:MM-dd-yyyy}'/>
            <asp:BoundField DataField="FONO_CLI" HeaderText="Telefono" SortExpression="FONO_CLI" />
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
    <asp:SqlDataSource ID="SqlDataSourceListarCliente" runat="server" ConnectionString="DATA SOURCE=ontour;PASSWORD=ontour;USER ID=ONTOUR" ProviderName="Oracle.ManagedDataAccess.Client" SelectCommand="SELECT ONTOUR.CLIENTE.NUMRUT_CLI, ONTOUR.CLIENTE.DRUT_CLI, ONTOUR.CLIENTE.NOMBRE_CLIE, ONTOUR.CLIENTE.APELLIDO_PAT_CLI, ONTOUR.CLIENTE.APELLIDO_MAT_CLI, ONTOUR.CLIENTE.MAIL_CLI, ONTOUR.CLIENTE.ACTIVO, ONTOUR.TIPO_USUARIO.DESC_TIPO_USUARIO, ONTOUR.CLIENTE.DIRECCION_CLI, ONTOUR.CLIENTE.FECHA_NACIMIENTO_CLI, ONTOUR.CLIENTE.FONO_CLI FROM ONTOUR.CLIENTE, ONTOUR.TIPO_USUARIO"></asp:SqlDataSource>
</asp:Content>

