<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="~/Controller/ListarCliente.aspx.cs" Inherits="ListarCliente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<div class="container">
    <div class="row">
        <div class="col-xs-12">
            <h2>Clientes</h2>
            <br />
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12">
            <asp:GridView ID="GridViewListarCLiente" runat="server" CssClass="table table-bordered" EmptyDataText="No Hay Clientes asociados" AutoGenerateColumns="False" DataSourceID="SqlDataSourceListarCliente">
                <Columns>
                   <asp:BoundField DataField="ID_CONTRATO" HeaderText="ID Contrato" SortExpression="ID_CONTRATO" />
                    <asp:TemplateField HeaderText="Rut Cliente" SortExpression="Rut">
                    <ItemTemplate>
                        <asp:Label ID="Rut" runat="server" Text='<%#Eval("NUMRUT_CLI")+ "-" + Eval("DRUT_CLI")%>' ></asp:Label>
                    </ItemTemplate>
                    </asp:TemplateField> 
                    <asp:TemplateField HeaderText="Nombre Cliente" SortExpression="Nombre">
                        <ItemTemplate>
                            <asp:Label ID="Nombre" runat="server" Text='<%#Eval("NOMBRE_CLIE")+ " " + Eval("APELLIDO_PAT_CLI")+" "+ Eval("APELLIDO_MAT_CLI")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="MAIL_CLI" HeaderText="Mail" SortExpression="MAIL_CLI" />
                     <asp:TemplateField HeaderText="Activo" SortExpression="Activo">
                        <ItemTemplate>
                            <asp:Label Visible='<%# Eval("Activo").ToString().Equals("T") %>' Text="<div class='progreso btn-success'>Habilitado</div>" runat="server" />
                            <asp:Label Visible='<%# Eval("Activo").ToString().Equals("F") %>' Text="<div class='progreso btn-danger'>No Habilitado</div>" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="DIRECCION_CLI" HeaderText="Dirección" SortExpression="DIRECCION_CLI" />
                    <asp:BoundField DataField="FECHA_NACIMIENTO_CLI" HeaderText="Fecha de Nacimiento" SortExpression="FECHA_NACIMIENTO_CLI" DataFormatString='{0:MM-dd-yyyy}' />
                    <asp:BoundField DataField="FONO_CLI" HeaderText="Teléfono" SortExpression="FONO_CLI" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceListarCliente" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT ONTOUR.CLIENTE.NUMRUT_CLI, ONTOUR.CLIENTE.DRUT_CLI, ONTOUR.CONTRATO.ID_CONTRATO, ONTOUR.CLIENTE.NOMBRE_CLIE, ONTOUR.CLIENTE.APELLIDO_PAT_CLI, ONTOUR.CLIENTE.APELLIDO_MAT_CLI, ONTOUR.CLIENTE.MAIL_CLI, ONTOUR.CLIENTE.ACTIVO, ONTOUR.CLIENTE.DIRECCION_CLI, ONTOUR.CLIENTE.FECHA_NACIMIENTO_CLI, ONTOUR.CLIENTE.FONO_CLI FROM ONTOUR.CLIENTE INNER JOIN ONTOUR.CONTRATO ON ONTOUR.CLIENTE.NUMRUT_CLI = ONTOUR.CONTRATO.NUMRUT_CLI_TITULAR"></asp:SqlDataSource>
        </div>
    </div>
    </div>
</asp:Content>

