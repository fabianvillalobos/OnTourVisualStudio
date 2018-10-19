<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="~/Controller/AgregarContratos.aspx.cs" Inherits="AgregarContratos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>Nuevo Contrato</h1>
    <br />
    <br />
    <div>
        <center>
        <table style="width: 75%;">
            <tr>
                <td><asp:Label ID="LabelFecInicio" runat="server" Text="Fecha Inicio:"></asp:Label></td>
                <td><asp:TextBox ID="txtInicio" runat="server" TextMode="Date"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtInicio" ErrorMessage="Requerido" ForeColor="Red" ValidationGroup="contratoGroup"></asp:RequiredFieldValidator>
                </td>
                <td><asp:Label ID="LabelFecTermino" runat="server" Text="Fecha Termino:"></asp:Label></td>
                <td><asp:TextBox ID="txtFin" runat="server" TextMode="Date"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtFin" ErrorMessage="Requerido" ForeColor="Red" ValidationGroup="contratoGroup"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtInicio" ControlToValidate="txtFin" ErrorMessage="Rango No Valido" ForeColor="#FF3300" Operator="GreaterThan" ValidationGroup="contratoGroup"></asp:CompareValidator>
                </td>
            <tr>
                <td><asp:Label ID="LabelMeta" runat="server" Text="Meta:"></asp:Label></td>
                <td><asp:TextBox ID="txtMeta" runat="server" TextMode="Number" MaxLength="9" Rows="1" ReadOnly="True">0</asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtMeta" ErrorMessage="Requerido" ForeColor="Red" ValidationGroup="contratoGroup"></asp:RequiredFieldValidator>
                </td>
                <td><asp:Label ID="LabelReserva" runat="server" Text="Reserva:"></asp:Label></td>
                <td><asp:TextBox ID="txtMonto" runat="server" TextMode="Number" MaxLength="9" Rows="1" ReadOnly="True">0</asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtMonto" ErrorMessage="Requerido" ForeColor="Red" ValidationGroup="contratoGroup"></asp:RequiredFieldValidator>
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
                <td colspan="2"><asp:DropDownList ID="DropDownListMandante" runat="server" DataSourceID="SqlDataSourceMandante" DataTextField="NOMBRE_CLIE" DataValueField="NUMRUT_CLI" AutoPostBack="True">
                    <asp:ListItem>Sin seleccionar</asp:ListItem>
                    </asp:DropDownList>
                    <asp:Button ID="ButtonCargarMandante" runat="server" Text="Cargar mandante" OnClick="ButtonCargarMandante_Click" ValidationGroup="contratoGroup" />
                    <asp:SqlDataSource ID="SqlDataSourceMandante" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;NUMRUT_CLI&quot;, &quot;NOMBRE_CLIE&quot; FROM &quot;CLIENTE&quot;"></asp:SqlDataSource>
                </td>
            </tr>
         
            
        </table>
    </center>
    </div>
    <div>
        <h1>Asignar Mandante </h1>
    </div>
    <div>
        <table class="auto-style4">
            
            <tr>
                <td class="auto-style7">
                    <asp:Label ID="LabelNomCliente" runat="server" Text="Nombre(s):"></asp:Label></td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorNombre" runat="server" ControlToValidate="txtNombre" ErrorMessage="Campo Requerido" ForeColor="#FF3300" ValidationGroup="mandanteGroup"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">
                    <asp:Label ID="LabelApPaterno" runat="server" Text="Apellido Paterno:"></asp:Label></td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtApellidoP" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorApellidoP" runat="server" ControlToValidate="txtApellidoP" ErrorMessage="Campo Requerido" ForeColor="#FF3300" ValidationGroup="mandanteGroup"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">
                    <asp:Label ID="LabelApMaterno" runat="server" Text="Apellido Materno:"></asp:Label></td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtApellidoM" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorApellidoM" runat="server" ControlToValidate="txtApellidoM" ErrorMessage="Campo Requerido" ForeColor="#FF3300" ValidationGroup="mandanteGroup"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">
                    <asp:Label ID="LabelRut" runat="server" Text="Rut:"></asp:Label></td>
                <td class="auto-style9">
                    <asp:TextBox ID="txtRut" runat="server" MaxLength="8"></asp:TextBox>
                    -<asp:TextBox ID="txtDv" runat="server" MaxLength="1"></asp:TextBox>
                    <!-- Validación rut Solo números del 0-9 -->
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorRut" runat="server" ControlToValidate="txtRut" Display="Dynamic" ErrorMessage="Campo Rut Requerido " ForeColor="#FF3300" ValidationGroup="mandanteGroup"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtRut" ErrorMessage="Rut No Valido" ForeColor="#FF3300" ValidationExpression="^[0-9]*$" Display="Dynamic" ValidationGroup="mandanteGroup"></asp:RegularExpressionValidator>
                    <!-- Validación DV Solo números del 0-9 y Letra K -->
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorDv" runat="server" ControlToValidate="txtDv" Display="Dynamic" ErrorMessage="Campo DV Requerido" ForeColor="#FF3300" ValidationGroup="mandanteGroup"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtDv" ErrorMessage="Digito No Valido" ForeColor="#FF3300" ValidationExpression="^[0-9_kK]*$" Display="Dynamic" ValidationGroup="mandanteGroup"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">
                    <asp:Label ID="LabelFecNacimiento" runat="server" Text="Fecha de Nacimiento:"></asp:Label></td>
                <td class="auto-style3">
                    <asp:Calendar ID="CalendarFechaNacimiento" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="58px" Width="171px">
                        <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                        <NextPrevStyle VerticalAlign="Bottom" />
                        <OtherMonthDayStyle ForeColor="#808080" />
                        <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                        <SelectorStyle BackColor="#CCCCCC" />
                        <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                        <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                        <WeekendDayStyle BackColor="#FFFFCC" />
                    </asp:Calendar>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">
                    <asp:Label ID="LabelMail" runat="server" Text="Mail:"></asp:Label></td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtMail" runat="server" TextMode="Email" Width="177px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorMail" runat="server" ControlToValidate="txtMail" ErrorMessage="Campo Requerido" ForeColor="#FF3300" ValidationGroup="mandanteGroup"></asp:RequiredFieldValidator>
                </td>
            </tr>
           <tr>
                <td class="auto-style5">
                    <asp:Label ID="LabelTelefono" runat="server" Text="Teléfono:"></asp:Label></td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtTelefono" runat="server" MaxLength="9"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorTelefono" runat="server" ControlToValidate="txtTelefono" Display="Dynamic" ErrorMessage="Campo Requerido" ForeColor="#FF3300" ValidationGroup="mandanteGroup"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtTelefono" ErrorMessage="Ingresar solo números" ForeColor="#FF3300" ValidationExpression="^[0-9]*$" Display="Dynamic" ValidationGroup="mandanteGroup"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">
                    <asp:Label ID="LabelDireccion" runat="server" Text="Direccion:"></asp:Label></td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtDireccion" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorDireccion" runat="server" ControlToValidate="txtDireccion" ErrorMessage="Campo Requerido" ForeColor="#FF3300" ValidationGroup="mandanteGroup"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td><asp:Button ID="btnRegistrar" runat="server" Text="Guardar Contrato" OnClick="btnRegistrar_Click" ValidationGroup="mandanteGroup"></asp:Button></td>
            </tr>
            <tr>
                <td><asp:Label ID="LabelAviso" runat="server" Text=""></asp:Label></td>
            </tr>
            
            
        </table>
    </div>
</asp:Content>

