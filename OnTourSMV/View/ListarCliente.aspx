<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="~/Controller/ListarCliente.aspx.cs" Inherits="ListarCliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="row">
            <h2>Usuarios</h2>
            <br />
            <asp:GridView ID="GridViewListarCLiente" runat="server" CssClass="table table-bordered" AutoGenerateColumns="False" DataSourceID="SqlDataSourceListarCliente" Height="104px" Width="1303px">
                <Columns>
                    <asp:TemplateField HeaderText="#">
                        <ItemTemplate><%# Container.DataItemIndex + 1 %></ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="NUMRUT_CLI" HeaderText="Rut" SortExpression="NUMRUT_CLI" />
                    <asp:BoundField DataField="DRUT_CLI" HeaderText="DV" SortExpression="DRUT_CLI" />
                    <asp:BoundField DataField="NOMBRE_CLIE" HeaderText="Nombre" SortExpression="NOMBRE_CLIE" />
                    <asp:BoundField DataField="APELLIDO_PAT_CLI" HeaderText="Apellido Paterno" SortExpression="APELLIDO_PAT_CLI" />
                    <asp:BoundField DataField="APELLIDO_MAT_CLI" HeaderText="Apellido Materno" SortExpression="APELLIDO_MAT_CLI" />
                    <asp:BoundField DataField="MAIL_CLI" HeaderText="Mail" SortExpression="MAIL_CLI" />
                    <asp:BoundField DataField="ACTIVO" HeaderText="ACTIVO" SortExpression="ACTIVO" />
                    <asp:BoundField DataField="DESC_TIPO_USUARIO" HeaderText="Tipo de Usuario" SortExpression="DESC_TIPO_USUARIO" />
                    <asp:BoundField DataField="DIRECCION_CLI" HeaderText="Direccion" SortExpression="DIRECCION_CLI" />
                    <asp:BoundField DataField="FECHA_NACIMIENTO_CLI" HeaderText="Fecha de Nacimiento" SortExpression="FECHA_NACIMIENTO_CLI" DataFormatString='{0:MM-dd-yyyy}' />
                    <asp:BoundField DataField="FONO_CLI" HeaderText="Telefono" SortExpression="FONO_CLI" />
                    <asp:HyperLinkField DataNavigateUrlFields="NUMRUT_CLI" DataNavigateUrlFormatString="~/View/ModificarCliente.aspx?NUMRUT_CLI={0}" HeaderText="Opciones" Text="Editar" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceListarCliente" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT ONTOUR.CLIENTE.NUMRUT_CLI, ONTOUR.CLIENTE.DRUT_CLI, ONTOUR.CLIENTE.NOMBRE_CLIE, ONTOUR.CLIENTE.APELLIDO_PAT_CLI, ONTOUR.CLIENTE.APELLIDO_MAT_CLI, ONTOUR.CLIENTE.MAIL_CLI, ONTOUR.CLIENTE.ACTIVO, ONTOUR.TIPO_USUARIO.DESC_TIPO_USUARIO, ONTOUR.CLIENTE.DIRECCION_CLI, ONTOUR.CLIENTE.FECHA_NACIMIENTO_CLI, ONTOUR.CLIENTE.FONO_CLI FROM ONTOUR.CLIENTE INNER JOIN ONTOUR.TIPO_USUARIO ON ONTOUR.CLIENTE.ID_USR = ONTOUR.TIPO_USUARIO.ID_TIPO_USUARIO"></asp:SqlDataSource>
        </div>
    </div>
</asp:Content>

