<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="~/Controller/ClienteDetalleContrato.aspx.cs" Inherits="ClienteDetalleContrato" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
    <div class="row">
        <div class="col-xs-9">
            <h2>Contrato N°<%=Request.QueryString["ID_CONTRATO"] %></h2>
            <br />
        </div>
        <div class="col-xs-3 padding-top-20">
            <asp:Button ID="btnVolver" runat="server" Text="Volver a Contratos" CssClass="btn btn-defaut" OnClick="btnVolverAContratos_Click" CausesValidation="false" formnovalidate  />
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
    <div class="row">
        <div class="col-xs-12">
            <div class="separador"></div>
        </div>
    </div>
    <div class='row'>
        <div class='col-xs-12'>
            <h3>Pasajeros</h3>
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
            <h3>Paquetes turísticos</h3>
            <p>Listado de paquetes turísticos asignados al contrato</p>
        </div>
    </div>
    <asp:Label ID="idcontrato" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Panel ID="PaquetesContratados" runat="server"></asp:Panel>
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