<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="~/Controller/ModificarContrato.aspx.cs" Inherits="View_ModificarContrato" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
    <div class="row">
        <div class="col-xs-12">
            <h2>Contrato N°<%=Request.QueryString["ID_CONTRATO"] %></h2>
            <br />
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12">
            <asp:GridView ID="GridViewContratos" runat="server" CssClass="table table-bordered" DataSourceID="LinqDataSourceListarContratos" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="ID_CONTRATO" HeaderText="ID" SortExpression="ID_CONTRATO" />
                    <asp:BoundField DataField="FECHA_INICIO" HeaderText="Fecha Inicio" SortExpression="FECHA_INICIO" DataFormatString='{0:MM-dd-yyyy}' />
                    <asp:BoundField DataField="FECHA_TERMINO" HeaderText="Fecha Termino" SortExpression="FECHA_TERMINO" DataFormatString='{0:MM-dd-yyyy}' />
                    <asp:BoundField DataField="META" HeaderText="Meta" SortExpression="META" DataFormatString='${0:#,0}' />
                    <asp:BoundField DataField="MONTO_RESERVA" HeaderText="Monto Reserva" SortExpression="MONTO_RESERVA" DataFormatString='${0:#,0}' />
                    <asp:TemplateField HeaderText="Estado" SortExpression="Estado">
                        <ItemTemplate>
                            <asp:Label Visible='<%# Eval("Estado").ToString().Equals("P") %>' Text="<div class='progreso btn-primary'>En Progreso</div>" runat="server" />
                            <asp:Label Visible='<%# Eval("Estado").ToString().Equals("T") %>' Text="<div class='progreso btn-success'>Terminado</div>" runat="server" />
                            <asp:Label Visible='<%# Eval("Estado").ToString().Equals("F") %>' Text="<div class='progreso btn-danger'>Cancelado</div>" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="NUMRUT_EMP" HeaderText="Rut Empleado" SortExpression="NUMRUT_EMP" />
                    <asp:BoundField DataField="NUMRUT_CLI_TITULAR" HeaderText="Rut Titular" SortExpression="NUMRUT_CLI_TITULAR" />
                </Columns>
            </asp:GridView>
            <asp:LinqDataSource ID="LinqDataSourceListarContratos" runat="server" ContextTypeName="EntitiesOnTour" EntityTypeName="" TableName="CONTRATO" AutoGenerateOrderByClause="True" Where="ID_CONTRATO == @ID_CONTRATO">
                <WhereParameters>
                    <asp:QueryStringParameter Name="ID_CONTRATO" QueryStringField="ID_CONTRATO" Type="Int32" />
                </WhereParameters>
            </asp:LinqDataSource>
        </div>
    </div>
    <div class="row margin-top-20">
        <div class="col-xs-3">
            <asp:Label ID="Label1" runat="server" Text="ID Contrato:"></asp:Label>
            <asp:TextBox ID="txtIdContrato" runat="server" ReadOnly="True" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-xs-3">
            <asp:Label ID="LabelFecInicio" runat="server" Text="Fecha Inicio:"></asp:Label>
            <asp:TextBox ID="txtInicio" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-xs-3">
            <asp:Label ID="LabelFecTermino" runat="server" Text="Fecha Termino:"></asp:Label>
            <asp:TextBox ID="txtFin" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-xs-3">
            <asp:Label ID="LabelMeta" runat="server" Text="Meta:"></asp:Label>
            <asp:TextBox ID="txtMeta" runat="server" CssClass="form-control" TextMode="Number" MaxLength="9" Rows="1" ReadOnly="True">0</asp:TextBox>
        </div>
    </div>
    <div class="row margin-top-20">
        <div class="col-xs-3">
            <asp:Label ID="LabelMonto" runat="server" Text="Monto:"></asp:Label>
            <asp:TextBox ID="txtMonto" runat="server" CssClass="form-control" TextMode="Number" MaxLength="9" Rows="1" ReadOnly="True">0</asp:TextBox>
        </div>
        <div class="col-xs-3">
            <asp:Label ID="LabelEstado" runat="server" Text="Estado:"></asp:Label>
            <asp:DropDownList ID="DropDownListEstado" runat="server" CssClass="form-control" AutoPostBack="True">
                <asp:ListItem Value="P">En Progreso</asp:ListItem>
                <asp:ListItem Value="F">Cancelado</asp:ListItem>
                <asp:ListItem Value="T">Completado</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="col-xs-3">
            <asp:Label ID="LabelEmpleado" runat="server" Text="Empleado:"></asp:Label>
            <asp:DropDownList ID="DropDownListEmpleado" runat="server" CssClass="form-control" DataSourceID="SqlDataSource1" DataTextField="Empleados" DataValueField="NUMRUT_EMP"></asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT NUMRUT_EMP || '-' || DRUT_EMP || ' | ' || NOMBRE_EMP || ' ' || APELLIDO_PAT_EMP || ' ' || APELLIDO_MAT_EMP Empleados, NUMRUT_EMP, NOMBRE_EMP FROM EMPLEADO"></asp:SqlDataSource>
        </div>
        <div class="col-xs-3">
            <asp:Label ID="LabelTitular" runat="server" Text="Titular"></asp:Label>
            <asp:DropDownList ID="DropDownListTitular" runat="server" CssClass="form-control" DataSourceID="SqlDataSource2" DataTextField="Clientes" DataValueField="NUMRUT_CLI">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT NUMRUT_CLI || '-' || DRUT_CLI || ' | ' || NOMBRE_CLIE || ' ' || APELLIDO_PAT_CLI || ' ' || APELLIDO_MAT_CLI Clientes, NUMRUT_CLI, NOMBRE_CLIE FROM CLIENTE">
            </asp:SqlDataSource>
        </div>
    </div>
    <div class="row margin-top-20">
        <div class="col-xs-12">
            <asp:Button ID="btnCargar" CssClass="btn btn-primary" runat="server" Text="Cargar Datos" OnClick="btnCargar_Click"></asp:Button>
            <asp:Button ID="btnModificar" CssClass="btn btn-success" runat="server" Text="Modificar" OnClick="btnModificar_Click"></asp:Button>
            <asp:Label ID="LabelAviso" runat="server" Text=""></asp:Label>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12">
            <div class="separador"></div>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12">
            <h3>Paquetes turísticos</h3>
            <p>Listado de paquetes turísticos asignados al contrato</p>
        </div>
    </div>
    <div class="row bg-paquete">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-encabezado">
                    <h3><i class="glyphicon glyphicon-plane"> </i>Viaje a Pucón</h3>
                </div>
                <div class="box-cuerpo">
                    <div class="col-xs-2"><span class="aerolinea">LA</span><br /><span>Vuelo: N20</span></div>
                    <div class="col-xs-3">
                        <span class="terminal">AEROPUERTO INTERNACIONAL COMODORO ARTURO MERINO BENITEZ</span>
                        <span class="ciudad">Santiago, Chile</span>
                        <span class="hora">18:00:00</span>
                        <span class="salida">28/06/2018</span>
                    </div>
                    <div class="col-xs-1">></div>
                    <div class="col-xs-3">
                        <span class="terminal">AERODROMO DE PUCON</span>
                        <span class="ciudad">Pucón, Chile</span>
                        <span class="hora">18:00:00</span>
                        <span class="salida">28/06/2018</span>
                    </div>
                </div>
            </div>

            <div class="box">
                <div class="box-encabezado">
                    <h3><i class="glyphicon glyphicon-bed"> </i>Estadía en Pucón</h3>
                </div>
                <div class="box-cuerpo">
                    <div class="col-xs-2"><span class="aerolinea">PU</span><br /><span>Vuelo: N20</span></div>
                    <div class="col-xs-3">
                        <span class="terminal">Hotel Gala</span>
                        <span class="ciudad">Valle nevado #7252, Bombai</span>
                    </div>
                    <div class="col-xs-7">
                        <h5>Servicios disponibles</h5>
                        <span class="descripcion_estadia">Wifi, Aire acondicionado, Piscina, Estacionamiento</span>
                    </div>
                </div>
            </div>

            <div class="box">
                <div class="box-encabezado">
                    <h3><i class="glyphicon glyphicon-lock"> </i>Seguros</h3>
                </div>
                <div class="box-cuerpo">
                    <div class="col-xs-2"><span class="aerolinea">PU</span><br /><span>Vuelo: N20</span></div>
                    <div class="col-xs-3">
                        <span class="terminal">Asistencia Estándar Internacional</span>
                        <span class="ciudad">Assist Card</span>
                        <span>Vigencia: 2019-11-10T00:00:00</span>
                    </div>
                    <div class="col-xs-7">
                        <h5>Descripción</h5>
                        <span class="descripcion_estadia">Asistencia médica hasta Europa: €30.000 | LATAM: U$S10.000 | Resto: U$S30.000. Indemnización por pérdida del equipaje. Reembolso de gastos extras por cancelación o demora involuntaria del vuelo</span>
                    </div>
                </div>
            </div>

            <asp:Label ID="idcontrato" runat="server" Text="" Visible="false"></asp:Label>
            
            <asp:Panel ID="PaquetesContratados" runat="server"></asp:Panel>
        </div>
    </div>
</div>


</asp:Content>