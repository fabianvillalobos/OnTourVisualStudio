<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="~/Controller/ListarUsuariosSistema.aspx.cs" Inherits="ListarUsuariosSistema" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="row">
            <h2>Usuarios del sistema</h2>
            <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered" AutoGenerateColumns="False" DataSourceID="SqlDataSourceUsuariosSistema">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" />
                    <asp:BoundField DataField="USUARIO" HeaderText="USUARIO" SortExpression="USUARIO" />
                    <asp:BoundField DataField="CONTRASEÑA" HeaderText="CONTRASEÑA" SortExpression="CONTRASEÑA" />
                    <asp:BoundField DataField="DESCRIPCIÓN" HeaderText="DESCRIPCIÓN" SortExpression="DESCRIPCIÓN" />
                    <asp:BoundField DataField="ACTIVO" HeaderText="ACTIVO" SortExpression="ACTIVO" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceUsuariosSistema" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT ONTOUR.USUARIO.ID_USR AS Id, ONTOUR.USUARIO.LOGIN_USR AS Usuario, ONTOUR.USUARIO.PASS_USR AS Contraseña, ONTOUR.TIPO_USUARIO.DESC_TIPO_USUARIO AS Descripción, ONTOUR.USUARIO.ACTIVO FROM ONTOUR.USUARIO INNER JOIN ONTOUR.TIPO_USUARIO ON ONTOUR.USUARIO.ID_TIPO_USUARIO = ONTOUR.TIPO_USUARIO.ID_TIPO_USUARIO"></asp:SqlDataSource>
            <br />
            
        </div>
    </div>
</asp:Content>

