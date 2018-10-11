<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="~/Controller/AgregarCliente.aspx.cs" Inherits="AgregarCliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style2 {
            width: 115px;
        }

        .auto-style3 {
            width: 292px;
        }

        .auto-style4 {
            width: 100%;
            height: 240px;
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
                <td class="auto-style2">
                    <asp:Label ID="LabelRut" runat="server" Text="Rut:"></asp:Label></td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtRut" runat="server" TextMode="Number"></asp:TextBox>
                    -<asp:TextBox ID="txtDv" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="LabelNomCliente" runat="server" Text="Nombre Cliente:"></asp:Label></td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="LabelApPaterno" runat="server" Text="Apellido Paterno:"></asp:Label></td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtApellidoP" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="LabelApMaterno" runat="server" Text="Apellido Materno:"></asp:Label></td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtApellidoM" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="LabelMail" runat="server" Text="Mail:"></asp:Label></td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtMail" runat="server" TextMode="Email"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="LabelActivo" runat="server" Text="Activo:"></asp:Label></td>
                <td class="auto-style3">
                    <asp:DropDownList ID="DropDownListActivo" runat="server">
                        <asp:ListItem Value="T">Activo</asp:ListItem>
                        <asp:ListItem Value="F">No Activo</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="LabelDireccion" runat="server" Text="Direccion:"></asp:Label></td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtDireccion" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="LabelFecNacimiento" runat="server" Text="Fecha de Nacimiento:"></asp:Label></td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtFecha" runat="server" TextMode="Date"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="LabelTelefono" runat="server" Text="Teléfono:"></asp:Label></td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtTelefono" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Button ID="btnAgregar" runat="server" Text="Agregar" OnClick="btnAgregar_Click" /></td>
                <td class="auto-style3">
                    <asp:Label ID="lblAviso" runat="server" Text=""></asp:Label></td>
            </tr>
        </table>
    </div>
</asp:Content>

