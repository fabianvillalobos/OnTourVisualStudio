﻿<%@ Page Title="" Language="C#" MasterPageFile="../MasterPage.master" AutoEventWireup="true" CodeFile="../Controller/NuevaTransferencia.aspx.cs" Inherits="NuevaTransferencia" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<div class="container">
    <div class="row">
        <div class="col-xs-6">
            <h3>Nueva transferencia</h3>
            <p>Realiza un depósito bancario<p>
        </div>
        <div class="col-xs-6 text-right padding-top-20">
                <asp:Button ID="btnVolverATransacciones" runat="server" CssClass="btn btn-success" Text="Volver a Transacciones" OnClick="btnVolverATransacciones_Click" />
            </div>
    </div>
    <div class="row">
        <div class="col-xs-12">
            <h4><span class="badge bg-success">1</span> Detalla tu transferencia</h4>
        </div>
        <div class="col-xs-3">
            <asp:label runat="server" text="Cantidad"></asp:label>
            <input runat="server" id="txtMonto" type="number" placeholder="$0" class="form-control" required/>            
        </div>
        <div class="col-xs-5">
            <asp:label text="Tipo de transacción:" runat="server" />
            <asp:DropDownList ID="DropDownListTipo" class="form-control" runat="server" DataSourceID="SqlDataSource2" DataTextField="DESC_TRANSACCION" DataValueField="ID_TIPO_TRANSACCION">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;ID_TIPO_TRANSACCION&quot;, &quot;DESC_TRANSACCION&quot; FROM &quot;TIPO_TRANSACCION&quot;"></asp:SqlDataSource>
            <small><strong>Individual:</strong> El dinero depositado va directamente a tu cuenta del contrato.<br /><strong>Grupal:</strong> El dinero es repartido hacia todas las cuentas de los pasajeros del grupo.</small>
        </div>
        <div class="col-xs-3 padding-top-20">
            <asp:LinkButton id="continuar" runat="server" OnClick="Continuar_Click" class="btn btn-success"><i class="glyphicon glyphicon-arrow-right"></i> Continuar</asp:LinkButton>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12">
            <div class="separador"></div>
        </div>
    </div>

    <asp:Panel ID="pasoError" runat="server">
        <div class="row">
            <div class="col-xs-6">
                <div class="alert alert-danger">
                    <h4>Hay un problema con los datos</h4>
                    <p>El monto a transferir excede el valor del contrato</p>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-12">
                <div class="separador"></div>
            </div>
        </div>
    </asp:Panel>

    <asp:Panel ID="pasoDos" runat="server">
        <div class="row">
            <div class="col-xs-6">
                <h4><span class="badge bg-success">2</span> Transferir</h4>
                <p>Realiza el depósito a la siguiente cuenta:</p>
                <table class="table table-bordered">
                    <tr>
                        <td>Banco</td>
                        <td>Banco Falabella</td>
                    </tr>
                    <tr>
                        <td>Tipo</td>
                        <td>Cuenta Corriente</td>
                    </tr>
                    <tr>
                        <td>Nº</td>
                        <td>24500-03</td>
                    </tr>
                    <tr>
                        <td>Nombre:</td>
                        <td>ONTOUR SPA</td>
                    </tr>
                    <tr>
                        <td>Email:</td>
                        <td>recaudacion@ontour.cl</td>
                    </tr>
                </table>
            </div>
            <div class="col-xs-6">
                <h4><span class="badge bg-success">3</span> Notificar</h4>
                <p>Adjunta tu comprobate</p>
                <input id="comprobante" runat="server" type="file" class="form-control" />
                <br />
                <asp:LinkButton id="btnNotificar" runat="server" OnClick="Notificar_Click" class="btn btn-success"><i class="glyphicon glyphicon-ok"></i> Confirmar transacción</asp:LinkButton>
            </div>
        </div>
    </asp:Panel>

</div>
</asp:Content>