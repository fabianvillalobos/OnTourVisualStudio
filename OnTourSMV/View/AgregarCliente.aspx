<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="~/Controller/AgregarCliente.aspx.cs" Inherits="AgregarCliente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<div class="container">
    <div class="row">
        <div class="col-xs-12">
            <h3>Agregar pasajero al contrato nº: <%= Request.QueryString["ID_CONTRATO"] %></h3>
            <p>Busca un pasajero con el rut para luego asignarlo a un contrato<p>
            <br />
        </div>
    </div>
    <div class="row">
        <asp:Panel ID="agregarClienteFormulario" runat="server" Visible="true">
            <div class="col-xs-12">
            <div class="row">
                <div class="col-xs-12">
                    <asp:Label ID="Label2" runat="server" Text="Buscar cliente por rut:"></asp:Label>
                </div>
                <div class="col-xs-3">
                    <asp:TextBox ID="txtBuscarRut" runat="server" CssClass="form-control" ValidationGroup="groupCargar" MaxLength="8"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtBuscarRut" Display="Dynamic" ErrorMessage="Campo Rut Requerido " ForeColor="#FF3300" ValidationGroup="groupCargar"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtBuscarRut" ErrorMessage="Rut No Valido" ForeColor="#FF3300" ValidationExpression="^[0-9]*$" Display="Dynamic" ValidationGroup="groupCargar"></asp:RegularExpressionValidator>
                </div>
                <div class="col-xs-1">
                   <asp:TextBox ID="txtDvBuscar" runat="server" MaxLength="1" CssClass="form-control" Width="50px" ValidationGroup="groupCargar"></asp:TextBox><!-- Validación DV Solo números del 0-9 y Letra K -->
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDvBuscar" Display="Dynamic" ErrorMessage="Campo DV Requerido" ForeColor="#FF3300" ValidationGroup="groupCargar"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtDvBuscar" ErrorMessage="Digito No Valido" ForeColor="#FF3300" ValidationExpression="^[0-9_kK]*$" Display="Dynamic" ValidationGroup="groupCargar"></asp:RegularExpressionValidator>
                </div>
                <div class="col-xs-4">
                    <asp:Button ID="btnCargarCliente" runat="server" CssClass="btn btn-primary" Text="Cargar" OnClick="btnCargarCliente_Click" ValidationGroup="groupCargar" />
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12">
                    <div class="separador"></div>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-4">
                    <asp:Label ID="LabelNomCliente" runat="server" Text="Nombre:"></asp:Label>
                    <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" Enabled="False"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorNombre" runat="server" ControlToValidate="txtNombre" ErrorMessage="Campo Requerido" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                </div>
                <div class="col-xs-4">
                    <asp:Label ID="LabelApPaterno" runat="server" Text="Apellido Paterno:"></asp:Label>
                    <asp:TextBox ID="txtApellidoP" runat="server" CssClass="form-control" Enabled="False"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorApellidoP" runat="server" ControlToValidate="txtApellidoP" ErrorMessage="Campo Requerido" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                </div>
                <div class="col-xs-4">
                    <asp:Label ID="LabelApMaterno" runat="server" Text="Apellido Materno:"></asp:Label>
                    <asp:TextBox ID="txtApellidoM" runat="server" CssClass="form-control" Enabled="False"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorApellidoM" runat="server" ControlToValidate="txtApellidoM" ErrorMessage="Campo Requerido" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-3">
                    <asp:Label ID="LabelRut" runat="server" Text="Rut:"></asp:Label>
                    <asp:TextBox ID="txtRut" runat="server" MaxLength="8" CssClass="form-control" Enabled="False"></asp:TextBox>
                     <!-- Validación rut Solo números del 0-9 -->
                     <asp:RequiredFieldValidator ID="RequiredFieldValidatorRut" runat="server" ControlToValidate="txtRut" Display="Dynamic" ErrorMessage="Campo Rut Requerido " ForeColor="#FF3300" ValidationGroup="mandanteGroup"></asp:RequiredFieldValidator>
                     <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtRut" ErrorMessage="Rut No Valido" ForeColor="#FF3300" ValidationExpression="^[0-9]*$" Display="Dynamic" ValidationGroup="mandanteGroup"></asp:RegularExpressionValidator>
                </div>
                <div class="col-xs-1 padding-top-20">
                    <asp:TextBox ID="txtDv" runat="server" MaxLength="1" CssClass="form-control" Width="50px" Enabled="False"></asp:TextBox>
                     <!-- Validación DV Solo números del 0-9 y Letra K -->
                     <asp:RequiredFieldValidator ID="RequiredFieldValidatorDv" runat="server" ControlToValidate="txtDv" Display="Dynamic" ErrorMessage="Campo DV Requerido" ForeColor="#FF3300" ValidationGroup="mandanteGroup"></asp:RequiredFieldValidator>
                     <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtDv" ErrorMessage="Digito No Valido" ForeColor="#FF3300" ValidationExpression="^[0-9_kK]*$" Display="Dynamic" ValidationGroup="mandanteGroup"></asp:RegularExpressionValidator>
                </div>
                
                <div class="col-xs-4">
                    <asp:Label ID="LabelMail" runat="server" Text="Mail:"></asp:Label>
                    <asp:TextBox ID="txtMail" runat="server" TextMode="Email" CssClass="form-control" Enabled="False"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorMail" runat="server" ControlToValidate="txtMail" ErrorMessage="Campo Requerido" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                </div>
                <div class="col-xs-4">
                    <asp:Label ID="LabelDireccion" runat="server" Text="Direccion:"></asp:Label>
                    <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-control" Enabled="False"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorDireccion" runat="server" ControlToValidate="txtDireccion" ErrorMessage="Campo Requerido" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-4">
                    <asp:Label ID="LabelFecNacimiento" runat="server" Text="Fecha de Nacimiento:"></asp:Label>
                    <asp:TextBox ID="txtFecha" runat="server" TextMode="Date" CssClass="form-control" Enabled="False"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorFecha" runat="server" ControlToValidate="txtFecha" ErrorMessage="Campo Requerido" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblFechaStr" runat="server" Text="Fecha de Nacimiento:" Visible="False"></asp:Label>
                    <asp:TextBox ID="txtFechaStr" runat="server" TextMode="SingleLine" CssClass="form-control" Enabled="False" Visible="False"></asp:TextBox>
                </div>
                <div class="col-xs-4">
                    <asp:Label ID="LabelTelefono" runat="server" Text="Teléfono:"></asp:Label>
                    <asp:TextBox ID="txtTelefono" runat="server" MaxLength="9" CssClass="form-control" Enabled="False"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtTelefono" ErrorMessage="Ingresar solo números" ForeColor="#FF3300" ValidationExpression="^[0-9]*$" Display="Dynamic"></asp:RegularExpressionValidator>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12">
                    <div class="separador"></div>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12">
                    <a id="backContrato_link" runat="server" class="btn btn-default"><i class='glyphicon glyphicon-chevron-left'></i> Volver al contrato</a>
                    <asp:Button ID="btnAgregar" runat="server" CssClass="btn btn-primary" Text="Agregar" OnClick="btnAgregar_Click" />
                    <asp:Label ID="lblAviso" runat="server" Text=""></asp:Label>
                </div>
            </div>
        </div>
        </asp:Panel>
        <asp:Panel ID="idNoValido" runat="server" Visible="false">
            <div class="col-xs-6">
                <div class="alert alert-danger">El número de contrato no existe. <a href="ListarContratos.aspx" style="float:right;margin-top:-5px;" class="btn btn-danger btn-sm"><i class='glyphicon glyphicon-chevron-left'></i> Ver listado de contratos</a></div>
            </div>
        </asp:Panel>
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