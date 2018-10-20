<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="~/Controller/ModificarCliente.aspx.cs" Inherits="ModificarCliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            height: 23px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="row">
            <h2>Modificar Cliente <%=Request.QueryString["NUMRUT_CLI"] %></h2>
            <table>
                <tr>
                    <td>
                        <asp:Label ID="Label11" runat="server" Text="Actualizar Usuario"></asp:Label>
                    </td>
                    <td>
                        <asp:Button ID="ButtonActualizarUsuario" CssClass="btn btn-primary" CausesValidation="false" runat="server" Text="Click aquí" OnClick="ButtonActualizarUsuario_Click" />
                    </td>
                </tr>
            </table>
            <table style="width: 100%;">
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Rut:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtRut" runat="server" ReadOnly="True" TextMode="Number" CssClass="form-control"></asp:TextBox>
                    </td>
                    <td>-
                    </td>
                    <td>
                        <asp:TextBox ID="txtDv" runat="server" ReadOnly="True" CssClass="form-control" Width="50px"></asp:TextBox>
                    </td>
                    <td>

                        <asp:Label ID="Label10" runat="server" Text="Estos datos no se pueden modificar"></asp:Label>

                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="Nombre Cliente:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtNombre" ReadOnly="True" runat="server" CssClass="form-control"></asp:TextBox>
                    </td>
                    <td>

                        <asp:TextBox ID="txtNombreNuevo" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorNombreNuevo" runat="server" ErrorMessage="Campo Requerido" ForeColor="#FF3300" ControlToValidate="txtNombreNuevo"></asp:RequiredFieldValidator>

                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <asp:Label ID="Label3" runat="server" Text="Apellido Paterno"></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:TextBox ID="txtApellidoP" ReadOnly="True" runat="server" CssClass="form-control"></asp:TextBox>

                    </td>
                    <td>

                        <asp:TextBox ID="txtApellidoPNuevo" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorAPNuevo" runat="server" ErrorMessage="Campo Requerido" ForeColor="#FF3300" ControlToValidate="txtApellidoPNuevo"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="Apellido Materno:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtApellidoM" ReadOnly="True" runat="server" CssClass="form-control"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txtApellidoMNuevo" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorAMNuevo" runat="server" ErrorMessage="Campo Requerido" ForeColor="#FF3300" ControlToValidate="txtApellidoMNuevo"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text="Mail"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtMail" runat="server" ReadOnly="true" TextMode="Email" CssClass="form-control"></asp:TextBox>

                    </td>
                    <td>
                        <asp:TextBox ID="txtMailNuevo" runat="server" TextMode="Email" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorMailNuevo" runat="server" ErrorMessage="Campo Requerido" ForeColor="#FF3300" ControlToValidate="txtMailNuevo"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <asp:Label ID="Label6" runat="server" Text="Activo"></asp:Label>
                    </td>
                    <td class="auto-style1">

                        <asp:TextBox ID="txtActivo" ReadOnly="true" runat="server" CssClass="form-control"></asp:TextBox>

                    </td>
                    <td class="auto-style1">
                        <asp:DropDownList ID="DropDownListActivoNuevo" runat="server">
                            <asp:ListItem Value="T">Activo</asp:ListItem>
                            <asp:ListItem Value="F">No Activo</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7">
                        <asp:Label ID="LabelTipo" runat="server" Text="Tipo de Usuario:"></asp:Label></td>
                    <td class="auto-style3">
                        <asp:TextBox ID="txtTipoUsuario" ReadOnly="true" runat="server" CssClass="form-control"></asp:TextBox>
                        NO IMPLEMENTADO AUN</td>
                    <td>
                        <asp:DropDownList ID="DropDownListUsuario" runat="server" DataSourceID="SqlDataSourceTipoUsuario" DataTextField="DESC_TIPO_USUARIO" DataValueField="ID_TIPO_USUARIO">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSourceTipoUsuario" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;TIPO_USUARIO&quot;"></asp:SqlDataSource>

                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label7" runat="server" Text="Dirección"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtDireccion" ReadOnly="true" runat="server" CssClass="form-control"></asp:TextBox>

                    </td>
                    <td>
                        <asp:TextBox ID="txtDireccionNuevo" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorDireccionNuevo" runat="server" ErrorMessage="Campo Requerido" ForeColor="#FF3300" ControlToValidate="txtDireccionNuevo"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label8" runat="server" Text="Fecha nacimiento"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtFecha" ReadOnly="true" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>

                    </td>
                    <td>

                        <asp:TextBox ID="txtFechaNuevo" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorFechaNuevo" runat="server" ErrorMessage="Campo Requerido" ForeColor="#FF3300" ControlToValidate="txtFechaNuevo"></asp:RequiredFieldValidator>

                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label9" runat="server" Text="Teléfono"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtTelefono" ReadOnly="true" runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txtTelefonoNuevo" TextMode="Number" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorTelefonoNuevoRequerido" runat="server" ErrorMessage="Campo Requerido" ForeColor="#FF3300" ControlToValidate="txtTelefonoNuevo" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidatorTelefonoNuevoValido" runat="server" ControlToValidate="txtTelefonoNuevo" ErrorMessage="Ingresar solo números" ForeColor="#FF3300" ValidationExpression="^[0-9]*$" Display="Dynamic"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <br />
                    </td>
                    <td>
                        <asp:Button ID="btnModificar" runat="server" Text="Modificar" CssClass="btn btn-primary" OnClick="btnModificar_Click" />
                    </td>
                    <td>
                        <asp:Label ID="lblAviso" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>

