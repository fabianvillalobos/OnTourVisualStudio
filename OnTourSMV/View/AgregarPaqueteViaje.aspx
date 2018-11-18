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
                        <asp:DropDownList ID="DropDownListTipoTransporte" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="DropDownListTipoTransporte_SelectedIndexChanged" Width="200px">
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
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label13" runat="server" Text="Seleccionar hora de salida"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="DDLHoraSalida" runat="server" DataSourceID="ODSFechaViajeBuses" DataTextField="CompletedSynchronously" DataValueField="CompletedSynchronously" AutoPostBack="True"></asp:DropDownList>
                        <asp:ObjectDataSource ID="ODSFechaViajeBuses" runat="server" SelectMethod="getBuses" TypeName="localhost.wsproveedores">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="txtTerminalOrigen" Name="origen_terminal" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="txtCiudadOrigen" Name="origen_ciudad" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="txtPaisOrigen" Name="origen_pais" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="txtTerminalDestino" Name="destino_terminal" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="txtCiudadDestino" Name="destino_ciudad" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="txtPaisDestino" Name="destino_pais" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="CalendarSalida" Name="salida" PropertyName="SelectedDate" Type="DateTime" />
                                <asp:ControlParameter ControlID="txtPasajeros" Name="pasajeros" PropertyName="Text" Type="Int32" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                        <asp:ObjectDataSource ID="ODSFechaViajeVuelo" runat="server" SelectMethod="getVuelos" TypeName="localhost.wsproveedores">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="txtTerminalOrigen" Name="origen_terminal" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="txtCiudadOrigen" Name="origen_ciudad" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="txtPaisOrigen" Name="origen_pais" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="txtTerminalDestino" Name="destino_terminal" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="txtCiudadDestino" Name="destino_ciudad" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="txtPaisDestino" Name="destino_pais" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="CalendarSalida" Name="salida" PropertyName="SelectedDate" Type="DateTime" />
                                <asp:ControlParameter ControlID="txtPasajeros" Name="pasajeros" PropertyName="Text" Type="Int32" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
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
                        <asp:Label ID="LabelViajeVuelo" runat="server" Text="Viaje por vuelo (Fecha)" Visible="False"></asp:Label>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="LabelViajeBus" runat="server" Text="Viaje por bus (Fecha)"></asp:Label></td>
                    <td>
                        &nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label2" runat="server" Text="Estadía"></asp:Label>
                    </td>
                    <td class="auto-style2">
                        
                        <asp:DropDownList ID="DropDownListEstadia" runat="server" CssClass="form-control" AutoPostBack="True" Enabled="False" DataTextField="h_nombre" DataValueField="h_id">
                        </asp:DropDownList>
                        <asp:ObjectDataSource ID="ObjectDataSourceEstadia" runat="server" SelectMethod="getAlojamientos" TypeName="localhost.wsproveedores">
                            <SelectParameters>
                                
                                <asp:ControlParameter ControlID="txtPasajeros" Name="habitacion" PropertyName="Text" Type="Int32" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </td>
                    <td class="auto-style2">&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="Seguros"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownListSeguros" runat="server" CssClass="form-control" AutoPostBack="True" DataTextField="se_nombre" DataValueField="se_id" Enabled="False">
                        </asp:DropDownList>

                        <asp:ObjectDataSource ID="ObjectDataSourceSeguros" runat="server" SelectMethod="getSeguros" TypeName="localhost.wsproveedores"></asp:ObjectDataSource>

                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="Contrato"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownListContrato" runat="server" CssClass="form-control" DataSourceID="SqlDataSourceContrato" DataTextField="NUMRUT_CLI_TITULAR" DataValueField="ID_CONTRATO" Enabled="False"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSourceContrato" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;CONTRATO&quot;"></asp:SqlDataSource>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="ButtonRegistrar" runat="server" CssClass="btn btn-success" Text="Registrar" OnClick="ButtonRegistrar_Click" />
                        <br />
                        <asp:Label ID="LabelAviso" runat="server"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <br />

            <!-- Descripcion, Valor, Activo, Fecha de Creacion -->
        </div>
    </div>
</asp:Content>

