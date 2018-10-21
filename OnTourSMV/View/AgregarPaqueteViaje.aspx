<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="~/Controller/AgregarPaqueteViaje.aspx.cs" Inherits="AgregarPaqueteViaje" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container">
        <div class="row">
            <h2>Paquete De Viaje</h2>
            <table style="width:100%;">
                <tr>
                    <td>
                        <asp:Label ID="Label6" runat="server" Text="Origen"></asp:Label>

                    </td>
                     <td>
                         <asp:TextBox ID="txtOrigen" runat="server"></asp:TextBox>
                     </td> 
                </tr>
                <tr>
                    <td><asp:Label ID="Label5" runat="server" Text="Destino"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtDestino" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td><asp:Label ID="Label7" runat="server" Text="Salida"></asp:Label></td>
                    <td>
                        <asp:Calendar ID="CalendarSalida" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="127px" Width="160px">
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
                    <td><asp:Label ID="Label8" runat="server" Text="Pasajeros"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtPasajeros" runat="server" TextMode="Number"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="ButtonCargar" runat="server" OnClick="ButtonCargar_Click" Text="Cargar" />
                    </td>
                </tr>

                <tr>
                    <td>
                        <asp:Label ID="LabelViajeVuelo" runat="server" Text="Viaje por vuelo"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownListViajeVuelo" runat="server" AutoPostBack="True" DataTextField="destino" DataValueField="id">
                        </asp:DropDownList>
                        <asp:ObjectDataSource ID="ObjectDataSourceViajeVuelo" runat="server" SelectMethod="getVuelos" TypeName="localhost.wsproveedores">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="txtOrigen" Name="origen" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="txtDestino" Name="destino" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="CalendarSalida" Name="salida" PropertyName="SelectedDate" Type="DateTime" />
                                <asp:ControlParameter ControlID="txtPasajeros" Name="pasajeros" PropertyName="Text" Type="Int32" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td><asp:Label ID="LabelViajeBus" runat="server" Text="Viaje por bus"></asp:Label></td>
                    <td><asp:DropDownList ID="DropDownListViajeBus" runat="server" AutoPostBack="True">
                        </asp:DropDownList></td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="Estadía"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownListEstadia" runat="server" AutoPostBack="True">
                        </asp:DropDownList>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="Seguros"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownListSeguros" runat="server" AutoPostBack="True"  DataTextField="se_nombre" DataValueField="se_id">
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
                        <asp:DropDownList ID="DropDownListContrato" runat="server" DataSourceID="SqlDataSourceContrato" DataTextField="NUMRUT_CLI_TITULAR" DataValueField="ID_CONTRATO"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSourceContrato" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;CONTRATO&quot;"></asp:SqlDataSource>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                      
                    </td>
                    <td>
                        <asp:Button ID="ButtonRegistrar" runat="server" Text="Registrar" OnClick="ButtonRegistrar_Click" />
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

