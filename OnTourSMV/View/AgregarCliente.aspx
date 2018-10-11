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
                <td class="auto-style2">Rut:</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtRut" runat="server" TextMode="Number"></asp:TextBox>
                    -<asp:TextBox ID="txtDv" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Nombre Cliente:</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Apellido Paterno:</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtApellidoP" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Apellido Materno:</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtApellidoM" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Mail:</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtMail" runat="server" TextMode="Email"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Activo:</td>
                <td class="auto-style3">
                    <asp:DropDownList ID="DropDownListActivo" runat="server">
                        <asp:ListItem Value="T">Activo</asp:ListItem>
                        <asp:ListItem Value="F">No Activo</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Direccion:</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtDireccion" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Fecha de Nacimiento:</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtFecha" runat="server" TextMode="Date"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Teléfono:</td>
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

