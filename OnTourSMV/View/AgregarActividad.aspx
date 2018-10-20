<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="~/Controller/AgregarActividad.aspx.cs" Inherits="AgregarActividad" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container">
        <div class="row">
            <h2>Agregar Actividades</h2>
            <br />

            <table>
                <tr>
                    <td>
                        <asp:Label ID="LabelTipoActividad" runat="server" Text="Tipo de Actividad:"></asp:Label></td>
                    <td>
                        <asp:DropDownList ID="DropDownListTipoActividad" runat="server" CssClass="form-control" DataSourceID="SqlDataSourceTipoActividad" DataTextField="DESC_TIPO_ACT" DataValueField="ID_TIPO_ACTIIVIDAD">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSourceTipoActividad" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;TIPO_ACTIVIDAD&quot;"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="LabelDescripcion" runat="server" Text="Descripcion:"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtDescripcion" ErrorMessage="Requerido" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="LabelFecActividad" runat="server" Text="Fecha de Actividad:"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtFechaActividad" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtFechaActividad" ErrorMessage="Requerido" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="LabelMonto" runat="server" Text="Monto:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtMonto" runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox>
                        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtMonto" ErrorMessage="Monto No Valido" ForeColor="#FF3300" MaximumValue="999999999" MinimumValue="0" Type="Currency"></asp:RangeValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="LabelActivo" runat="server" Text="Activo:"></asp:Label></td>
                    <td>
                        <asp:DropDownList ID="DropDownListActivo" runat="server" CssClass="form-control" AutoPostBack="True">
                            <asp:ListItem Value="T">Activo</asp:ListItem>
                            <asp:ListItem Value="F">No Activo</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="LabelContRelacionado" runat="server" Text="Contrato Relacionado:"></asp:Label></td>
                    <td>
                        <asp:DropDownList ID="DropDownListContratoRela" runat="server" CssClass="form-control" DataSourceID="ContratoRelacionado" DataTextField="ID_CONTRATO" DataValueField="ID_CONTRATO">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="ContratoRelacionado" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;ID_CONTRATO&quot; FROM &quot;CONTRATO&quot;"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="btnAgregar" runat="server" Text="Agregar" CssClass="btn btn-primary" OnClick="btnAgregar_Click" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblAviso" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>

