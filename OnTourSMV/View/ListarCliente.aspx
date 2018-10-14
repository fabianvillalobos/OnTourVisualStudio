<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="~/Controller/ListarCliente.aspx.cs" Inherits="ListarCliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridViewListarCLiente" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceListarCliente" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:BoundField DataField="NUMRUT_CLI" HeaderText="NUMRUT_CLI" SortExpression="NUMRUT_CLI" />
            <asp:BoundField DataField="DRUT_CLI" HeaderText="DRUT_CLI" SortExpression="DRUT_CLI" />
            <asp:BoundField DataField="NOMBRE_CLIE" HeaderText="NOMBRE_CLIE" SortExpression="NOMBRE_CLIE" />
            <asp:BoundField DataField="APELLIDO_PAT_CLI" HeaderText="APELLIDO_PAT_CLI" SortExpression="APELLIDO_PAT_CLI" />
            <asp:BoundField DataField="APELLIDO_MAT_CLI" HeaderText="APELLIDO_MAT_CLI" SortExpression="APELLIDO_MAT_CLI" />
            <asp:BoundField DataField="MAIL_CLI" HeaderText="MAIL_CLI" SortExpression="MAIL_CLI" />
            <asp:BoundField DataField="ACTIVO" HeaderText="ACTIVO" SortExpression="ACTIVO" />
            <asp:BoundField DataField="DESC_TIPO_USUARIO" HeaderText="DESC_TIPO_USUARIO" SortExpression="DESC_TIPO_USUARIO" />
            <asp:BoundField DataField="DIRECCION_CLI" HeaderText="DIRECCION_CLI" SortExpression="DIRECCION_CLI" />
            <asp:BoundField DataField="FECHA_NACIMIENTO_CLI" HeaderText="FECHA_NACIMIENTO_CLI" SortExpression="FECHA_NACIMIENTO_CLI"/>
            <asp:BoundField DataField="FONO_CLI" HeaderText="FONO_CLI" SortExpression="FONO_CLI" />
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
    <asp:SqlDataSource ID="SqlDataSourceListarCliente" runat="server" ConnectionString="DATA SOURCE=ontour;PASSWORD=ontour;USER ID=ONTOUR" ProviderName="Oracle.ManagedDataAccess.Client" SelectCommand="SELECT ONTOUR.CLIENTE.NUMRUT_CLI, ONTOUR.CLIENTE.DRUT_CLI, ONTOUR.CLIENTE.NOMBRE_CLIE, ONTOUR.CLIENTE.APELLIDO_PAT_CLI, ONTOUR.CLIENTE.APELLIDO_MAT_CLI, ONTOUR.CLIENTE.MAIL_CLI, ONTOUR.CLIENTE.ACTIVO, ONTOUR.TIPO_USUARIO.DESC_TIPO_USUARIO, ONTOUR.CLIENTE.DIRECCION_CLI, ONTOUR.CLIENTE.FECHA_NACIMIENTO_CLI, ONTOUR.CLIENTE.FONO_CLI FROM ONTOUR.CLIENTE INNER JOIN ONTOUR.TIPO_USUARIO ON ONTOUR.CLIENTE.ID_USR = ONTOUR.TIPO_USUARIO.ID_TIPO_USUARIO"></asp:SqlDataSource>
</asp:Content>

