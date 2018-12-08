<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="~/Controller/CrearCredenciales.aspx.cs" Inherits="CrearCredenciales" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
    <h1>Creación De Credenciales</h1>
    <br />
    <asp:DropDownList ID="DropDownListContratos" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceContratos" DataTextField="ID_CONTRATO" DataValueField="ID_CONTRATO" OnSelectedIndexChanged="DropDownListContratos_SelectedIndexChanged"></asp:DropDownList>
        <asp:Label ID="LabelMandante" runat="server" Text="Mandante: "></asp:Label>
        <asp:SqlDataSource ID="SqlDataSourceContratos" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;ID_CONTRATO&quot;, &quot;NUMRUT_CLI_TITULAR&quot; FROM &quot;CONTRATO&quot;"></asp:SqlDataSource>
        <asp:TextBox ID="txtMostrarNombre" runat="server" Width="170px"></asp:TextBox>
    <br />
    <table id="tablaCrear" style="width: 60%;">
        <tr>
            <td><asp:Label ID="LabelUsuario" runat="server" Text="Usuario: "></asp:Label></td>
            <td><asp:TextBox ID="txtLgnUsuario" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td><asp:Label ID="LabelPass" runat="server" Text="Contraseña: "></asp:Label></td>
            <td><asp:TextBox ID="txtPass" runat="server" TextMode="Password"></asp:TextBox></td>
        </tr>
        <tr>
            <td><asp:Label ID="LabelConfirmPass" runat="server" Text="Confirmar Contraseña: "></asp:Label></td>
            <td><asp:TextBox ID="txtConfPass" runat="server" TextMode="Password"></asp:TextBox></td>
        </tr>
        <tr>
            <!-- Nada -->
        </tr>
        <tr>
            <td colspan="2"><asp:Button ID="btnCrearCredencial" runat="server" Text="Generar Credencial" OnClick="btnCrearCredencial_Click" /></td>
        </tr>        
    </table>
</asp:Content>