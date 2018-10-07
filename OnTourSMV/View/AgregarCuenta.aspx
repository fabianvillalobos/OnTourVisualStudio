<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="~/Controller/AgregarCuenta.aspx.cs" Inherits="AgregarCuenta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div>
        <h2>Agregar Cuenta</h2>
    </div>
    <div>
        <table style="width: 100%;">
            <tr>
                <td class="auto-style1">Saldo</td>
                <td>
                    <asp:TextBox ID="txtSaldo" runat="server"></asp:TextBox>
                </td>
                
            </tr>
            <tr>
                <td class="auto-style1">Contrato Relacionado</td>
                <td>
                    <asp:DropDownList ID="DropDownListContratoRela" runat="server" DataSourceID="SqlDataSourceContrato" DataTextField="ID_CONTRATO" DataValueField="ID_CONTRATO">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceContrato" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;CONTRATO&quot;"></asp:SqlDataSource>
                </td>
                
            </tr>
            <tr>
                <td class="auto-style1">Rut Cliente</td>
                <td>
                    <asp:TextBox ID="txtRut" runat="server"></asp:TextBox>
                </td>
                
            </tr>
            <tr>
                <td class="auto-style4">Activo</td>
                <td class="auto-style5">
                    <asp:CheckBox ID="chbActivo" runat="server" />
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

