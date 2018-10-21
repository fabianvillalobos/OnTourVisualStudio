<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="~/Controller/ListarCliente.aspx.cs" Inherits="ListarCliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="row">
            <h2>Clientes</h2>
            <br />
            <asp:GridView ID="GridViewListarCLiente" runat="server" CssClass="table table-bordered" AutoGenerateColumns="False" DataSourceID="SqlDataSourceListarCliente" Height="104px" Width="1303px" DataKeyNames="NUMRUT_CLI">
                <Columns>
                    <asp:BoundField DataField="NUMRUT_CLI" HeaderText="NUMRUT_CLI" SortExpression="NUMRUT_CLI" ReadOnly="True" />
                    <asp:BoundField DataField="DRUT_CLI" HeaderText="DRUT_CLI" SortExpression="DRUT_CLI" />
                    <asp:BoundField DataField="NOMBRE_CLIE" HeaderText="NOMBRE_CLIE" SortExpression="NOMBRE_CLIE" />
                    <asp:BoundField DataField="APELLIDO_PAT_CLI" HeaderText="APELLIDO_PAT_CLI" SortExpression="APELLIDO_PAT_CLI" />
                    <asp:BoundField DataField="APELLIDO_MAT_CLI" HeaderText="APELLIDO_MAT_CLI" SortExpression="APELLIDO_MAT_CLI" />
                    <asp:BoundField DataField="MAIL_CLI" HeaderText="MAIL_CLI" SortExpression="MAIL_CLI" />
                    <asp:BoundField DataField="ACTIVO" HeaderText="ACTIVO" SortExpression="ACTIVO" />
                    <asp:BoundField DataField="DIRECCION_CLI" HeaderText="DIRECCION_CLI" SortExpression="DIRECCION_CLI" />
                    <asp:BoundField DataField="FECHA_NACIMIENTO_CLI" HeaderText="FECHA_NACIMIENTO_CLI" SortExpression="FECHA_NACIMIENTO_CLI" />
                    <asp:BoundField DataField="FONO_CLI" HeaderText="FONO_CLI" SortExpression="FONO_CLI" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceListarCliente" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT NUMRUT_CLI, DRUT_CLI, NOMBRE_CLIE, APELLIDO_PAT_CLI, APELLIDO_MAT_CLI, MAIL_CLI, ACTIVO, DIRECCION_CLI, FECHA_NACIMIENTO_CLI, FONO_CLI FROM ONTOUR.CLIENTE"></asp:SqlDataSource>
        </div>
    </div>
</asp:Content>

