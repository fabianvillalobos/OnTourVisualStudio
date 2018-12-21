<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="~/Controller/AgregarActividad.aspx.cs" Inherits="AgregarActividad" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <h2>Nueva Actividad</h2>
                <br />
            </div>
        </div>
        <div class="row">
            <div class="col-xs-6">
                <asp:Label ID="lblDescripcion" runat="server" Text="Descripción:"></asp:Label>
                <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtDescripcion" ErrorMessage="Requerido" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                     </div>
            </div>
        <div class="row">
            <div class="col-xs-3">
                <asp:Label ID="lblDropDownListTipoActividad" runat="server" Text="Tipo de Actividad:"></asp:Label>
                <asp:DropDownList ID="DropDownListTipoActividad" runat="server" CssClass="form-control" DataSourceID="SqlDataSourceTipoActividad" DataTextField="DESC_TIPO_ACT" DataValueField="ID_TIPO_ACTIIVIDAD">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSourceTipoActividad" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;TIPO_ACTIVIDAD&quot;"></asp:SqlDataSource>
             </div>
            
            <div class="col-xs-3">
                <asp:Label ID="LabelFecActividad" runat="server" Text="Fecha de Actividad:"></asp:Label>
               <asp:TextBox ID="txtFechaActividad" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtFechaActividad" ErrorMessage="Requerido" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                   
            </div>
            
        </div>

        <div class="row">
            <div class="col-xs-3">
                <asp:Label ID="LabelActivo" runat="server" Text="Activo:"></asp:Label>
                <asp:DropDownList ID="DropDownListActivo" runat="server" CssClass="form-control" AutoPostBack="True">
                            <asp:ListItem Value="T">Activo</asp:ListItem>
                            <asp:ListItem Value="F">No Activo</asp:ListItem>
                        </asp:DropDownList>
            </div>

            
                <div class="col-xs-3">
                        <asp:Label ID="LabelContRelacionado" runat="server" Text="Contrato Relacionado:"></asp:Label>
                        <asp:DropDownList ID="DropDownListContratoRela" runat="server" CssClass="form-control" DataSourceID="ContratoRelacionado" DataTextField="ID_CONTRATO" DataValueField="ID_CONTRATO">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="ContratoRelacionado" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;ID_CONTRATO&quot; FROM &quot;CONTRATO&quot;"></asp:SqlDataSource>
                </div>
                
            </div>
            <div class="row margin-top-20">

                <div class="col-xs-3">
                <asp:Label ID="LabelMonto" runat="server" Text="Monto:"></asp:Label>
                  <asp:TextBox ID="txtMonto" runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox>
                  <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtMonto" ErrorMessage="Monto No Valido" ForeColor="#FF3300" MaximumValue="999999999" MinimumValue="0" Type="Currency"></asp:RangeValidator>              
                </div>

                <div class="col-xs-3 padding-top-20">
                     <asp:Button ID="btnAgregar" runat="server" Text="Agregar" CssClass="btn btn-primary" OnClick="btnAgregar_Click" />
                </div>

                <div class="col-xs-3 padding-top-20">
                     <asp:Button ID="btnVolver" runat="server" Text="Volver a Actividades" CssClass="btn btn-defaut" OnClick="btnVolverAActividades_Click" />
                </div>

                <div class="col-xs-3 padding-top-20">
                     <asp:Label ID="lblAviso" runat="server"></asp:Label>
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

