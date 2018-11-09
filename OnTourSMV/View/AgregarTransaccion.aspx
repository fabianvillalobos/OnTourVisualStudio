<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="~/Controller/AgregarTransaccion.aspx.cs" Inherits="AgregarTransaccion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 181px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="row">
            <h2>Agregar Transaccion</h2>
            <br />

            <table class="form-group">
                <tr>
                    <td class="auto-style1">
                        <asp:Label ID="LabelFecha" runat="server" Text="Fecha:"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtFecha" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorFecha" runat="server" ControlToValidate="txtFecha" ErrorMessage="Campo Requerido" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <asp:Label ID="LabelMonto" runat="server" Text="Monto:"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtMonto" runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorMonto" runat="server" ControlToValidate="txtMonto" ErrorMessage="Campo Requerido" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <asp:Label ID="LabelCuentRel" runat="server" Text="Cuenta relacionada:"></asp:Label></td>
                    <td>
                        <asp:DropDownList ID="DropDownListCuenta" runat="server" CssClass="form-control" DataSourceID="SqlDataSource1" DataTextField="ID_CUENTA" DataValueField="ID_CUENTA" AutoPostBack="True" OnSelectedIndexChanged="DropDownListCuenta_SelectedIndexChanged">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;ID_CUENTA&quot; FROM &quot;CUENTA&quot; ORDER BY &quot;ID_CUENTA&quot;"></asp:SqlDataSource>
                    </td>
                    
                </tr>
                <tr>
                    <td>&nbsp</td>
                    <td>
                        <asp:TextBox ID="txtInfoCta" ReadOnly="true" runat="server" CssClass="form-control" TextMode="MultiLine" Width="168px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <asp:Label ID="LabelTipoTransaccion" runat="server" Text="Tipo de Transaccion:"></asp:Label></td>
                    <td>
                        <asp:DropDownList ID="DropDownListTipo" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="DESC_TRANSACCION" DataValueField="ID_TIPO_TRANSACCION">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;ID_TIPO_TRANSACCION&quot;, &quot;DESC_TRANSACCION&quot; FROM &quot;TIPO_TRANSACCION&quot;"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <asp:Button ID="btnAgregar" runat="server" CssClass="btn btn-primary" OnClick="btnAgregar_Click" Text="Agregar" />
                    </td>
                    <td>
                        <asp:Label ID="lblAviso" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>

