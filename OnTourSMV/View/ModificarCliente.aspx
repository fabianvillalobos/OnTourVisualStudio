<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="~/Controller/ModificarCliente.aspx.cs" Inherits="ModificarCliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            height: 23px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <h2>Modificar Cliente <%=Request.QueryString["NUMRUT_CLI"] %></h2>
    </div>
    <table style="width:100%;">
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Rut:"></asp:Label>
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
            </td>
        </tr>
        <tr>
            <td class="auto-style1">
                <asp:Label ID="Label3" runat="server" Text="Apellido Paterno"></asp:Label>
            </td>
            <td class="auto-style1">
                <asp:TextBox ID="txtApellidoP" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="Apellido Materno:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtApellidoM" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Text="Mail"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtMail" runat="server" TextMode="Email"></asp:TextBox>
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
            <td>
                <asp:Label ID="Label7" runat="server" Text="Dirección"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtDireccion" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label8" runat="server" Text="Fecha nacimiento"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtFecha" runat="server" TextMode="Date"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label9" runat="server" Text="Teléfono"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtTelefono" runat="server" TextMode="Number"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnModificar" runat="server" Text="Modificar" OnClick="btnModificar_Click" />
            </td>
            <td>
                <asp:Label ID="lblAviso" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>

