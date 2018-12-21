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
        <div class="col-xs-12">
            <h2>Nuevo paquete de viaje</h2>
            <p>Completa los campos para añadir un paquete de viaje a un contrato.</p>
            <br />
        </div>
    </div>
    <div class="row">
        <div class="col-xs-9">
            <div class="row">
                <div class="col-xs-12">
                    <asp:Label ID="origen" runat="server" Text="Origen"></asp:Label>
                </div>
                <div class="col-xs-4">
                    <asp:TextBox ID="txtTerminalOrigen" runat="server" CssClass="form-control" placeholder="Terminal (Opcional)"></asp:TextBox>
                </div>
                <div class="col-xs-4">
                    <asp:TextBox ID="txtCiudadOrigen" runat="server" CssClass="form-control" placeholder="Ciudad"></asp:TextBox>
                    <asp:RequiredFieldValidator ControlToValidate="txtCiudadOrigen" ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" ValidationGroup="cargarGroup"></asp:RequiredFieldValidator>
                </div>
                <div class="col-xs-4">
                    <asp:TextBox ID="txtPaisOrigen" runat="server" CssClass="form-control" placeholder="País"></asp:TextBox>
                    <asp:RequiredFieldValidator ControlToValidate="txtPaisOrigen" ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red" ValidationGroup="cargarGroup"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12">
                    <asp:Label ID="Label1" runat="server" Text="Destino"></asp:Label>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-4">
                    <asp:TextBox ID="txtTerminalDestino" runat="server" CssClass="form-control" placeholder="Terminal (Opcional)"></asp:TextBox>
                </div>
                <div class="col-xs-4">
                    <asp:TextBox ID="txtCiudadDestino" runat="server" CssClass="form-control" placeholder="Ciudad"></asp:TextBox>
                    <asp:RequiredFieldValidator ControlToValidate="txtCiudadDestino" ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ForeColor="Red" ValidationGroup="cargarGroup"></asp:RequiredFieldValidator>
                </div>
                <div class="col-xs-4">
                    <asp:TextBox ID="txtPaisDestino" runat="server" CssClass="form-control" placeholder="País"></asp:TextBox>
                    <asp:RequiredFieldValidator ControlToValidate="txtPaisDestino" ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ForeColor="Red" ValidationGroup="cargarGroup"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-4">
                    <asp:Label ID="Label8" runat="server" Text="Pasajeros"></asp:Label>
                    <asp:TextBox ID="txtPasajeros" runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ControlToValidate="txtPasajeros" ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ForeColor="Red" ValidationGroup="cargarGroup"></asp:RequiredFieldValidator>
                </div>
                <div class="col-xs-4">
                    <asp:Label ID="LabelTipoTransporte" runat="server" Text="Tipo de transporte"></asp:Label>
                    <asp:DropDownList ID="DropDownListTipoTransporte" runat="server" CssClass="form-control" AutoPostBack="True" Width="200px">
                        <asp:ListItem Value="1">Bus</asp:ListItem>
                        <asp:ListItem Value="2">Vuelo</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12">
                    <asp:Button ID="ButtonCargar" runat="server" CssClass="btn btn-primary" OnClick="ButtonCargar_Click" Text="Cargar" Height="29px" Width="71px" ValidationGroup="cargarGroup" />
                    <asp:Button ID="ButtonEliminar" runat="server" CssClass="btn btn-primary"  Height="29px" Width="71px" Text="Eliminar" OnClick="ButtonEliminar_Click" />
                </div>
            </div>
        </div>
        <div class="col-xs-3">
            <div class="row">
                <div class="col-xs-12">
                    <asp:Label ID="Label7" runat="server" Text="Salida"></asp:Label>
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
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12">
            <div class="separador"></div>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-9">
            <div class="row">
                <div class="col-xs-3">
                    <asp:Label ID="Label13" runat="server" Text="Seleccionar hora de salida"></asp:Label>
                </div>
                <div class="col-xs-9">
                    <asp:DropDownList ID="DDLHoraSalida" runat="server" AutoPostBack="True" CssClass="form-control" Enabled="False" OnSelectedIndexChanged="DDLHoraSalida_SelectedIndexChanged"><asp:ListItem Value="0000">Seleccionar Fecha</asp:ListItem></asp:DropDownList>
                </div>
            </div>
            <div class="row  margin-top-20">
                <div class="col-xs-3">
                    <asp:Label ID="Label2" runat="server" Text="Estadía"></asp:Label>
                </div>
                <div class="col-xs-9">
                    <asp:DropDownList ID="DropDownListEstadia" runat="server" CssClass="form-control" AutoPostBack="True" Enabled="False" DataTextField="h_nombre" DataValueField="h_id" OnSelectedIndexChanged="DropDownListEstadia_SelectedIndexChanged"><asp:ListItem>Seleccionar Estadia</asp:ListItem><asp:ListItem Value="0000">Sin Estadía</asp:ListItem></asp:DropDownList>
                </div>
            </div>
            <div class="row  margin-top-20">
                <div class="col-xs-3">
                    <asp:Label ID="Label3" runat="server" Text="Seguros"></asp:Label>
                </div>
                <div class="col-xs-9">
                    <asp:DropDownList ID="DropDownListSeguros" runat="server" CssClass="form-control" AutoPostBack="True"  Enabled="False" OnSelectedIndexChanged="DropDownListSeguros_SelectedIndexChanged"><asp:ListItem>Seleccionar Seguro</asp:ListItem></asp:DropDownList>
                </div>
            </div>
        </div>
        <div class="col-xs-3 border-left-separador">
            <div class="row">
                <div class="col-xs-12">
                    <asp:Label ID="Label4" runat="server" Text="Seleccionar contrato:"></asp:Label>
                    <asp:DropDownList ID="DropDownListContrato" runat="server" CssClass="form-control" DataSourceID="SqlDataSourceContrato" DataTextField="Titular" DataValueField="ID_CONTRATO" Enabled="False"><asp:ListItem>Seleccionar Contrato</asp:ListItem></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceContrato" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select 'Contrato N°: '||id_contrato || ' -  Mandante: ' || numrut_cli_titular Titular, id_contrato, fecha_inicio, fecha_termino, meta, monto_reserva, estado, numrut_emp, numrut_cli_titular from contrato ORDER BY id_contrato"></asp:SqlDataSource><br />
                </div>
                <div class="col-xs-12">
                    <asp:Label ID="Label11" runat="server" Text="Precio total"></asp:Label>
                    <h4><asp:Label ID="lblPrecio" runat="server" Text="$0"></asp:Label></h4>
                    <asp:TextBox ID="txtPrecioTemp" runat="server" Visible="False"></asp:TextBox>
                </div>
                <div class="col-xs-12">
                    <asp:Button ID="ButtonRegistrar" runat="server" CssClass="btn btn-success" Text="Registrar" OnClick="ButtonRegistrar_Click" Visible="False" />
                </div>
            </div>
        </div>
    </div>
</div>        
<div class="modal fade" id="modalMensaje" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="display: none;">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <asp:Label ID="lblModalTitulo" Text="" runat="server" CssClass="modal-title"></asp:Label>
            </div>
            <div class="modal-body">
                <asp:Label ID="lblModalMensaje" Text="" runat="server" />
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>
</div>
</asp:Content>

