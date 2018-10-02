<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="~/Controller/ListarContratos.aspx.cs" Inherits="ListarContratos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br>
    <br>
    <asp:Button ID="btnNuevoContrato" runat="server" Text="Nuevo Contrato" />
    <br/>
    <br/>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="Contratos" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:BoundField DataField="FECHA_TERMINO" HeaderText="FECHA_TERMINO" SortExpression="FECHA_TERMINO" DataFormatString="{0:d}" />
            <asp:BoundField DataField="ESTADO" HeaderText="ESTADO" SortExpression="ESTADO" />
            <asp:BoundField DataField="NOMBRE_CLIE" HeaderText="NOMBRE_CLIE" SortExpression="NOMBRE_CLIE" />
            <asp:BoundField DataField="APELLIDO_PAT_CLI" HeaderText="APELLIDO_PAT_CLI" SortExpression="APELLIDO_PAT_CLI" />
            <asp:BoundField DataField="APELLIDO_MAT_CLI" HeaderText="APELLIDO_MAT_CLI" SortExpression="APELLIDO_MAT_CLI" />
            <asp:BoundField DataField="META" HeaderText="META" SortExpression="META" DataFormatString="{0:c}" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="Gray" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
</asp:GridView>
<asp:SqlDataSource ID="Contratos" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT ct.FECHA_TERMINO, ct.ESTADO, cli.NOMBRE_CLIE, cli.APELLIDO_PAT_CLI, cli.APELLIDO_MAT_CLI, ct.META FROM ONTOUR.CONTRATO ct INNER JOIN ONTOUR.CLIENTE cli ON ct.NUMRUT_CLI_TITULAR = cli.NUMRUT_CLI"></asp:SqlDataSource>
</asp:Content>

