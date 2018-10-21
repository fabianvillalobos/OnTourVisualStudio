<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="~/Controller/AgregarPaqueteViaje.aspx.cs" Inherits="AgregarPaqueteViaje" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container">
        <div class="row">
            <h2>Paquete De Viaje</h2>
            <table style="width:100%;">
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Viaje"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server">
                        </asp:DropDownList>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="Estadía"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownList2" runat="server">
                        </asp:DropDownList>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="Seguros"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownList3" runat="server">
                        </asp:DropDownList>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                       <asp:Label ID="Label4" runat="server" Text="Contrato"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSourceContrato" DataTextField="NUMRUT_CLI_TITULAR" DataValueField="ID_CONTRATO"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSourceContrato" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;CONTRATO&quot;"></asp:SqlDataSource>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                      
                    </td>
                    <td>
                        <asp:Button ID="Button4" runat="server" Text="Registrar" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <br />

            <!-- Descripcion, Valor, Activo, Fecha de Creacion -->
        </div>
    </div>
</asp:Content>

