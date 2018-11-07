<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="~/Controller/AgregarCliente.aspx.cs" Inherits="AgregarCliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container">
        <div class="row">
            <h2>Agregar Cliente(Pasajero)</h2>
            <br />

            <table>
                
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="Cargar cliente por rut"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtBuscarRut" runat="server" CssClass="form-control col-md-6" ValidationGroup="groupCargar" MaxLength="8"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtBuscarRut" Display="Dynamic" ErrorMessage="Campo Rut Requerido " ForeColor="#FF3300" ValidationGroup="groupCargar"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtBuscarRut" ErrorMessage="Rut No Valido" ForeColor="#FF3300" ValidationExpression="^[0-9]*$" Display="Dynamic" ValidationGroup="groupCargar"></asp:RegularExpressionValidator>
                    </td>
                    <td>-</td>
                    <td>
                        <asp:TextBox ID="txtDvBuscar" runat="server" MaxLength="1" CssClass="form-control" Width="50px" ValidationGroup="groupCargar"></asp:TextBox>
                        <!-- Validación DV Solo números del 0-9 y Letra K -->
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDvBuscar" Display="Dynamic" ErrorMessage="Campo DV Requerido" ForeColor="#FF3300" ValidationGroup="groupCargar"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtDvBuscar" ErrorMessage="Digito No Valido" ForeColor="#FF3300" ValidationExpression="^[0-9_kK]*$" Display="Dynamic" ValidationGroup="groupCargar"></asp:RegularExpressionValidator>

                     </td>
                    <td>
                        <asp:Button ID="btnCargarCliente" runat="server" CssClass="btn btn-primary" Text="Cargar" OnClick="btnCargarCliente_Click" ValidationGroup="groupCargar" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Contrato a asociar"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownListContratoAsociar" runat="server" DataSourceID="SqlDataSourceContratoAsociar" DataTextField="NUMRUT_CLI_TITULAR" DataValueField="ID_CONTRATO" Enabled="False" AutoPostBack="True" OnDataBound="DropDownListContratoAsociar_DataBound" OnSelectedIndexChanged="DropDownListContratoAsociar_SelectedIndexChanged">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSourceContratoAsociar" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;CONTRATO&quot;"></asp:SqlDataSource>
                    </td>
                    <td>
                    </td>
                    
                </tr>
                <tr>
                    <td colspan="4">
                        <asp:Label ID="Label3" runat="server" Text="Contrato Mandante"></asp:Label>
                        <asp:TextBox ID="txtMostrarNombre" runat="server"  Wrap="true" Width="273px" Height="52px" TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="LabelRut" runat="server" Text="Rut:"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtRut" runat="server" MaxLength="8" CssClass="form-control col-md-6" Enabled="False"></asp:TextBox>
                        <!-- Validación rut Solo números del 0-9 -->
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorRut" runat="server" ControlToValidate="txtRut" Display="Dynamic" ErrorMessage="Campo Rut Requerido " ForeColor="#FF3300" ValidationGroup="mandanteGroup"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtRut" ErrorMessage="Rut No Valido" ForeColor="#FF3300" ValidationExpression="^[0-9]*$" Display="Dynamic" ValidationGroup="mandanteGroup"></asp:RegularExpressionValidator>
                    </td>
                    <td>-</td>
                    <td>
                        <asp:TextBox ID="txtDv" runat="server" MaxLength="1" CssClass="form-control" Width="50px" Enabled="False"></asp:TextBox>
                        <!-- Validación DV Solo números del 0-9 y Letra K -->
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorDv" runat="server" ControlToValidate="txtDv" Display="Dynamic" ErrorMessage="Campo DV Requerido" ForeColor="#FF3300" ValidationGroup="mandanteGroup"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtDv" ErrorMessage="Digito No Valido" ForeColor="#FF3300" ValidationExpression="^[0-9_kK]*$" Display="Dynamic" ValidationGroup="mandanteGroup"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="LabelNomCliente" runat="server" Text="Nombre:"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control col-md-6" Enabled="False"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorNombre" runat="server" ControlToValidate="txtNombre" ErrorMessage="Campo Requerido" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="LabelApPaterno" runat="server" Text="Apellido Paterno:"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtApellidoP" runat="server" CssClass="form-control col-md-6" Enabled="False"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorApellidoP" runat="server" ControlToValidate="txtApellidoP" ErrorMessage="Campo Requerido" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="LabelApMaterno" runat="server" Text="Apellido Materno:"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtApellidoM" runat="server" CssClass="form-control col-md-6" Enabled="False"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorApellidoM" runat="server" ControlToValidate="txtApellidoM" ErrorMessage="Campo Requerido" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="LabelMail" runat="server" Text="Mail:"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtMail" runat="server" TextMode="Email" CssClass="form-control col-md-6" Enabled="False"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorMail" runat="server" ControlToValidate="txtMail" ErrorMessage="Campo Requerido" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="LabelDireccion" runat="server" Text="Direccion:"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-control col-md-6" Enabled="False"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorDireccion" runat="server" ControlToValidate="txtDireccion" ErrorMessage="Campo Requerido" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="LabelFecNacimiento" runat="server" Text="Fecha de Nacimiento:"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtFecha" runat="server" TextMode="Date" CssClass="form-control col-md-6" Enabled="False"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorFecha" runat="server" ControlToValidate="txtFecha" ErrorMessage="Campo Requerido" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                    <asp:Label ID="lblFechaStr" runat="server" Text="Fecha de Nacimiento:" Visible="False"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="txtFechaStr" runat="server" TextMode="SingleLine" CssClass="form-control" Enabled="False" Visible="False"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="LabelTelefono" runat="server" Text="Teléfono:"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtTelefono" runat="server" MaxLength="9" CssClass="form-control col-md-6" Enabled="False"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtTelefono" ErrorMessage="Ingresar solo números" ForeColor="#FF3300" ValidationExpression="^[0-9]*$" Display="Dynamic"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>

                    </td>
                </tr>
                <tr>
                    <td class="auto-style7">
                        <asp:Button ID="btnAgregar" runat="server" CssClass="btn btn-primary" Text="Agregar" OnClick="btnAgregar_Click" /></td>
                    <td class="auto-style3">
                        <asp:Label ID="lblAviso" runat="server" Text=""></asp:Label></td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>

