<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="~/Controller/AgregarContratos.aspx.cs" Inherits="AgregarContratos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <center>
            <h2>Nuevo Contrato</h2>
        </center>
    </div>
    <br />
    <br />
    <div class="container">
        <div class="row">
            <center>
        <table class="form-group" style="width: 75%;">     
                <td><asp:Label ID="LabelFecInicio" runat="server" Text="Fecha Inicio:"></asp:Label></td>
                <td><asp:TextBox ID="txtInicio" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtInicio" ErrorMessage="Requerido" ForeColor="Red" ValidationGroup="contratoGroup"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtInicio" ErrorMessage="Requerido" ForeColor="Red" ValidationGroup="mandanteGroup"></asp:RequiredFieldValidator>
                </td>
                <td><asp:Label ID="LabelFecTermino" runat="server" Text="Fecha Termino:"></asp:Label></td>
                <td><asp:TextBox ID="txtFin" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtFin" ErrorMessage="Requerido" ForeColor="Red" ValidationGroup="contratoGroup"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtFin" ErrorMessage="Requerido" ForeColor="Red" ValidationGroup="mandanteGroup"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtInicio" ControlToValidate="txtFin" ErrorMessage="Rango No Valido" ForeColor="#FF3300" Operator="GreaterThan" ValidationGroup="contratoGroup"></asp:CompareValidator>
                </td>
            <tr>
                <td><asp:Label ID="LabelMeta" runat="server" Text="Meta:"></asp:Label></td>
                <td><asp:TextBox ID="txtMeta" runat="server" CssClass="form-control" TextMode="Number" MaxLength="9" Rows="1" ReadOnly="True">0</asp:TextBox>
                </td>
                <td><asp:Label ID="LabelReserva" runat="server" Text="Reserva:"></asp:Label></td>
                <td><asp:TextBox ID="txtMonto" runat="server" CssClass="form-control" TextMode="Number" MaxLength="9" Rows="1" ReadOnly="True">0</asp:TextBox>
                </td>
                <%--<td class="auto-style1"><asp:Label ID="LabelEstado" runat="server" Text="Estado:"></asp:Label></td>
                <td>
                    <asp:DropDownList ID="DropDownListEstado" runat="server">
                        <asp:ListItem Value="1">Vigente</asp:ListItem>
                        <asp:ListItem Value="2">No Vigente</asp:ListItem>
                        <asp:ListItem Value="3">Pendiente</asp:ListItem>
                    </asp:DropDownList>
                </td>--%>
            </tr>
            <tr>                
                <td colspan="2"><asp:Label ID="LabelTitular" runat="server" Text="Mandante:"></asp:Label></td>
                <td ><asp:DropDownList ID="DropDownListMandante" runat="server" CssClass="form-control" DataSourceID="SqlDataSourceMandante" DataTextField="NOMBRE_CLIE" DataValueField="NUMRUT_CLI" AutoPostBack="True">
                    <asp:ListItem>Sin seleccionar</asp:ListItem>
                    </asp:DropDownList>
               </td>
            </tr>
            <tr>            
                <td>                        
                    <asp:Button ID="ButtonCargarMandante" runat="server" CssClass="btn btn-primary" Text="Cargar mandante" OnClick="ButtonCargarMandante_Click" ValidationGroup="contratoGroup" />
                    <asp:SqlDataSource ID="SqlDataSourceMandante" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT NUMRUT_CLI, NOMBRE_CLIE, APELLIDO_PAT_CLI, APELLIDO_MAT_CLI FROM ONTOUR.CLIENTE"></asp:SqlDataSource>                            
                </td>                
            </tr>                       
        </table>
    </center>
        </div>
    </div>
    <br />
    <br />
    <div>
        <center>
            <h1>Asignar Mandante </h1>
        </center>
    </div>
    <br />
    <div class="container">
        <div class="row">
            <center>
        <table class="auto-style4 form-group" >
            <tr>
                <td>
                    <asp:Label ID="LabelNomCliente" runat="server" Text="Nombre(s):"></asp:Label></td>
                <td>
                    <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control col-md-6"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorNombre" runat="server" ControlToValidate="txtNombre" ErrorMessage="Campo Requerido" ForeColor="#FF3300" ValidationGroup="mandanteGroup"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="LabelApPaterno" runat="server" Text="Apellido Paterno:"></asp:Label></td>
                <td>
                    <asp:TextBox ID="txtApellidoP" runat="server" CssClass="form-control col-md-6"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorApellidoP" runat="server" ControlToValidate="txtApellidoP" ErrorMessage="Campo Requerido" ForeColor="#FF3300" ValidationGroup="mandanteGroup"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="LabelApMaterno" runat="server" Text="Apellido Materno:"></asp:Label></td>
                <td>
                    <asp:TextBox ID="txtApellidoM" runat="server" CssClass="form-control col-md-6"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorApellidoM" runat="server" ControlToValidate="txtApellidoM" ErrorMessage="Campo Requerido" ForeColor="#FF3300" ValidationGroup="mandanteGroup"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="LabelRut" runat="server" Text="Rut:"></asp:Label></td>
                <td >
                    <asp:TextBox ID="txtRut" runat="server" MaxLength="8" CssClass="form-control col-md-6" ></asp:TextBox>
                    <!-- Validación rut Solo números del 0-9 -->
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorRut" runat="server" ControlToValidate="txtRut" Display="Dynamic" ErrorMessage="Campo Rut Requerido " ForeColor="#FF3300" ValidationGroup="mandanteGroup"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtRut" ErrorMessage="Rut No Valido" ForeColor="#FF3300" ValidationExpression="^[0-9]*$" Display="Dynamic" ValidationGroup="mandanteGroup"></asp:RegularExpressionValidator>
                </td>
                <td>-</td>
                <td>    
                    <asp:TextBox ID="txtDv" runat="server" MaxLength="1" CssClass="form-control" Width="50px"></asp:TextBox>                    
                    <!-- Validación DV Solo números del 0-9 y Letra K -->
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorDv" runat="server" ControlToValidate="txtDv" Display="Dynamic" ErrorMessage="Campo DV Requerido" ForeColor="#FF3300" ValidationGroup="mandanteGroup"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtDv" ErrorMessage="Digito No Valido" ForeColor="#FF3300" ValidationExpression="^[0-9_kK]*$" Display="Dynamic" ValidationGroup="mandanteGroup"></asp:RegularExpressionValidator>
                </td>
            </tr>  
            <tr>
                <td>
                    <asp:Label ID="lblFechaStr" runat="server" Text="Fecha de Nacimiento:" Visible="False"></asp:Label></td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtFechaStr" runat="server" TextMode="SingleLine" CssClass="form-control" Visible="False"></asp:TextBox>
                </td>
            </tr>       
            <tr>
                <td>
                    <asp:Label ID="LabelFecNacimiento" runat="server" Text="Fecha de Nacimiento:"></asp:Label></td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtFecha" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorFecha" runat="server" ControlToValidate="txtFecha" ErrorMessage="Campo Requerido" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtHoy" runat="server" TextMode="Date" Visible="False"></asp:TextBox>
                    <asp:CustomValidator ID="ValidadorFecNac" runat="server" ControlToValidate="txtFecha" ForeColor="#FF3300"></asp:CustomValidator>
                </td>
            </tr>           
            <tr>
                <td>
                    <asp:Label ID="LabelMail" runat="server" Text="Mail:"></asp:Label></td>
                <td>
                    <asp:TextBox ID="txtMail" runat="server" CssClass="form-control col-md-6" TextMode="Email" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorMail" runat="server" ControlToValidate="txtMail" ErrorMessage="Campo Requerido" ForeColor="#FF3300" ValidationGroup="mandanteGroup"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="LabelTelefono" runat="server" Text="Teléfono:"></asp:Label></td>
                <td>
                    <asp:TextBox ID="txtTelefono" runat="server" MaxLength="9" CssClass="form-control col-md-6" ForeColor="Black" style="left: 0px; top: 0px"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtTelefono" ErrorMessage="Ingresar solo números" ForeColor="#FF3300" ValidationExpression="^[0-9]*$" Display="Dynamic" ValidationGroup="mandanteGroup"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="LabelDireccion" runat="server" Text="Direccion:"></asp:Label></td>
                <td>
                    <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-control col-md-6"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorDireccion" runat="server" ControlToValidate="txtDireccion" ErrorMessage="Campo Requerido" ForeColor="#FF3300" ValidationGroup="mandanteGroup"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnRegistrar" runat="server" CssClass="btn btn-primary" Text="Guardar Contrato" OnClick="btnRegistrar_Click" ValidationGroup="mandanteGroup"></asp:Button></td>
            </tr>
            <tr>
                <td colspan="5">
                    <asp:Label ID="LabelAviso" runat="server" Text=""></asp:Label></td>
            </tr>
        </table>
        </center>
        </div>
    </div>
</asp:Content>

