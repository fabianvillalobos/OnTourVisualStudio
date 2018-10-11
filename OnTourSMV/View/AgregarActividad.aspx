<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="~/Controller/AgregarActividad.aspx.cs" Inherits="AgregarActividad" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 167px;
        }

        .auto-style2 {
            height: 26px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <h2>Agregar Actividades</h2>
    </div>
    <div>
        <table style="width: 100%;">
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="LabelTipoActividad" runat="server" Text="Tipo de Actividad:"></asp:Label></td>
                <td>
                    <asp:DropDownList ID="DropDownListTipoActividad" runat="server" DataSourceID="SqlDataSourceTipoActividad" DataTextField="DESC_TIPO_ACT" DataValueField="ID_TIPO_ACTIIVIDAD">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceTipoActividad" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;TIPO_ACTIVIDAD&quot;"></asp:SqlDataSource>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="LabelDescripcion" runat="server" Text="Descripcion:"></asp:Label></td>
                <td>
                    <asp:TextBox ID="txtDescripcion" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="LabelFecActividad" runat="server" Text="Fecha de Actividad:"></asp:Label></td>
                <td>
                    <asp:TextBox ID="txtFechaActividad" runat="server" TextMode="Date"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="LabelMonto" runat="server" Text="Monto:"></asp:Label> </td>
                <td>
                    <asp:TextBox ID="txtMonto" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="LabelActivo" runat="server" Text="Activo:"></asp:Label></td>
                <td>
                    <asp:DropDownList ID="DropDownListActivo" runat="server" AutoPostBack="True">
                        <asp:ListItem Value="T">Activo</asp:ListItem>
                        <asp:ListItem Value="F">No Activo</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="LabelContRelacionado" runat="server" Text="Contrato Relacionado:"></asp:Label></td>
                <td class="auto-style2">
                    <asp:DropDownList ID="DropDownListContratoRela" runat="server" DataSourceID="ContratoAsociado" DataTextField="ID_CONTRATO" DataValueField="ID_CONTRATO" AutoPostBack="True">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="ContratoAsociado" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;ID_CONTRATO&quot; FROM &quot;ACTIVIDAD&quot;"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Button ID="btnAgregar" runat="server" Text="Agregar" OnClick="btnAgregar_Click" />
                </td>

            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="lblAviso" runat="server"></asp:Label>
                </td>

            </tr>
        </table>
    </div>
</asp:Content>

