<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="~/Controller/AgregarTransaccion.aspx.cs" Inherits="AgregarTransaccion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 181px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <h2>Agregar Transaccion</h2>
    </div>
    <div>
        <table style="width: 100%;">
            <tr>
                <td class="auto-style1">Fecha</td>
                <td>
                    <asp:Calendar ID="CalendarFecha" runat="server"></asp:Calendar>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Monto</td>
                <td>
                    <asp:TextBox ID="txtMonto" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Cuenta relacionada</td>
                <td>
                    <asp:DropDownList ID="DropDownListCuenta" runat="server" DataSourceID="SqlDataSource1" DataTextField="NUMRUT_CLI" DataValueField="ID_CUENTA">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;ID_CUENTA&quot;, &quot;NUMRUT_CLI&quot; FROM &quot;CUENTA&quot;"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Tipo de Transaccion</td>
                <td>
                    <asp:DropDownList ID="DropDownListTipo" runat="server" DataSourceID="SqlDataSourceTipoTransaccion" DataTextField="DESC_TRANSACCION" DataValueField="ID_TIPO_TRANSACCION">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceTipoTransaccion" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;TIPO_TRANSACCION&quot;"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Activo</td>
                <td>
                    <asp:CheckBox ID="chbActivo" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Button ID="btnAgregar" runat="server" OnClick="btnAgregar_Click" Text="Agregar" />
                </td>
                <td>
                    <asp:Label ID="lblAviso" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

