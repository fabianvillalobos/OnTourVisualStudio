<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="~/Controller/ModificarContrato.aspx.cs" Inherits="View_ModificarContrato" EnableEventValidation="false" %>
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
            <asp:LinkButton ID="btnModificar" CssClass="btn btn-success" runat="server" OnClick="btnModificar_Click"><i class="glyphicon glyphicon-floppy-disk"></i> Modificar</asp:LinkButton>
            <asp:Label ID="LabelAviso" runat="server" Text=""></asp:Label>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12">
            <div class="separador"></div>
        </div>
    </div>
    <div class='row'>
        <div class='col-xs-12'>
            <h3>Pasajeros <a href="AgregarCliente.aspx?ID_CONTRATO=<%=Request.QueryString["ID_CONTRATO"] %>" class="btn btn-success progreso btn-editar"><i class='glyphicon glyphicon-plus'></i> <span>Añadir pasajero</span></a></h3>
            <p>Listado de pasajeros inscritos en el viaje</p>
        </div>
    </div>
    <div class="row">
        
    <asp:Repeater runat="server" ID="repeaterPasajeros">
        <ItemTemplate>
            <div class="col-xs-4">
                <div class="pasajero">
                    <span class="rut"><%#Eval("Cliente.NUMRUT_CLI") %>-<%#Eval("Cliente.DRUT_CLI") %></span>
                    <h5><%#Eval("Cliente.NOMBRE_CLIE") %> <%#Eval("Cliente.APELLIDO_PAT_CLI") %> <%#Eval("Cliente.APELLIDO_MAT_CLI") %></h5>
                    <div class="opciones">
                        <asp:Button runat="server" ID="btnDeleteEmployee" CommandArgument='<%#Eval("Cliente.NUMRUT_CLI") %>' Text="Borrar" OnCommand="btnDelete_Command" class="btn btn-danger progreso btn-borrar"  />
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
        <asp:Panel ID="PanelPasajeros" runat="server"></asp:Panel>
    </div>

    <div class="row">
        <div class="col-xs-12">
            <div class="separador"></div>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12">
            <h3>Paquetes turísticos <a href="AgregarPaqueteViaje.aspx?ID_CONTRATO=<%=Request.QueryString["ID_CONTRATO"] %>" class="btn btn-success progreso btn-editar"><i class='glyphicon glyphicon-plus'></i> <span>Añadir paquete turístico</span></a></h3>
            <p>Listado de paquetes turísticos asignados al contrato</p>
        </div>
    </div>
        
    <asp:Label ID="idcontrato" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Panel ID="PaquetesContratados" runat="server"></asp:Panel>
</div>

    <div class="modal fade" id="modalQuitarPasajero" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" Style="display: none;">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h3 class="modal-title" id="myModalLabel">¡Atención!</h3>
          </div>
          <div class="modal-body">
            Estás apunto de quitar de este contrato al pasajero: <asp:Label ID="datosPasajero" Text="" runat="server" />, ¿Deseas continuar?
          </div>
          <div class="modal-footer">
            <asp:HiddenField ID="idPasajero" runat="server" Value="0" />
            <asp:Button ID="btnYes" runat="server" Text="Eliminar" OnClick="QuitarPasajero" class="btn btn-danger"></asp:Button>
            <button id="btnNo" runat="server" class="btn btn-default">Cancelar</button>
          </div>
        </div>
      </div>
    </div><!-- modal --> 

    <div class="modal fade" id="modalQuitarPaquete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" Style="display: none;">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h3 class="modal-title">¡Atención!</h3>
          </div>
          <div class="modal-body">
            Estás apunto de quitar de este contrato el paquete turístico seleccionado, ¿Deseas continuar?
          </div>
          <div class="modal-footer">
            <asp:HiddenField ID="idPaqueteTuristico" runat="server" Value="0" />
            <asp:Button ID="QuitarPaquete" runat="server" Text="Eliminar" OnClick="QuitarPaquete_Click" class="btn btn-danger"></asp:Button>
            <button id="Button2" runat="server" class="btn btn-default">Cancelar</button>
          </div>
        </div>
      </div>
    </div>
<!-- modal -->
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