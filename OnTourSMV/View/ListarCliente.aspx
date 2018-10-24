<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="~/Controller/ListarCliente.aspx.cs" Inherits="ListarCliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="row">
            <h2>Clientes</h2>
            <br />
            <asp:GridView ID="GridViewListarCLiente" runat="server" CssClass="table table-bordered" EmptyDataText="No Hay Clientes asociados" AutoGenerateColumns="False" DataSourceID="SqlDataSourceListarCliente" Height="104px" Width="1303px" DataKeyNames="NUMRUT_CLI">
                <Columns>
                    <asp:BoundField DataField="NUMRUT_CLI" HeaderText="Rut" SortExpression="NUMRUT_CLI" ReadOnly="True" />
                    <asp:BoundField DataField="DRUT_CLI" HeaderText="DV" SortExpression="DRUT_CLI" />
                    <asp:BoundField DataField="NOMBRE_CLIE" HeaderText="Nombre" SortExpression="NOMBRE_CLIE" />
                    <asp:BoundField DataField="APELLIDO_PAT_CLI" HeaderText="Apellido Paterno" SortExpression="APELLIDO_PAT_CLI" />
                    <asp:BoundField DataField="APELLIDO_MAT_CLI" HeaderText="Apellido Materno" SortExpression="APELLIDO_MAT_CLI" />
                    <asp:BoundField DataField="MAIL_CLI" HeaderText="Mail" SortExpression="MAIL_CLI" />
                    <asp:BoundField DataField="ACTIVO" HeaderText="ACTIVO" SortExpression="ACTIVO" />
                    <asp:BoundField DataField="DIRECCION_CLI" HeaderText="Direccion" SortExpression="DIRECCION_CLI" />
                    <asp:BoundField DataField="FECHA_NACIMIENTO_CLI" HeaderText="Fecha de nacimiento" SortExpression="FECHA_NACIMIENTO_CLI" />
                    <asp:BoundField DataField="FONO_CLI" HeaderText="Telefono" SortExpression="FONO_CLI" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceListarCliente" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT NUMRUT_CLI, DRUT_CLI, NOMBRE_CLIE, APELLIDO_PAT_CLI, APELLIDO_MAT_CLI, MAIL_CLI, ACTIVO, DIRECCION_CLI, FECHA_NACIMIENTO_CLI, FONO_CLI FROM ONTOUR.CLIENTE"></asp:SqlDataSource>
        </div>
    </div>
</asp:Content>

