<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="~/Controller/ListarCliente.aspx.cs" Inherits="ListarCliente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<div class="container">
    <div class="row">
        <div class="col-xs-12">
            <h2>Clientes</h2>
            <br />
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12">
            <asp:GridView ID="GridViewListarCLiente" runat="server" CssClass="table table-bordered" EmptyDataText="No hay clientes asociados" AutoGenerateColumns="False" DataSourceID="SqlDataSourceListarCliente">
                <Columns>
                   <asp:BoundField DataField="ID_CONTRATO" HeaderText="ID Contrato" SortExpression="ID_CONTRATO" />
                    <asp:TemplateField HeaderText="Rut Cliente" SortExpression="Rut">
                    <ItemTemplate>
                        <asp:Label ID="Rut" runat="server" Text='<%#Eval("NUMRUT_CLI")+ "-" + Eval("DRUT_CLI")%>' ></asp:Label>
                    </ItemTemplate>
                    </asp:TemplateField> 
                    <asp:TemplateField HeaderText="Nombre Cliente" SortExpression="Nombre">
                        <ItemTemplate>
                            <asp:Label ID="Nombre" runat="server" Text='<%#Eval("NOMBRE_CLIE")+ " " + Eval("APELLIDO_PAT_CLI")+" "+ Eval("APELLIDO_MAT_CLI")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="MAIL_CLI" HeaderText="Mail" SortExpression="MAIL_CLI" />
                     <asp:TemplateField HeaderText="Activo" SortExpression="Activo">
                        <ItemTemplate>
                            <asp:Label Visible='<%# Eval("Activo").ToString().Equals("T") %>' Text="<div class='progreso btn-success'>Habilitado</div>" runat="server" />
                            <asp:Label Visible='<%# Eval("Activo").ToString().Equals("F") %>' Text="<div class='progreso btn-danger'>No Habilitado</div>" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="DIRECCION_CLI" HeaderText="Dirección" SortExpression="DIRECCION_CLI" />
                    <asp:BoundField DataField="FECHA_NACIMIENTO_CLI" HeaderText="Fecha de Nacimiento" SortExpression="FECHA_NACIMIENTO_CLI" DataFormatString='{0:MM-dd-yyyy}' />
                    <asp:BoundField DataField="FONO_CLI" HeaderText="Teléfono" SortExpression="FONO_CLI" />
                    <asp:HyperLinkField HeaderText="Editar" ControlStyle-CssClass="btn btn-success progreso btn-editar" DataNavigateUrlFields="NUMRUT_CLI" DataNavigateUrlFormatString="ModificarCliente.aspx?NUMRUT_CLI={0}" Text="<i class='glyphicon glyphicon-pencil'></i> <span>Editar</span>" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceListarCliente" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT ONTOUR.CLIENTE.NUMRUT_CLI , ONTOUR.CLIENTE.DRUT_CLI, ONTOUR.CONTRATO.ID_CONTRATO, ONTOUR.CLIENTE.NOMBRE_CLIE, ONTOUR.CLIENTE.APELLIDO_PAT_CLI, ONTOUR.CLIENTE.APELLIDO_MAT_CLI, ONTOUR.CLIENTE.MAIL_CLI, ONTOUR.CLIENTE.ACTIVO, ONTOUR.CLIENTE.DIRECCION_CLI, ONTOUR.CLIENTE.FECHA_NACIMIENTO_CLI, ONTOUR.CLIENTE.FONO_CLI FROM ONTOUR.CLIENTE INNER JOIN ONTOUR.CONTRATO ON ONTOUR.CLIENTE.NUMRUT_CLI = ONTOUR.CONTRATO.NUMRUT_CLI_TITULAR"></asp:SqlDataSource>
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

