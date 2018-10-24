<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="~/Controller/ListarUsuariosSistema.aspx.cs" Inherits="ListarUsuariosSistema" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="row">
            <h2>Usuarios del sistema</h2>
            <br />
            <asp:GridView ID="GridViewLIstarUsuariosSistema" runat="server" EmptyDataText="No Hay Usuarios" CssClass="table table-bordered" AutoGenerateColumns="False" DataKeyNames="ID_USR" DataSourceID="SqlDataSourceUsuariosSistema">
                <Columns>
                    <asp:BoundField DataField="ID_USR" HeaderText="ID_USR" ReadOnly="True" SortExpression="ID_USR" />
                    <asp:BoundField DataField="LOGIN_USR" HeaderText="LOGIN_USR" SortExpression="LOGIN_USR" />
                    <asp:BoundField DataField="PASS_USR" HeaderText="PASS_USR" SortExpression="PASS_USR" />
                    <asp:BoundField DataField="ID_TIPO_USUARIO" HeaderText="ID_TIPO_USUARIO" SortExpression="ID_TIPO_USUARIO" />
                    <asp:BoundField DataField="ACTIVO" HeaderText="ACTIVO" SortExpression="ACTIVO" />
                </Columns>
            </asp:GridView>
            
            <asp:SqlDataSource ID="SqlDataSourceUsuariosSistema" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;USUARIO&quot;"></asp:SqlDataSource>
            
        </div>
    </div>
</asp:Content>

