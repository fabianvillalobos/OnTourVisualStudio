<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="~/Controller/ModificarContrato.aspx.cs" Inherits="View_ModificarContrato" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            height: 527px;
        }
    </style>
</asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <center class="auto-style1">
      <h1>Modificar Contrato <%=Request.QueryString["ID_CONTRATO"] %></h1>
    <br/>

    <br/>
    <asp:GridView ID="GridViewContratos" runat="server" DataSourceID="LinqDataSourceListarContratos" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="ID_CONTRATO" HeaderText="ID_CONTRATO" SortExpression="ID_CONTRATO" />
            <asp:BoundField DataField="FECHA_INICIO" HeaderText="FECHA_INICIO" SortExpression="FECHA_INICIO" />
            <asp:BoundField DataField="FECHA_TERMINO" HeaderText="FECHA_TERMINO" SortExpression="FECHA_TERMINO" />
            <asp:BoundField DataField="META" HeaderText="META" SortExpression="META" />
            <asp:BoundField DataField="MONTO_RESERVA" HeaderText="MONTO_RESERVA" SortExpression="MONTO_RESERVA" />
            <asp:BoundField DataField="ESTADO" HeaderText="ESTADO" SortExpression="ESTADO" />
            <asp:BoundField DataField="NUMRUT_EMP" HeaderText="NUMRUT_EMP" SortExpression="NUMRUT_EMP" />
            <asp:BoundField DataField="NUMRUT_CLI_TITULAR" HeaderText="NUMRUT_CLI_TITULAR" SortExpression="NUMRUT_CLI_TITULAR" />
        </Columns>

    </asp:GridView>

     <asp:LinqDataSource ID="LinqDataSourceListarContratos" runat="server" ContextTypeName="EntitiesOnTour" EntityTypeName="" TableName="CONTRATO" AutoGenerateOrderByClause="True" Where="ID_CONTRATO == @ID_CONTRATO">
         <WhereParameters>
            <asp:QueryStringParameter Name="ID_CONTRATO" QueryStringField="ID_CONTRATO" Type="Int32" />
        </WhereParameters>
    </asp:LinqDataSource>

    <br/>
    <br/>
    
        <table style="width: 75%;">
            <tr>
                <td><asp:Label ID="LabelFecInicio" runat="server" Text="Fecha Inicio:"></asp:Label></td>
                <td><asp:TextBox ID="txtInicio" runat="server"></asp:TextBox>
                </td>
                <td><asp:Label ID="LabelFecTermino" runat="server" Text="Fecha Termino:"></asp:Label></td>
                <td><asp:TextBox ID="txtFin" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td><asp:Label ID="LabelMeta" runat="server" Text="Meta:"></asp:Label></td>
                <td><asp:TextBox ID="txtMeta" runat="server" TextMode="Number" MaxLength="9" Rows="1"></asp:TextBox>
                </td>
                <td><asp:Label ID="LabelMonto" runat="server" Text="Monto:"></asp:Label></td>
                <td><asp:TextBox ID="txtMonto" runat="server" TextMode="Number" MaxLength="9" Rows="1"></asp:TextBox>
                </td>
                <td><asp:Label ID="LabelEstado" runat="server" Text="Estado:"></asp:Label></td>
                <td>
                    <asp:DropDownList ID="DropDownListEstado" runat="server">
                        <asp:ListItem Value="1">Vigente</asp:ListItem>
                        <asp:ListItem Value="2">No Vigente</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td colspan="1"><asp:Label ID="LabelEmpleado" runat="server" Text="Empleado:"></asp:Label></td>
                <td colspan="2"><asp:DropDownList ID="DropDownListEmpleado" runat="server" DataSourceID="SqlDataSource1" DataTextField="NOMBRE_EMP" DataValueField="NUMRUT_EMP"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;NUMRUT_EMP&quot;, &quot;NOMBRE_EMP&quot; FROM &quot;EMPLEADO&quot;"></asp:SqlDataSource>
                </td>
                <td colspan="1"><asp:Label ID="LabelTitular" runat="server" Text="Titular"></asp:Label></td>
                <td colspan="2"><asp:DropDownList ID="DropDownListTitular" runat="server" DataSourceID="SqlDataSource2" DataTextField="NOMBRE_CLIE" DataValueField="NUMRUT_CLI"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;NUMRUT_CLI&quot;, &quot;NOMBRE_CLIE&quot; FROM &quot;CLIENTE&quot;"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td colspan="3"><asp:Button ID="btnCargar" runat="server" Text="Cargar Datos" OnClick="btnCargar_Click"></asp:Button></td>
                <td colspan="3"><asp:Button ID="btnModificar" runat="server" Text="Modificar" OnClick="btnModificar_Click"></asp:Button></td>
            </tr>
            <tr>
                <td colspan="6"><asp:Label ID="LabelAviso" runat="server" Text=""></asp:Label></td>
            </tr>
        </table>
    </center>
</asp:Content>

