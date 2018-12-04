<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" EnableEventValidation="false" AutoEventWireup="true" CodeFile="~/Controller/ListarContratos.aspx.cs" Inherits="ListarContratos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="row">
            <div class="col-xs-6">
                <h2>Contratos</h2>
                <br />
            </div>
            <div class="col-xs-6 text-right padding-top-20">
                <asp:Button ID="btnNuevoContrato" runat="server" CssClass="btn btn-primary" Text="Nuevo Contrato" OnClick="btnNuevoContrato_Click" />
                <asp:Button ID="btnExportar" runat="server" CssClass="btn btn-success" Text="Exportar PDF" OnClick="btnExportar_Click" />
            </div>
            <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered" EmptyDataText="No Hay contratos asociados" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowPaging="True">
                <Columns>
                    <asp:BoundField DataField="ID_CONTRATO" HeaderText="ID" SortExpression="ID_CONTRATO" />
                    <asp:TemplateField HeaderText="Nombre Mandante" SortExpression="Nombre">
                        <ItemTemplate>
                            <asp:Label ID="Rut" runat="server" Text='<%#Eval("NOMBRE")+ " " + Eval("APELLIDO")%>' ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="FECHA_INICIO" HeaderText="Inicio" SortExpression="FECHA_INICIO" DataFormatString='{0:MM-dd-yyyy}'/>
                    <asp:BoundField DataField="TERMINO" HeaderText="Termino" SortExpression="TERMINO" DataFormatString='{0:MM-dd-yyyy}'/>
                    <asp:TemplateField HeaderText="Estado" SortExpression="Estado">
                        <ItemTemplate>
                            <asp:Label Visible='<%# Eval("Estado").ToString().Equals("P") %>' Text="<div class='progreso btn-primary'>En Progreso</div>" runat="server" />
                            <asp:Label Visible='<%# Eval("Estado").ToString().Equals("T") %>' Text="<div class='progreso btn-success'>Terminado</div>" runat="server" />
                            <asp:Label Visible='<%# Eval("Estado").ToString().Equals("F") %>' Text="<div class='progreso btn-danger'>Cancelado</div>" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="RESERVA" HeaderText="Reserva" SortExpression="RESERVA" DataFormatString='${0:#,0}' />
                    <asp:BoundField DataField="META" HeaderText="Meta" SortExpression="META" DataFormatString='${0:#,0}' />
                    <asp:BoundField DataField="SALDO" HeaderText="Saldo Pendiente" SortExpression="SALDO" DataFormatString='${0:#,0}' />
                    <asp:HyperLinkField HeaderText="Actividades" ControlStyle-CssClass="btn btn-success progreso btn-editar" DataNavigateUrlFields="ID_CONTRATO" DataNavigateUrlFormatString="ListarActividadesContrato.aspx?ID_CONTRATO={0}" Text="<i class='glyphicon glyphicon-pencil'></i> <span>Ver</span>" />
                    <asp:HyperLinkField HeaderText="Editar" ControlStyle-CssClass="btn btn-success progreso btn-editar" DataNavigateUrlFields="ID_CONTRATO" DataNavigateUrlFormatString="ModificarContrato.aspx?ID_CONTRATO={0}" Text="<i class='glyphicon glyphicon-pencil'></i> <span>Editar</span>" />
                    <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                            <asp:Button ID="btnDelete" runat="server" Text="Borrar" OnClick="btnDelete_Click" CommandArgument='<%# Eval("ID_CONTRATO") %>' class="btn btn-danger progreso btn-borrar"  />
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                </Columns>
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT ONTOUR.CONTRATO.ID_CONTRATO, ONTOUR.CLIENTE.NOMBRE_CLIE AS Nombre, ONTOUR.CLIENTE.APELLIDO_PAT_CLI AS Apellido, ONTOUR.CONTRATO.FECHA_INICIO, ONTOUR.CONTRATO.FECHA_TERMINO AS Termino, ONTOUR.CONTRATO.ESTADO AS Estado, ONTOUR.CONTRATO.MONTO_RESERVA AS Reserva, ONTOUR.CONTRATO.META AS Meta, ONTOUR.CUENTA.SALDO AS Saldo FROM ONTOUR.CONTRATO INNER JOIN ONTOUR.CLIENTE ON ONTOUR.CONTRATO.NUMRUT_CLI_TITULAR = ONTOUR.CLIENTE.NUMRUT_CLI INNER JOIN ONTOUR.EMPLEADO ON ONTOUR.CONTRATO.NUMRUT_EMP = ONTOUR.EMPLEADO.NUMRUT_EMP INNER JOIN ONTOUR.CUENTA ON ONTOUR.CONTRATO.ID_CONTRATO = ONTOUR.CUENTA.ID_CONTRATO AND ONTOUR.CLIENTE.NUMRUT_CLI = ONTOUR.CUENTA.NUMRUT_CLI" OnInit="cargarContratosPorCliente"></asp:SqlDataSource>
        </div>
    </div>
     <div class="modal fade" id="modalBorrarContrato" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" Style="display: none;">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h3 class="modal-title" id="myModalLabel">¡Atención!</h3>
          </div>
          <div class="modal-body">
            Estás apunto de eliminar el contrato n° <asp:Label ID="numeroContratoAEliminar" Text="" runat="server" />, ¿Deseas continuar?
          </div>
          <div class="modal-footer">
            <asp:HiddenField ID="hfDeleteEmployeeId" runat="server" Value="0" />
            <asp:Button ID="btnYes" runat="server" Text="Eliminar" OnClick="BorrarContratoAceptado" class="btn btn-danger"></asp:Button>
            <button id="btnNo" runat="server" class="btn btn-default">Cancelar</button>
          </div>
        </div>
      </div>
    </div><!-- modal -->   
</asp:Content>

