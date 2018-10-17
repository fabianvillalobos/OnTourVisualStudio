<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="~/Controller/AgregarContratos.aspx.cs" Inherits="AgregarContratos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 279px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>Nuevo Contrato</h1>
    <br />
    <br />
    <div>
        <center>
        <table style="width: 75%;">
            <tr>
                <td><asp:Label ID="LabelFecInicio" runat="server" Text="Fecha Inicio:"></asp:Label></td>
                <td><asp:TextBox ID="txtInicio" runat="server" TextMode="Date"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtInicio" ErrorMessage="Requerido" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td><asp:Label ID="LabelFecTermino" runat="server" Text="Fecha Termino:"></asp:Label></td>
                <td><asp:TextBox ID="txtFin" runat="server" TextMode="Date"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtFin" ErrorMessage="Requerido" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtInicio" ControlToValidate="txtFin" ErrorMessage="Rango No Valido" ForeColor="#FF3300" Operator="GreaterThan"></asp:CompareValidator>
                </td>
                <td class="auto-style1"><asp:Button ID="btnGuardar" runat="server" Text="Guardar" OnClick="btnGuardar_Click1" /></td>
            </tr>
            <tr>
                <td><asp:Label ID="LabelMeta" runat="server" Text="Meta:"></asp:Label></td>
                <td><asp:TextBox ID="txtMeta" runat="server" TextMode="Number" MaxLength="9" Rows="1" ReadOnly="True">0</asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtMeta" ErrorMessage="Requerido" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td><asp:Label ID="LabelMonto" runat="server" Text="Monto:"></asp:Label></td>
                <td><asp:TextBox ID="txtMonto" runat="server" TextMode="Number" MaxLength="9" Rows="1" ReadOnly="True">0</asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtMonto" ErrorMessage="Requerido" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <%--<td class="auto-style1"><asp:Label ID="LabelEstado" runat="server" Text="Estado:"></asp:Label></td>
                <td>
                    <asp:DropDownList ID="DropDownListEstado" runat="server">
                        <asp:ListItem Value="1">Vigente</asp:ListItem>
                        <asp:ListItem Value="2">No Vigente</asp:ListItem>
                        <asp:ListItem Value="3">Pendiente</asp:ListItem>
                    </asp:DropDownList>
                </td>--%>
            </tr>
            <tr>
                <td colspan="1"><asp:Label ID="LabelEmpleado" runat="server" Text="Empleado:"></asp:Label></td>
                <td colspan="2"><asp:DropDownList ID="DropDownListEmpleado" runat="server" DataSourceID="SqlDataSource1" DataTextField="NOMBRE_EMP" DataValueField="NUMRUT_EMP"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;NUMRUT_EMP&quot;, &quot;NOMBRE_EMP&quot; FROM &quot;EMPLEADO&quot;"></asp:SqlDataSource>
                </td>
                <td colspan="1"><asp:Label ID="LabelTitular" runat="server" Text="Titular:"></asp:Label></td>
                <td colspan="2"><asp:DropDownList ID="DropDownListTitular" runat="server" DataSourceID="SqlDataSource2" DataTextField="NOMBRE_CLIE" DataValueField="NUMRUT_CLI"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;NUMRUT_CLI&quot;, &quot;NOMBRE_CLIE&quot; FROM &quot;CLIENTE&quot;"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td colspan="6"><asp:Button ID="btnRegistrar" runat="server" Text="Registrar" OnClick="btnRegistrar_Click"></asp:Button></td>
            </tr>
            <tr>
                <td colspan="6"><asp:Label ID="LabelAviso" runat="server" Text=""></asp:Label></td>
            </tr>
        </table>
    </center>
    </div>
    <div>
        <h2>Mandante</h2>
    </div>
    <div>
        <table class="auto-style4">
            <tr>
                <td class="auto-style8">
                    <asp:Label ID="LabelRut" runat="server" Text="Rut:"></asp:Label></td>
                <td class="auto-style9">
                    <asp:TextBox ID="txtRut" runat="server" MaxLength="8"></asp:TextBox>
                    -<asp:TextBox ID="txtDv" runat="server" MaxLength="1"></asp:TextBox>
                    <!-- Validación rut Solo números del 0-9 -->
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorRut" runat="server" ControlToValidate="txtRut" Display="Dynamic" ErrorMessage="Campo Requerido" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtRut" ErrorMessage="Rut No Valido" ForeColor="#FF3300" ValidationExpression="^[0-9]*$" Display="Dynamic"></asp:RegularExpressionValidator>
                    <!-- Validación DV Solo números del 0-9 y Letra K -->
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorDv" runat="server" ControlToValidate="txtDv" Display="Dynamic" ErrorMessage="Campo Requerido" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtDv" ErrorMessage="Digito No Valido" ForeColor="#FF3300" ValidationExpression="^[0-9_kK]*$" Display="Dynamic"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">
                    <asp:Label ID="LabelNomCliente" runat="server" Text="Nombre Cliente:"></asp:Label></td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorNombre" runat="server" ControlToValidate="txtNombre" ErrorMessage="Campo Requerido" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">
                    <asp:Label ID="LabelApPaterno" runat="server" Text="Apellido Paterno:"></asp:Label></td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtApellidoP" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorApellidoP" runat="server" ControlToValidate="txtApellidoP" ErrorMessage="Campo Requerido" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">
                    <asp:Label ID="LabelApMaterno" runat="server" Text="Apellido Materno:"></asp:Label></td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtApellidoM" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorApellidoM" runat="server" ControlToValidate="txtApellidoM" ErrorMessage="Campo Requerido" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">
                    <asp:Label ID="LabelMail" runat="server" Text="Mail:"></asp:Label></td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtMail" runat="server" TextMode="Email" Width="177px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorMail" runat="server" ControlToValidate="txtMail" ErrorMessage="Campo Requerido" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">
                    <asp:Label ID="LabelActivo" runat="server" Text="Activo:"></asp:Label></td>
                <<td class="auto-style3">
                    <asp:DropDownList ID="DropDownListActivo" runat="server">
                        <asp:ListItem Value="T">Activo</asp:ListItem>
                        <asp:ListItem Value="F">No Activo</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">
                    <asp:Label ID="LabelTipo" runat="server" Text="Tipo de Usuario:"></asp:Label></td>
                <td class="auto-style3">
                    <asp:DropDownList ID="DropDownListUsuario" runat="server" DataSourceID="SqlDataSourceTipoUsuario" DataTextField="DESC_TIPO_USUARIO" DataValueField="ID_TIPO_USUARIO">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceTipoUsuario" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;TIPO_USUARIO&quot;"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">
                    <asp:Label ID="LabelDireccion" runat="server" Text="Direccion:"></asp:Label></td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtDireccion" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorDireccion" runat="server" ControlToValidate="txtDireccion" ErrorMessage="Campo Requerido" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">
                    <asp:Label ID="LabelFecNacimiento" runat="server" Text="Fecha de Nacimiento:"></asp:Label></td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtFecha" runat="server" TextMode="Date"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorFecha" runat="server" ControlToValidate="txtFecha" ErrorMessage="Campo Requerido" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:Label ID="LabelTelefono" runat="server" Text="Teléfono:"></asp:Label></td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtTelefono" runat="server" MaxLength="9"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorTelefono" runat="server" ControlToValidate="txtTelefono" Display="Dynamic" ErrorMessage="Campo Requerido" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtTelefono" ErrorMessage="Ingresar solo números" ForeColor="#FF3300" ValidationExpression="^[0-9]*$" Display="Dynamic"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">
                    <asp:Button ID="btnAgregar" runat="server" Text="Agregar" OnClick="btnAgregar_Click" /></td>
                <td class="auto-style3">
                    <asp:Label ID="lblAviso" runat="server" Text=""></asp:Label></td>
            </tr>
        </table>
    </div>
</asp:Content>

