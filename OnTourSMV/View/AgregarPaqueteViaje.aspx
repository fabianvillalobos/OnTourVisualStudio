<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="~/Controller/AgregarPaqueteViaje.aspx.cs" Inherits="AgregarPaqueteViaje" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <center>
    <h1>Agregar Paquete De Viaje</h1>
    <br/>
    <br/>
        <!-- Descripcion, Valor, Activo, Fecha de Creacion -->
        <table style="width: 100%;">
            <tr>
                <td>Descripción:</td>
                <td><asp:TextBox ID="txtDescripcion" runat="server" TextMode="MultiLine"></asp:TextBox></td>
                <td>Valor:</td>
                <td><asp:TextBox ID="txtValor" runat="server" TextMode="Number"></asp:TextBox></td>
                <td>Activo</td>
                <td>
                    <asp:DropDownList ID="DropDownListActivo" runat="server">
                        <asp:ListItem Value="T">Activo</asp:ListItem>
                        <asp:ListItem Value="F">No Activo</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>Fecha De Cracion</td>
                <td><asp:TextBox ID="txtFecha" runat="server" TextMode="Date"></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="8"><asp:Button ID="btnRegistrar" runat="server" Text="Registrar" OnClick="btnRegistrar_Click"></asp:Button></td>
            </tr>
            <tr>
                <td colspan="8"><asp:Label ID="LabelAviso" runat="server" Text=""></asp:Label></td>
            </tr>
           
        </table>
    </center>
</asp:Content>

