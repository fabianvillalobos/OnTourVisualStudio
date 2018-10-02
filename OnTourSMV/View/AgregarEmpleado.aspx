<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="~/Controller/AgregarEmpleado.aspx.cs" Inherits="AgregarEmpleado" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 90px;
        }
        .auto-style2 {
            width: 99px;
        }
        .auto-style3 {
            margin-left: 0px;
        }
        .auto-style4 {
            width: 35px;
        }
        .auto-style5 {
            width: 90px;
            height: 42px;
        }
        .auto-style6 {
            height: 42px;
        }
        .auto-style7 {
            width: 99px;
            height: 42px;
        }
        .auto-style8 {
            width: 35px;
            height: 42px;
        }
        .auto-style9 {
            width: 85%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
        <table class="auto-style9" border="1">
            <tr>
                <td class="auto-style1"><asp:Label ID="LabelRut" runat="server" Text="Rut:"></asp:Label></td>
                <td><asp:TextBox ID="txtRut" runat="server"></asp:TextBox></td>
                <td class="auto-style2"><asp:Label ID="LabelDv" runat="server" Text="Dv:"></asp:Label></td>
                <td class="auto-style4"><asp:TextBox ID="txtxDv" runat="server" Width="18px"></asp:TextBox></td>
                <td><asp:Label ID="LabelNombreEmp" runat="server" Text="Nombre:"></asp:Label></td>
                <td><asp:TextBox ID="txtNombreEmp" runat="server" Width="132px" CssClass="auto-style3"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="auto-style5"><asp:Label ID="Label1" runat="server" Text="Apellido Paterno:"></asp:Label></td>
                <td class="auto-style6"><asp:TextBox ID="txtAppaterno" runat="server"></asp:TextBox></td>
                <td class="auto-style7"><asp:Label ID="Label2" runat="server" Text="Apellido Materno:"></asp:Label></td>
                <td class="auto-style8"><asp:TextBox ID="txtApMaterno" runat="server" Width="132px"></asp:TextBox></td>
                <td class="auto-style6"><asp:Label ID="Label3" runat="server" Text="Email:"></asp:Label></td>
                <td class="auto-style6"><asp:TextBox ID="txtEmail" runat="server" Width="132px"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="auto-style5"><asp:Label ID="Label4" runat="server" Text="Direccion:"></asp:Label></td>
                <td class="auto-style6"><asp:TextBox ID="txtDireccion" runat="server"></asp:TextBox></td>
                <td><asp:CheckBox ID="chkActivo" runat="server" Text="Activo"></asp:CheckBox></td>
                <td><asp:DropDownList ID="DropDownListTipoCliente" runat="server" DataSourceID="SqlDataSource1" DataTextField="DESC_TIPO_USUARIO" DataValueField="ID_TIPO_USUARIO"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;DESC_TIPO_USUARIO&quot;, &quot;ID_TIPO_USUARIO&quot; FROM &quot;TIPO_USUARIO&quot; ORDER BY &quot;DESC_TIPO_USUARIO&quot;, &quot;ID_TIPO_USUARIO&quot;"></asp:SqlDataSource>
                </td>
                <td><asp:Label ID="Label5" runat="server" Text="Fecha Nacimiento"></asp:Label></td>
                <td><asp:TextBox ID="txtFechaNac" runat="server" TextMode="Date"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label ID="Label6" runat="server" Text="Telefono"></asp:Label></td>
                <td><asp:TextBox ID="txtTelefono" runat="server"></asp:TextBox></td>
            </tr>
            <td>
                <td colspan="4"><asp:Button ID="BtnAgregarEmp" runat="server" Text="Agregar" OnClick="BtnAgregarEmp_Click"></asp:Button></td>
            </tr>
            <td>
                <td colspan="4"><asp:Label ID="LabelAviso" runat="server" Text=""></asp:Label></td>
            </tr>
        </table>
    </center>
</asp:Content>

