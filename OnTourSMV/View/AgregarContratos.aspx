<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="~/Controller/AgregarContratos.aspx.cs" Inherits="AgregarContratos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<div class="container">
    <div class="row">
        <div class="col-xs-12">
            <h2>Nuevo Contrato</h2>
            <br />
        </div>
    </div>
    <div class="row">
        <div class="col-xs-3">
            <asp:Label ID="LabelFecInicio" runat="server" Text="Fecha Inicio:"></asp:Label>
            <asp:TextBox ID="txtInicio" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtInicio" ErrorMessage="Requerido" ForeColor="Red" ValidationGroup="contratoGroup"></asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtInicio" ErrorMessage="Requerido" ForeColor="Red" ValidationGroup="mandanteGroup"></asp:RequiredFieldValidator>
        </div>
        <div class="col-xs-3">
            <asp:Label ID="LabelFecTermino" runat="server" Text="Fecha Termino:"></asp:Label>
            <asp:TextBox ID="txtFin" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtFin" ErrorMessage="Requerido" ForeColor="Red" ValidationGroup="contratoGroup"></asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtFin" ErrorMessage="Requerido" ForeColor="Red" ValidationGroup="mandanteGroup"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtInicio" ControlToValidate="txtFin" ErrorMessage="Rango No Valido" ForeColor="#FF3300" Operator="GreaterThan" ValidationGroup="contratoGroup"></asp:CompareValidator>
        </div>
        <div class="col-xs-3">
            <asp:Label ID="LabelMeta" runat="server" Text="Meta:"></asp:Label>
            <asp:TextBox ID="txtMeta" runat="server" CssClass="form-control" TextMode="Number" MaxLength="9" Rows="1" ReadOnly="True">0</asp:TextBox>
        </div>
        <div class="col-xs-3">
            <asp:Label ID="LabelReserva" runat="server" Text="Reserva:"></asp:Label>
            <asp:TextBox ID="txtMonto" runat="server" CssClass="form-control" TextMode="Number" MaxLength="9" Rows="1" ReadOnly="True">0</asp:TextBox>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-6">
            <p>Selecciona un mandante ya existente o puedes crear uno nuevo completando el formulario de abajo.</p>
        </div>
        <div class="col-xs-3">
            <asp:Label ID="LabelTitular" runat="server" Text="Mandante:"></asp:Label>
            <asp:DropDownList ID="DropDownListMandante" runat="server" CssClass="form-control" DataSourceID="SqlDataSourceMandante" DataTextField="NOMBRE_CLIE" DataValueField="NUMRUT_CLI" AutoPostBack="True" OnSelectedIndexChanged="DropDownListMandante_SelectedIndexChanged">
                    <asp:ListItem>Sin seleccionar</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="col-xs-3">
            <asp:Button ID="ButtonCargarMandante" runat="server" CssClass="btn btn-primary" Text="Cargar mandante" OnClick="ButtonCargarMandante_Click" ValidationGroup="contratoGroup" />
            <asp:SqlDataSource ID="SqlDataSourceMandante" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT NUMRUT_CLI, NOMBRE_CLIE, APELLIDO_PAT_CLI, APELLIDO_MAT_CLI FROM ONTOUR.CLIENTE"></asp:SqlDataSource>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12">
            <h3>Registrar mandante</h3>
        </div>
    </div>
    <div class="row">
        
        <div class="col-xs-12">
            <div class="row">
                <div class="col-xs-12">
                    <p>Ingresa un nuevo mandante completando todos los campos:</p>
                </div>
                <div class="col-xs-3">
                    <asp:Label ID="LabelNomCliente" runat="server" Text="Nombre(s):"></asp:Label>
                    <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorNombre" runat="server" ControlToValidate="txtNombre" ErrorMessage="Campo Requerido" ForeColor="#FF3300" ValidationGroup="mandanteGroup"></asp:RequiredFieldValidator>
                </div>
                <div class="col-xs-3">
                    <asp:Label ID="LabelApPaterno" runat="server" Text="Apellido Paterno:"></asp:Label>
                    <asp:TextBox ID="txtApellidoP" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorApellidoP" runat="server" ControlToValidate="txtApellidoP" ErrorMessage="Campo Requerido" ForeColor="#FF3300" ValidationGroup="mandanteGroup"></asp:RequiredFieldValidator>
                </div>
                <div class="col-xs-3">
                    <asp:Label ID="LabelApMaterno" runat="server" Text="Apellido Materno:"></asp:Label>
                    <asp:TextBox ID="txtApellidoM" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorApellidoM" runat="server" ControlToValidate="txtApellidoM" ErrorMessage="Campo Requerido" ForeColor="#FF3300" ValidationGroup="mandanteGroup"></asp:RequiredFieldValidator>
                </div>
                <div class="col-xs-2">
                    <asp:Label ID="LabelRut" runat="server" Text="Rut:"></asp:Label>
                    <asp:TextBox ID="txtRut" runat="server" MaxLength="8" CssClass="form-control" ></asp:TextBox>
                    <!-- Validación rut Solo números del 0-9 -->
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorRut" runat="server" ControlToValidate="txtRut" Display="Dynamic" ErrorMessage="Campo Rut Requerido " ForeColor="#FF3300" ValidationGroup="mandanteGroup"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtRut" ErrorMessage="Rut No Valido" ForeColor="#FF3300" ValidationExpression="^[0-9]*$" Display="Dynamic" ValidationGroup="mandanteGroup"></asp:RegularExpressionValidator>
                    
                </div>
                <div class="col-xs-1">
                    <asp:Label ID="Label1" runat="server" Text="*"></asp:Label>
                    <asp:TextBox ID="txtDv" runat="server" MaxLength="1" CssClass="form-control" Width="50px"></asp:TextBox>                    
                    <!-- Validación DV Solo números del 0-9 y Letra K -->
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorDv" runat="server" ControlToValidate="txtDv" Display="Dynamic" ErrorMessage="Campo DV Requerido" ForeColor="#FF3300" ValidationGroup="mandanteGroup"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtDv" ErrorMessage="Digito No Valido" ForeColor="#FF3300" ValidationExpression="^[0-9_kK]*$" Display="Dynamic" ValidationGroup="mandanteGroup"></asp:RegularExpressionValidator>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-3">
                    <asp:Label ID="lblFechaStr" runat="server" Text="Fecha de Nacimiento:" Visible="False"></asp:Label>
                    <asp:TextBox ID="txtFechaStr" runat="server" TextMode="SingleLine" CssClass="form-control" Visible="False"></asp:TextBox>
                    <asp:Label ID="LabelFecNacimiento" runat="server" Text="Fecha de Nacimiento:"></asp:Label>
                    <asp:TextBox ID="txtFecha" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorFecha" runat="server" ControlToValidate="txtFecha" ErrorMessage="Campo Requerido" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtHoy" runat="server" TextMode="Date" Visible="False"></asp:TextBox>
                    <asp:CustomValidator ID="ValidadorFecNac" runat="server" ControlToValidate="txtFecha" ForeColor="#FF3300"></asp:CustomValidator>
                </div>
                <div class="col-xs-3">
                    <asp:Label ID="LabelMail" runat="server" Text="Mail:"></asp:Label>
                    <asp:TextBox ID="txtMail" runat="server" CssClass="form-control" TextMode="Email" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorMail" runat="server" ControlToValidate="txtMail" ErrorMessage="Campo Requerido" ForeColor="#FF3300" ValidationGroup="mandanteGroup"></asp:RequiredFieldValidator>
                </div>
                <div class="col-xs-3">
                    <asp:Label ID="LabelTelefono" runat="server" Text="Teléfono:"></asp:Label>
                    <asp:TextBox ID="txtTelefono" runat="server" MaxLength="9" CssClass="form-control" ForeColor="Black" style="left: 0px; top: 0px"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtTelefono" ErrorMessage="Ingresar solo números" ForeColor="#FF3300" ValidationExpression="^[0-9]*$" Display="Dynamic" ValidationGroup="mandanteGroup"></asp:RegularExpressionValidator>
                </div>
                <div class="col-xs-3">
                    <asp:Label ID="LabelDireccion" runat="server" Text="Direccion:"></asp:Label>
                    <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorDireccion" runat="server" ControlToValidate="txtDireccion" ErrorMessage="Campo Requerido" ForeColor="#FF3300" ValidationGroup="mandanteGroup"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-6">
                    <asp:Button ID="btnRegistrar" runat="server" CssClass="btn btn-primary" Text="Guardar Contrato" OnClick="btnRegistrar_Click" ValidationGroup="mandanteGroup"></asp:Button>
                </div>
                <div class="col-xs-6">
                    <asp:Label ID="LabelAviso" runat="server" Text=""></asp:Label>
                </div>
            </div>
        </div>
    </div>
</div>
</asp:Content>