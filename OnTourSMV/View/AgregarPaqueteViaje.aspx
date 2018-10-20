﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="~/Controller/AgregarPaqueteViaje.aspx.cs" Inherits="AgregarPaqueteViaje" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container">
        <div class="row">
            <h2>Agregar Paquete De Viaje</h2>
            <br />

            <!-- Descripcion, Valor, Activo, Fecha de Creacion -->
            <table class="form-group">
                <tr>
                    <td>
                        <asp:Label ID="LabelDescripcion" runat="server" Text="Descripción:"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtDescripcion" runat="server" TextMode="MultiLine" Height="95px" Width="294px" CssClass="form-control"></asp:TextBox></td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDescripcion" ErrorMessage="Campo Requerido" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                        <asp:Label ID="LabelValor" runat="server" Text="Valor:"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtValor" runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtValor" ErrorMessage="Campo Requerido" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>

                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <asp:Button ID="btnRegistrar" CssClass="btn btn-primary" runat="server" Text="Registrar" OnClick="btnRegistrar_Click"></asp:Button></td>
                </tr>
                <tr>
                    <td colspan="4">
                        <asp:Label ID="LabelAviso" runat="server" Text=""></asp:Label></td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>

