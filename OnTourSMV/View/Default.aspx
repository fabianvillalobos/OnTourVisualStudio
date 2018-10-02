<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="~/Controller/Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
        <table style="width: 50%;">
            <tr>
                <td>
                    <asp:Label ID="LabelUsuario" runat="server" Text="Usuario:"></asp:Label>

                </td>
                <td>
                    <asp:TextBox ID="txtUsuario" runat="server" Width="150px"></asp:TextBox>

                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="LabelClave" runat="server" Text="Clave:"></asp:Label>

                </td>
                <td>
                    <asp:TextBox ID="txtClave" runat="server" Width="150px" TextMode="Password"></asp:TextBox>

                </td>
            <tr>
                <td colspan="2">
                    <asp:Button ID="btnLogin" runat="server" Text="Ingresar" OnClick="btnLogin_Click" />
                </td>
            </tr>
            <tr>
                <td colspan="2"><asp:Label ID="LabelAviso" runat="server" Text=""></asp:Label></td>
            </tr>
        </table>
    </center>
</asp:Content>

