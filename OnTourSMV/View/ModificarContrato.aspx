<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="~/Controller/ModificarContrato.aspx.cs" Inherits="View_ModificarContrato" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <h1>Modificar Contrato</h1>
    <br/>
    <br/>
    <center>
        <table style="width: 75%;">
            <tr>
                <td>Fecha Inicio</td>
                <td><asp:TextBox ID="txtInicio" runat="server" TextMode="Date"></asp:TextBox>
                </td>
                <td>Fecha Termino</td>
                <td><asp:TextBox ID="txtFin" runat="server" TextMode="Date"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Meta</td>
                <td><asp:TextBox ID="txtMeta" runat="server" TextMode="Number" MaxLength="9" Rows="1"></asp:TextBox>
                </td>
                <td>Monto</td>
                <td><asp:TextBox ID="txtMonto" runat="server" TextMode="Number" MaxLength="9" Rows="1"></asp:TextBox>
                </td>
                <td>Estado</td>
                <td>
                    <asp:DropDownList ID="DropDownListEstado" runat="server">
                        <asp:ListItem Value="1">Vigente</asp:ListItem>
                        <asp:ListItem Value="2">No Vigente</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td colspan="1">Empleado</td>
                <td colspan="2"><asp:DropDownList ID="DropDownListEmpleado" runat="server" DataSourceID="SqlDataSource1" DataTextField="NOMBRE_EMP" DataValueField="NUMRUT_EMP"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;NUMRUT_EMP&quot;, &quot;NOMBRE_EMP&quot; FROM &quot;EMPLEADO&quot;"></asp:SqlDataSource>
                </td>
                <td colspan="1">Titular</td>
                <td colspan="2"><asp:DropDownList ID="DropDownListTitular" runat="server" DataSourceID="SqlDataSource2" DataTextField="NOMBRE_CLIE" DataValueField="NUMRUT_CLI"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;NUMRUT_CLI&quot;, &quot;NOMBRE_CLIE&quot; FROM &quot;CLIENTE&quot;"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td colspan="3"><asp:Button ID="btnCargar" runat="server" Text="Cargar Datos" OnClick="btnCargar_Click"></asp:Button></td>
                <td colspan="3"><asp:Button ID="btnModificar" runat="server" Text="Modificar" OnClick="btnModificar_Click"></asp:Button></td>
            </tr>
            <tr>
                <td colspan="6"><asp:Label ID="LabelAviso" runat="server" Text=""></asp:Label></td>
            </tr>
        </table>
    </center>
</asp:Content>

