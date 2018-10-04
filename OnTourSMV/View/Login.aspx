<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="~/Controller/Login.aspx.cs" Inherits="View_Login" %>

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

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUsuario" ErrorMessage="Se debe ingresar usuario" ForeColor="Red"></asp:RequiredFieldValidator>

                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="LabelClave" runat="server" Text="Clave:"></asp:Label>

                </td>
                <td>
                    <asp:TextBox ID="txtClave" runat="server" Width="150px" TextMode="Password"></asp:TextBox>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtClave" ErrorMessage="Se debe ingresar clave" ForeColor="Red"></asp:RequiredFieldValidator>

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

