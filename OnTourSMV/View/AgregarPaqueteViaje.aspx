<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="~/Controller/AgregarPaqueteViaje.aspx.cs" Inherits="AgregarPaqueteViaje" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            height: 21px;
        }

        .auto-style2 {
            height: 22px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container">
        <div class="row">
            <h2>Paquete De Viaje</h2>
            <table>
                <tr>
                    <td class="auto-style1">
                        <asp:Label ID="LabelTipoTransporte" runat="server" Text="Tipo de transporte"></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:DropDownList ID="DropDownListTipoTransporte" runat="server" CssClass="form-control" AutoPostBack="True" Width="200px">
                            <asp:ListItem Value="1">Bus</asp:ListItem>
                            <asp:ListItem Value="2">Vuelo</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td><asp:Label ID="Label1" runat="server" Text="Ciudad"></asp:Label></td>
                    <td></td>
                    <td><asp:Label ID="Label9" runat="server" Text="Pais"></asp:Label></td>
                    <td></td>
                    <td><asp:Label ID="Label10" runat="server" Text="Terminal"></asp:Label></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label6" runat="server" Text="Origen"></asp:Label>

                    </td>
                    <td>
                        <asp:TextBox ID="txtCiudadOrigen" runat="server" CssClass="form-control" Width="200px"></asp:TextBox> 
                    </td>
                    <td style="height:10px">
                        <asp:RequiredFieldValidator ControlToValidate="txtCiudadOrigen" ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" ValidationGroup="cargarGroup"></asp:RequiredFieldValidator>
                        
                    </td>
                    <td>
                        <asp:TextBox ID="txtPaisOrigen" runat="server" CssClass="form-control" Width="100px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ControlToValidate="txtPaisOrigen" ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red" ValidationGroup="cargarGroup"></asp:RequiredFieldValidator>
                    </td>
                    
                    <td>
                        <asp:TextBox ID="txtTerminalOrigen" runat="server" CssClass="form-control" Width="150px"></asp:TextBox>
                    </td>
                    
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text="Destino"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtCiudadDestino" runat="server" CssClass="form-control" Width="200px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ControlToValidate="txtCiudadDestino" ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ForeColor="Red" ValidationGroup="cargarGroup"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPaisDestino" runat="server" CssClass="form-control" Width="100px"></asp:TextBox>
                     </td>
                    <td>
                        <asp:RequiredFieldValidator ControlToValidate="txtPaisDestino" ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ForeColor="Red" ValidationGroup="cargarGroup"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="txtTerminalDestino" runat="server" CssClass="form-control" Width="150px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label7" runat="server" Text="Salida"></asp:Label></td>
                    <td>
                        <asp:Calendar ID="CalendarSalida" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="140px" Width="204px">
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
                    <td>
                        <asp:Label ID="Label8" runat="server" Text="Pasajeros"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtPasajeros" runat="server" TextMode="Number" CssClass="form-control" Width="199px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ControlToValidate="txtPasajeros" ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ForeColor="Red" ValidationGroup="cargarGroup"></asp:RequiredFieldValidator>
                        

                    </td>
                </tr>

                <tr>
                    <td>

                    </td>
                    <td>
                        <asp:Button ID="ButtonCargar" runat="server" CssClass="btn btn-primary" OnClick="ButtonCargar_Click" Text="Cargar" Height="29px" Width="71px" ValidationGroup="cargarGroup" />
                        <asp:Button ID="ButtonEliminar" runat="server" CssClass="btn btn-primary"  Height="29px" Width="71px" Text="Eliminar" OnClick="ButtonEliminar_Click" />
                    </td>
                </tr>
                
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
               
                <tr>
                    <td>
                        <asp:Label ID="Label13" runat="server" Text="Seleccionar hora de salida"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="DDLHoraSalida" runat="server" AutoPostBack="True" CssClass="form-control" Enabled="False" OnSelectedIndexChanged="DDLHoraSalida_SelectedIndexChanged">
                            <asp:ListItem Value="0000">Seleccionar Fecha</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label2" runat="server" Text="Estadía"></asp:Label>
                    </td>
                    <td class="auto-style2" colspan="5">
                        
                        <asp:DropDownList ID="DropDownListEstadia" runat="server" CssClass="form-control" AutoPostBack="True" Enabled="False" DataTextField="h_nombre" DataValueField="h_id" OnSelectedIndexChanged="DropDownListEstadia_SelectedIndexChanged">
                            <asp:ListItem>Seleccionar Estadia</asp:ListItem>
                            <asp:ListItem Value="0000">Sin Estadía</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style2">&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="Seguros"></asp:Label>
                    </td>
                    <td colspan="5">
                        <asp:DropDownList ID="DropDownListSeguros" runat="server" CssClass="form-control" AutoPostBack="True"  Enabled="False" OnSelectedIndexChanged="DropDownListSeguros_SelectedIndexChanged">
                            <asp:ListItem>Seleccionar Seguro</asp:ListItem>
                        </asp:DropDownList>

                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="Contrato"></asp:Label>
                    </td>
                    <td colspan="5">
                        <asp:DropDownList ID="DropDownListContrato" runat="server" CssClass="form-control" DataSourceID="SqlDataSourceContrato" DataTextField="NUMRUT_CLI_TITULAR" DataValueField="ID_CONTRATO" Enabled="False">
                            <asp:ListItem>Seleccionar Contrato</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSourceContrato" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;CONTRATO&quot;"></asp:SqlDataSource>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label11" runat="server" Text="Precio total"></asp:Label></td>
                    <td>
                        <asp:Label ID="lblPrecio" runat="server" Text="$0"></asp:Label></td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txtPrecioTemp" runat="server" Visible="False"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="ButtonRegistrar" runat="server" CssClass="btn btn-success" Text="Registrar" OnClick="ButtonRegistrar_Click" Visible="False" />
                        <br />
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <br />

            <!-- Descripcion, Valor, Activo, Fecha de Creacion -->
        </div>
    </div>
</asp:Content>

