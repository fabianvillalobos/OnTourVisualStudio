<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="~/Controller/AgregarCliente.aspx.cs" Inherits="AgregarCliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style3 {
            width: 292px;
        }

        .auto-style4 {
            width: 100%;
            height: 240px;
        }

        .auto-style5 {
            width: 82px;
            height: 26px;
        }

        .auto-style6 {
            width: 292px;
            height: 26px;
        }

        .auto-style7 {
            width: 82px;
        }

        .auto-style8 {
            width: 82px;
            height: 49px;
        }

        .auto-style9 {
            width: 292px;
            height: 49px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <h2>Agregar Usuario</h2>
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
                    <asp:TextBox ID="txtMail" runat="server" TextMode="Email" Width="171px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorMail" runat="server" ControlToValidate="txtMail" ErrorMessage="Campo Requerido" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">
                    <asp:Label ID="LabelActivo" runat="server" Text="Activo:"></asp:Label></td>
                <td class="auto-style3">
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

