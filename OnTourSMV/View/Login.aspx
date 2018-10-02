<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="~/Controller/Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100%;">
        <tr>
            <td><asp:label runat="server" text="Usuario"></asp:label></td>
            <td>
                <asp:TextBox ID="TextBoxUsuario" runat="server"></asp:TextBox>
            </td>           
        </tr>
        <tr>
            <td><asp:label runat="server" text="Contrasena"></asp:label></td>
            <td><asp:TextBox ID="TextBoxContrasena" runat="server"></asp:TextBox></td>                      
        </tr>
        <tr>
            <td><asp:button runat="server" text="Button" /></td>
        </tr>
        
        
    </table>
</asp:Content>

