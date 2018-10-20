<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="~/Controller/Login.aspx.cs" Inherits="View_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .bg-img {
            /* The image used */
            background-image: url("images/bg.jpg");
            min-height: 700px;
            /* Center and scale the image nicely */
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
            position: relative;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="login">
        <div class="bg-img">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 col-center">
                        <br />
<%--                        <img class="img-rounded" src="../images/airbus.jpg" alt="">--%>
                        <div class="login-box">
                            <h1>Panel de administración</h1>
                            <!-- btnLogin_Click -->

                            <div class="input-group">
                                <div class="input-group-addon"><i class="icon-user"></i></div>
                                <!-- reemplazar el input que genera .net o incluir las clases de este -->
                                <asp:TextBox CssClass="form-control usuario" ID="txtUsuario" runat="server" ToolTip="Usuario"></asp:TextBox>
                            </div>
                            <div class="input-group">
                                <div class="input-group-addon"><i class="icon-key"></i></div>
                                <!-- reemplazar el input que genera .net o incluir las clases de este -->
                                <asp:TextBox CssClass="pass" ID="txtClave" TextMode="Password" runat="server" ToolTip="Contraseña"></asp:TextBox>
                            </div>
                            <div class="alert-danger">
                                <asp:Label ID="LabelAviso" runat="server" Text=""></asp:Label>
                            </div>
                            <asp:Button ID="btnLogin" runat="server" Text="Iniciar Sesion" CssClass="btn btn-success" OnClick="btnLogin_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

