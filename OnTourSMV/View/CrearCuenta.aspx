<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="~/Controller/CrearCuenta.aspx.cs" Inherits="CrearCuenta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="bg-login-page"></div>
    <div class="login login-crear-cuenta">
        <div class="bg-img">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 col-center">
                        <br />
                        <img class="logo-login" src="../images/ontour-logo.svg" width="205" alt="">
                        <div class="login-box login-box-cliente">
                            <h1>Crear cuenta</h1>
                            <div class="row">
                                <div class="col-xs-3">
                                <asp:Label ID="Label2" runat="server" Text="Ingresa tú rut:"></asp:Label>
                                </div>
                                <div class="col-xs-3">
                                    <asp:TextBox ID="txtBuscarRut" runat="server" CssClass="form-control" ValidationGroup="groupCargar" MaxLength="8"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtBuscarRut" Display="Dynamic" ErrorMessage="Campo Rut Requerido " ForeColor="#FF3300" ValidationGroup="groupCargar"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtBuscarRut" ErrorMessage="Rut No Valido" ForeColor="#FF3300" ValidationExpression="^[0-9]*$" Display="Dynamic" ValidationGroup="groupCargar"></asp:RegularExpressionValidator>
                                </div>
                                <div class="col-xs-1">
                                   <asp:TextBox ID="txtDvBuscar" runat="server" MaxLength="1" CssClass="form-control" Width="50px" ValidationGroup="groupCargar"></asp:TextBox><!-- Validación DV Solo números del 0-9 y Letra K -->
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDvBuscar" Display="Dynamic" ErrorMessage="Campo DV Requerido" ForeColor="#FF3300" ValidationGroup="groupCargar"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtDvBuscar" ErrorMessage="Digito No Valido" ForeColor="#FF3300" ValidationExpression="^[0-9_kK]*$" Display="Dynamic" ValidationGroup="groupCargar"></asp:RegularExpressionValidator>
                                </div>
                                <div class="col-xs-1"></div>
                                <div class="col-xs-3">
                                    <asp:Button ID="buscarRut" OnClick="buscarRut_Click" runat="server" CssClass="btn btn-primary" Text="Cargar rut" ValidationGroup="groupCargar" />
                                </div>
                            </div>

                            <asp:Panel ID="panelCrearCuenta" runat="server">
                                    <div class="row row-cuenta-datos">
                                        <div class="col-xs-12">
                                            <h1>Datos de la cuenta</h1>
                                            <p>Completa los siguientes campos con la información deseada</p>
                                        </div>
                                        <div class="col-xs-4">
                                            <asp:Label ID="LabelNomCliente" runat="server" Text="Nombre de usuario:"></asp:Label>
                                            <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorNombre" runat="server" ControlToValidate="txtNombre" ErrorMessage="Campo Requerido" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="col-xs-4">
                                            <asp:Label ID="LabelPass" runat="server" Text="Contraseña: "></asp:Label>
                                            <asp:TextBox ID="txtPass" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                                        </div>
                                        <div class="col-xs-4">
                                            <asp:Label ID="LabelConfirmPass" runat="server" Text="Confirmar Contraseña: "></asp:Label>
                                            <asp:TextBox ID="txtConfPass" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                                        </div>
                                        
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-3">
                                            <asp:Button ID="crearCuenta" OnClick="crearCuenta_Click" runat="server" CssClass="btn btn-primary" Text="Crear cuenta" />
                                        </div>
                                        <div class="alert-danger">
                                            <asp:Label ID="LabelAviso" runat="server" Text=""></asp:Label>
                                        </div>
                                    </div>
                            </asp:Panel>
                            <div class="row">
                                <div class="col-md-12 separador"></div>
                            </div>
                            <div class="row">
                                <div class="col-xs-3">
                                    <a href="LoginClientes.aspx" class="btn btn-danger"><i class="glyphicon glyphicon-chevron-left"></i> Volver al menu </a>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

