<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="~/Controller/AgregarContratos.aspx.cs" Inherits="AgregarContratos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>Agregar Contrato</h1>
    <br/>
    <br/>
    <center>
        <table style="width: 75%;">
            <tr>
                <td><asp:Label ID="LabelFecInicio" runat="server" Text="Fecha Inicio:"></asp:Label></td>
                <td><asp:TextBox ID="txtInicio" runat="server" TextMode="Date"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtInicio" ErrorMessage="Requerido" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td><asp:Label ID="LabelFecTermino" runat="server" Text="Fecha Termino:"></asp:Label></td>
                <td><asp:TextBox ID="txtFin" runat="server" TextMode="Date"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtFin" ErrorMessage="Requerido" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtInicio" ControlToValidate="txtFin" ErrorMessage="Rango No Valido" ForeColor="#FF3300" Operator="GreaterThan"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td><asp:Label ID="LabelMeta" runat="server" Text="Meta:"></asp:Label></td>
                <td><asp:TextBox ID="txtMeta" runat="server" TextMode="Number" MaxLength="9" Rows="1" ReadOnly="True">0</asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtMeta" ErrorMessage="Requerido" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td><asp:Label ID="LabelMonto" runat="server" Text="Monto Reserva:"></asp:Label></td>
                <td><asp:TextBox ID="txtMonto" runat="server" TextMode="Number" MaxLength="9" Rows="1" ReadOnly="True">0</asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtMonto" ErrorMessage="Requerido" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td><asp:Label ID="LabelEstado" runat="server" Text="Estado:"></asp:Label></td>
                <td>
                    <asp:DropDownList ID="DropDownListEstado" runat="server">
                        <asp:ListItem Value="1">Vigente</asp:ListItem>
                        <asp:ListItem Value="2">No Vigente</asp:ListItem>
                        <asp:ListItem Value="3">Pendiente</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td colspan="1"><asp:Label ID="LabelEmpleado" runat="server" Text="Empleado:"></asp:Label></td>
                <td colspan="2"><asp:DropDownList ID="DropDownListEmpleado" runat="server" DataSourceID="SqlDataSource1" DataTextField="NOMBRE_EMP" DataValueField="NUMRUT_EMP"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;NUMRUT_EMP&quot;, &quot;NOMBRE_EMP&quot; FROM &quot;EMPLEADO&quot;"></asp:SqlDataSource>
                </td>
                <td colspan="1"><asp:Label ID="LabelTitular" runat="server" Text="Titular:"></asp:Label></td>
                <td colspan="2"><asp:DropDownList ID="DropDownListTitular" runat="server" DataSourceID="SqlDataSource2" DataTextField="NOMBRE_CLIE" DataValueField="NUMRUT_CLI"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;NUMRUT_CLI&quot;, &quot;NOMBRE_CLIE&quot; FROM &quot;CLIENTE&quot;"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td colspan="6"><asp:Button ID="btnRegistrar" runat="server" Text="Registrar" OnClick="btnRegistrar_Click"></asp:Button></td>
            </tr>
            <tr>
                <td colspan="6"><asp:Label ID="LabelAviso" runat="server" Text=""></asp:Label></td>
            </tr>
        </table>
    </center>
</asp:Content>

