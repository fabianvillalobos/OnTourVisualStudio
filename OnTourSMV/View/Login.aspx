<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="~/Controller/Login.aspx.cs" Inherits="View_Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<div class="bg-login-page"></div>
    <div class="login">
        <div class="bg-img">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 col-center">
                        <br />
                        <img class="logo-login" src="../images/ontour-logo.svg" width="205" alt="">
                        <div class="login-box">
                            <div class="col-xs-6">
                                <h4>Inicia con tu cuenta</h4>
                                <div class="input-group">
                                    <div class="input-group-addon"><i class="icon-user"></i></div>
                                    <asp:TextBox CssClass="form-control usuario" ID="txtUsuario" runat="server" placeholder="Usuario" ToolTip="Usuario"></asp:TextBox>
                                </div>
                                <div class="input-group">
                                    <div class="input-group-addon"><i class="icon-key"></i></div>
                                    <asp:TextBox CssClass="pass" ID="txtClave" TextMode="Password" runat="server" placeholder="Contraseña" ToolTip="Contraseña"></asp:TextBox>
                                </div>
                                <div class="alert-danger">
                                    <asp:Label ID="LabelAviso" runat="server" Text=""></asp:Label>
                                </div>
                                <asp:Button ID="btnLogin" runat="server" Text="Iniciar Sesión" CssClass="btn btn-success" OnClick="btnLogin_Click" />
                            </div>
                            <div class="col-xs-6">
                                <br />
                                <h4>Crea una cuenta</h4>
                                <p>Puedes crear una cuenta para acceder a visualizar el progreso de los contratos a los cuales estás asociado.</p>
                                
                                <a href="CrearCuenta.aspx" class="btn btn-success"><i class="glyphicon glyphicon-plus"></i> Crear cuenta</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

