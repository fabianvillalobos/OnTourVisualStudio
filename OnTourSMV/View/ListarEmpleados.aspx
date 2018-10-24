﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="~/Controller/ListarEmpleados.aspx.cs" Inherits="ListarEmpleados" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container">
        <div class="row">
            <h2>Empleados</h2>
            <br />
            <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered" EmptyDataText="No Hay empleados asociados" AutoGenerateColumns="False" DataKeyNames="NUMRUT_EMP" DataSourceID="ListadoEmpleados">
                <Columns>
                    <asp:BoundField DataField="NUMRUT_EMP" HeaderText="Rut" ReadOnly="True" SortExpression="NUMRUT_EMP" />
                    <asp:BoundField DataField="DRUT_EMP" HeaderText="DRUT_EMP" SortExpression="DRUT_EMP" />
                    <asp:BoundField DataField="NOMBRE_EMP" HeaderText="NOMBRE_EMP" SortExpression="NOMBRE_EMP" />
                    <asp:BoundField DataField="APELLIDO_PAT_EMP" HeaderText="APELLIDO_PAT_EMP" SortExpression="APELLIDO_PAT_EMP" />
                    <asp:BoundField DataField="APELLIDO_MAT_EMP" HeaderText="APELLIDO_MAT_EMP" SortExpression="APELLIDO_MAT_EMP" />
                    <asp:BoundField DataField="MAIL_LABORAL" HeaderText="MAIL_LABORAL" SortExpression="MAIL_LABORAL" />
                    <asp:BoundField DataField="DIRECCION_EMP" HeaderText="DIRECCION_EMP" SortExpression="DIRECCION_EMP" />
                    <asp:BoundField DataField="ACTIVO" HeaderText="ACTIVO" SortExpression="ACTIVO" />
                    <asp:BoundField DataField="ID_USR" HeaderText="ID_USR" SortExpression="ID_USR" />
                    <asp:BoundField DataField="FECHA_NACIMIENTO_EMP" HeaderText="FECHA_NACIMIENTO_EMP" SortExpression="FECHA_NACIMIENTO_EMP" DataFormatString='{0:MM-dd-yyyy}' />
                    <asp:BoundField DataField="FONO_EMP" HeaderText="FONO_EMP" SortExpression="FONO_EMP" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="ListadoEmpleados" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;EMPLEADO&quot;"></asp:SqlDataSource>
        </div>
    </div>
</asp:Content>

