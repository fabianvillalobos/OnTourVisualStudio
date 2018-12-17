<%@ Page Title="" Language="C#" MasterPageFile="../MasterPage.master" AutoEventWireup="true" CodeFile="../Controller/NuevaTransferencia.aspx.cs" Inherits="NuevaTransferencia" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<div class="container">
    <div class="row">
        <div class="col-xs-12">
            <h3>Nueva transferencia</h3>
            <p>Realiza un depósito bancario<p>
            <br />
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12">
            <h4><span class="badge">1</span> Detalla tu transferencia</h4>
        </div>
        <div class="col-xs-3">
            <asp:label runat="server" text="Cantidad"></asp:label>
            <input type="number" placeholder="$0" />
        </div>
        <div class="col-xs-3">
            <asp:label text="Tipo de transacción:" runat="server" />
            <asp:DropDownList ID="DropDownListTipo" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="DESC_TRANSACCION" DataValueField="ID_TIPO_TRANSACCION">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;ID_TIPO_TRANSACCION&quot;, &quot;DESC_TRANSACCION&quot; FROM &quot;TIPO_TRANSACCION&quot;"></asp:SqlDataSource>
        </div>
        <div class="col-xs-3">
            <input type="submit" class="btn btn-primary" value="Continuar" />
        </div>
    </div>
    <div class="row">
        <div class="col-xs-6">
            <h4><span class="badge">2</span> Transferir</h4>
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
            <h4><span class="badge">3</span> Notificar</h4>
            <p>Adjunta tu comprobate</p>
            <input type="file" />
            <input type="submit" value="Notificar" />
        </div>
    </div>
</div>
</asp:Content>