<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="~/Controller/ListarContratos.aspx.cs" Inherits="ListarContratos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br>
    <br>
    <asp:Button ID="btnNuevoContrato" runat="server" Text="Nuevo Contrato" OnClick="btnNuevoContrato_Click" />
    <br/>
    (LISTAR SOLOS LOS CONTRATOS DEL USUARIO ACTUAL DE LA PAGINA!)<br/>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:TemplateField HeaderText="#"><ItemTemplate><%# Container.DataItemIndex + 1 %></ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="NOMBRE MANDANTE"><ItemTemplate><%# DataBinder.Eval(Container.DataItem, "NOMBRE")%> <%# DataBinder.Eval(Container.DataItem, "APELLIDO")%> </ItemTemplate></asp:TemplateField>
            <asp:BoundField DataField="TERMINO" HeaderText="Fecha Termino" SortExpression="TERMINO" DataFormatString='{0:MM-dd-yyyy}'/>
            <asp:BoundField DataField="ESTADO" HeaderText="ESTADO" SortExpression="ESTADO" />
            <asp:BoundField HeaderText="PROGRESO"/>
            <asp:BoundField DataField="META" HeaderText="Meta" SortExpression="META" DataFormatString='${0:#,0}'/>
            <asp:BoundField DataField="RESERVA" HeaderText="Monto Reserva" SortExpression="RESERVA" DataFormatString='${0:#,0}'/>
            <asp:BoundField DataField="ID_CONTRATO" HeaderText="ID_CONTRATO" SortExpression="ID_CONTRATO" Visible="False" />
            <asp:HyperLinkField DataNavigateUrlFields="ID_CONTRATO" DataNavigateUrlFormatString="~/View/ModificarContrato.aspx?ID_CONTRATO={0}" HeaderText="Opciones" Text="Editar"/>
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT ONTOUR.CLIENTE.NOMBRE_CLIE AS Nombre, ONTOUR.CLIENTE.APELLIDO_PAT_CLI AS Apellido, ONTOUR.CONTRATO.FECHA_TERMINO AS Termino, ONTOUR.CONTRATO.ESTADO AS Estado, ONTOUR.CONTRATO.MONTO_RESERVA AS Reserva, ONTOUR.CONTRATO.META AS Meta, ONTOUR.CONTRATO.ID_CONTRATO FROM ONTOUR.CONTRATO INNER JOIN ONTOUR.CLIENTE ON ONTOUR.CONTRATO.NUMRUT_CLI_TITULAR = ONTOUR.CLIENTE.NUMRUT_CLI INNER JOIN ONTOUR.EMPLEADO ON ONTOUR.CONTRATO.NUMRUT_EMP = ONTOUR.EMPLEADO.NUMRUT_EMP"></asp:SqlDataSource>
</asp:Content>

