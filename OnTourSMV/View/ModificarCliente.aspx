<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="~/Controller/ModificarCliente.aspx.cs" Inherits="ModificarCliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            height: 23px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <h2>Modificar Cliente <%=Request.QueryString["NUMRUT_CLI"] %></h2>
    </div>
    <table style="width: 100%;">
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Rut:" ></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtRut" runat="server" ReadOnly="True" TextMode="Number"></asp:TextBox>
                -<asp:TextBox ID="txtDv" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Nombre Cliente:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Campo Requerido" ForeColor="#FF3300" ControlToValidate="txtNombre"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">
                <asp:Label ID="Label3" runat="server" Text="Apellido Paterno"></asp:Label>
            </td>
            <td class="auto-style1">
                <asp:TextBox ID="txtApellidoP" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Campo Requerido" ForeColor="#FF3300" ControlToValidate="txtApellidoP"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="Apellido Materno:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtApellidoM" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Campo Requerido" ForeColor="#FF3300" ControlToValidate="txtApellidoM"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Text="Mail"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtMail" runat="server" TextMode="Email"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Campo Requerido" ForeColor="#FF3300" ControlToValidate="txtMail"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">
                <asp:Label ID="Label6" runat="server" Text="Activo"></asp:Label>
            </td>
            <td class="auto-style1">
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
            <td>
                <asp:Label ID="Label7" runat="server" Text="Dirección"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtDireccion" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Campo Requerido" ForeColor="#FF3300" ControlToValidate="txtDireccion"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label8" runat="server" Text="Fecha nacimiento"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtFecha" runat="server" TextMode="Date"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Campo Requerido" ForeColor="#FF3300" ControlToValidate="txtFecha"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label9" runat="server" Text="Teléfono"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtTelefono" runat="server" TextMode="Number"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Campo Requerido" ForeColor="#FF3300" ControlToValidate="txtTelefono" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtTelefono" ErrorMessage="Ingresar solo números" ForeColor="#FF3300" ValidationExpression="^[0-9]*$" Display="Dynamic"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnModificar" runat="server" Text="Modificar" />
            </td>
            <td>
                <asp:Label ID="lblAviso" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>

