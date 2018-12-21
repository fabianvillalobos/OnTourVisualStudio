<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="~/Controller/ListarUsuariosSistema.aspx.cs" Inherits="ListarUsuariosSistema" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<div class="container">
    <div class="row">
        <div class="col-xs-12">
            <h2>Usuarios del sistema</h2>
            <br />
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12">
            <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered" AutoGenerateColumns="False" DataSourceID="SqlDataSourceUsuariosSistema">
            <Columns>
             <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" />
             <asp:BoundField DataField="USUARIO" HeaderText="USUARIO" SortExpression="USUARIO" />
             <asp:BoundField DataField="DESCRIPCIÓN" HeaderText="DESCRIPCIÓN" SortExpression="DESCRIPCIÓN" />
             <asp:TemplateField HeaderText="Estado" SortExpression="Activo">
                 <ItemTemplate>
                     <asp:Label Visible='<%# Eval("Activo").ToString().Equals("T") %>' Text="<div class='progreso btn-success'>Habilitado</div>" runat="server" />
                     <asp:Label Visible='<%# Eval("Activo").ToString().Equals("F") %>' Text="<div class='progreso btn-danger'>No Habilitado</div>" runat="server" />
                 </ItemTemplate>
             </asp:TemplateField>
          </Columns>
          </asp:GridView>
          <asp:SqlDataSource ID="SqlDataSourceUsuariosSistema" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT ONTOUR.USUARIO.ID_USR AS Id, ONTOUR.USUARIO.LOGIN_USR AS Usuario, ONTOUR.USUARIO.PASS_USR AS Contraseña, ONTOUR.TIPO_USUARIO.DESC_TIPO_USUARIO AS Descripción, ONTOUR.USUARIO.ACTIVO FROM ONTOUR.USUARIO INNER JOIN ONTOUR.TIPO_USUARIO ON ONTOUR.USUARIO.ID_TIPO_USUARIO = ONTOUR.TIPO_USUARIO.ID_TIPO_USUARIO ORDER BY ID_USR"></asp:SqlDataSource>
            <br />
        </div>  
    </div>
</div>
<div class="modal fade" id="modalMensaje" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="display: none;">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <asp:Label ID="lblModalTitulo" Text="" runat="server" CssClass="modal-title"></asp:Label>
            </div>
            <div class="modal-body">
                <asp:Label ID="lblModalMensaje" Text="" runat="server" />
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>
</div>
</asp:Content>

