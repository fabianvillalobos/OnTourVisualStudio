<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="~/Controller/AgregarCuenta.aspx.cs" Inherits="AgregarCuenta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 173px;
        }

        .auto-style2 {
            width: 173px;
            height: 19px;
        }

        .auto-style3 {
            height: 19px;
        }

        .auto-style4 {
            width: 173px;
            height: 26px;
        }

        .auto-style5 {
            height: 26px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div>
        <h2>Agregar Cuenta</h2>
    </div>
    <div>
        <table style="width: 100%;">
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="LabelSaldo" runat="server" Text="Saldo:"></asp:Label></td>
                <td>
                    <asp:TextBox ID="txtSaldo" runat="server"></asp:TextBox>
                </td>

            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="LabelContRel" runat="server" Text="Contrato Relacionado:"></asp:Label></td>
                <td>
                    <asp:DropDownList ID="DropDownListContratoRela" runat="server" DataSourceID="SqlDataSourceContrato" DataTextField="ID_CONTRATO" DataValueField="ID_CONTRATO">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceContrato" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;CONTRATO&quot;"></asp:SqlDataSource>
                </td>

            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="LabelCliente" runat="server" Text="Cliente:"></asp:Label></td>
                <td>
                    <asp:DropDownList ID="DropDownListRut" runat="server" DataSourceID="SqlDataSourceRutCliente" DataTextField="NOMBRE_CLIE" DataValueField="NUMRUT_CLI">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceRutCliente" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;CLIENTE&quot;"></asp:SqlDataSource>
                </td>

            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="LabelActivo" runat="server" Text="Activo:"></asp:Label></td>
                <td class="auto-style5">
                    <asp:DropDownList ID="DropDownListActivo" runat="server">
                        <asp:ListItem Value="T">Activo</asp:ListItem>
                        <asp:ListItem Value="F">No Activo</asp:ListItem>
                    </asp:DropDownList>
                </td>

            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Button ID="btnAgregar" runat="server" OnClick="btnAgregar_Click" Text="Agregar" />
                </td>
                <td class="auto-style3">
                    <asp:Label ID="lblAviso" runat="server"></asp:Label>
                </td>

            </tr>

        </table>
    </div>
</asp:Content>

